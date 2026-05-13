<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Models\KeyWord;
use App\Models\User;
use App\Models\UserApiToken;
use Bepsvpt\Blurhash\Facades\BlurHash;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Libraries\Payment\Stripe\Stripe;

class UserHook
{
    private $_model,
            $except_update_params = [
                'username',
                'slug',
                'email',
                'mobile_no',
                'password',
                'is_email_verify',
                'is_mobile_verify',
                'mobile_otp',
                'email_otp',
                'remember_token',
                'is_email_verify',
                'is_mobile_verify',
                'mobile_otp',
                'email_otp',
                'remember_token',
            ];

    public function __construct($model)
    {
        $this->_model = $model;
    }

    /*
   | ----------------------------------------------------------------------
   | Hook for manipulate query of index result
   | ----------------------------------------------------------------------
   | @query   = current sql query
   | @request = laravel http request class
   |
   */
    public function hook_query_index(&$query,$request, $slug=NULL) {
        //Your code here
        $user = $request->user;
        $base_url = \Storage::url('');
//
        $query->select('users.*','cat.title as business_category_title')
                ->leftJoin('categories as cat', 'users.business_category', '=', 'cat.id');

        //check same user
        if( $request['user']->slug == $slug ){
            $query->selectRaw('uat.api_token,uat.device_type,uat.device_token,uat.platform_type,uat.platform_id')
//                ->selectRaw("CONCAT('$base_url', users.cover_image_url) as cover_image_url")
//                ->selectRaw("CONCAT('$base_url', users.image_url) as image_url")
                ->join('user_api_token AS uat','uat.user_id','=','users.id')
                ->where('uat.api_token',$request['api_token']);
        }
        if( $slug == ''){
            $query->where('users.id','!=',$request['user']->id);
        }

        if ($user->user_group_id != 2 && $slug==null){
            $query->where('users.user_group_id',2);
            $query->where('users.status',1);
        }

        if (isset($request['filter'])) {
            if(isset($request['category_ids'])){
                $query->with('businessCategory')->whereIn('users.business_category', $request['category_ids']);
            }

            if(isset($request['ratings'])){
                $query->where('users.rating', 'LIKE', "{$request['ratings']}%");
            }

            if(!empty($request->latitude) && !empty($request->longitude)  && !empty($request->radius)){

                $haversine = "(6371 * acos (cos ( radians($request->latitude) )
                    * cos( radians(`latitude`) )
                    * cos( radians(`longitude`) - radians($request->longitude) )
                    + sin ( radians($request->latitude) )
                    * sin( radians(`latitude`) )
                ))";

                $query->selectRaw("{$haversine} AS distance")
                    ->whereRaw("{$haversine} < ?", [$request->radius])
                    ->orderby('distance', 'asc');

            }

        }

        if (isset($request['search'])) {

            $query->selectRaw("count(users.id) as user_count");

            $query->join('keywords', function ($join) use ($request) {
                $join->on('keywords.user_id', '=', 'users.id')
                    ->where(function($query) use ($request){
                        $query->orWhere('keywords.keyword', 'LIKE', "%{$request['search']}%");
                        $query->orWhere('users.business_name', 'LIKE', "%{$request['search']}%");
                    });

            })->groupBy('users.id');
        }

        $query->with('providerReviews');

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postdata)
    {
        //delete un-verified account
//        if( env('VERIFICATION_TYPE') != 'none'){
//            if( env('VERIFICATION_TYPE') == 'email'){
//                $this->_model::where('email',$postdata['email'])->forceDelete();
//            }
//            if( env('VERIFICATION_TYPE') == 'mobile'){
//                $this->_model::where('mobile_no',$postdata['mobile_no'])->forceDelete();
//            }
//        }

        //set data
        $postdata['user_group_id'] = $request['user_role'];
        $postdata['username']   = $this->_model::generateUniqueUserName($request['name']);
        $postdata['slug']       = $postdata['username'];
        $postdata['name']       = $request['name'];
        $postdata['password']   = Hash::make($request['password']);
        $postdata['created_at'] = Carbon::now();

        if(!empty($request['image_url'])){
            $postdata['image_url'] = CustomHelper::uploadMedia('users',$request['image_url']);
            $postdata['image_url_blur'] = BlurHash::encode(Storage::path($postdata['image_url']));
        }else{
            $postdata['image_url'] = 'users/user_default.png';
        }

        if($request['user_role'] != 1){

            $postdata['business_category'] = $request['business_category'];
            $postdata['business_name'] = $request['business_name'];
            $postdata['business_timings'] = $request['business_timings'];
            $postdata['about_business'] = $request['about_business'];
            $postdata['address'] = $request['address'];
            $postdata['country'] = $request['country'];
            $postdata['city'] = $request['city'];
            $postdata['state'] = $request['state'];
            $postdata['zipcode'] = $request['zipcode'];
            $postdata['status'] = ($request['user_role']==1)?'1':'0';
//            $postdata['is_approve'] = ($request['user_role']==1)?'1':'0';

            if(!empty($request['cover_image_url'])){
                $postdata['cover_image_url'] = CustomHelper::uploadMedia('users',$request['cover_image_url']);
            }
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after add public static function called
    | ----------------------------------------------------------------------
    | @record
    |
    */
    public function hook_after_add($request,$record)
    {
        $api_token  = UserApiToken::generateApiToken($record->id,$request->ip(),$request->header('token'),$record->created_at);
        $request['api_token'] = $api_token;
        $request['user']      = $record;
        //insert api token
        \DB::table('user_api_token')
            ->insert([
                'user_id'       => $record->id,
                'api_token'     => $api_token,
                'refresh_token' => UserApiToken::generateRefreshToken($record->id),
                'udid'          => $request->header('token'),
                'device_type'   => $request['device_type'],
                'device_token'  => $request['device_token'],
                'platform_type' => !empty($request['platform_type']) ? $request['platform_type'] : 'custom',
                'platform_id'   => !empty($request['platform_id']) ? $request['platform_id'] : NULL,
                'ip_address'    => $request->ip(),
                'user_agent'    => $request->server('HTTP_USER_AGENT'),
                'created_at'    => Carbon::now()
            ]);

        if(isset($request['user_role']) && $request->user_role != "") {
            //send verification email
            if (env('VERIFICATION_TYPE') == 'email') {
                try {
                    $mail_params['USERNAME'] = $record->name;
                    $mail_params['LINK'] = route('verifyEmail', ['name' => encrypt($record->email)]);
                    $mail_params['YEAR'] = date('Y');
                    $mail_params['APP_NAME'] = env('APP_NAME');
                    CustomHelper::sendMail($record->email, 'user_registration', $mail_params);
                } catch (\Exception $e) {
                    \Log::warning('Registration email failed: ' . $e->getMessage());
                }
            }
//            $record->update(['is_email_verify'=>1, 'email_verify_at'=>Carbon::now()]);
        }

        if($request['user_role'] == 1){
            $stripe = new Stripe;
            $stripe_cus_id = $stripe->createCustomer([
                'name' => $record->name,
                'email' => $record->email,
            ]);
            if (($stripe_cus_id['code'] ?? 0) == 200) {
                $record->stripe_cus_id = $stripe_cus_id['data']['customer_id'];
                $record->update();
            }
        }

        $user = $request['user'];
        if($request['user_role'] != 1) {
            if (isset($request['keywords'])) {
                if(count($user->userKeyWords)>0){
                    $user->userKeyWords()->delete();
                }
                foreach ($request['keywords'] as $keyword) {
                    $data = [
                        'module_id'=>$user->id,
                        'module'=>'User keyword',
                        'user_id'=>$user->id,
                        'keyword' => $keyword
                    ];
                    KeyWord::create($data);
                }
            }
        }

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before update data is execute
    | ----------------------------------------------------------------------
    | @request  = http request object
    | @postdata = input post data
    | @id       = current id
    |
    */
    public function hook_before_edit($request, $slug, &$postData)
    {
        foreach( $postData as $key => $value ){
            if( in_array($key,$this->except_update_params) )
                unset($postData[$key]);
        }
        if( !empty($postData['image_url']) ){
            $postData['image_url'] = CustomHelper::uploadMedia('users',$postData['image_url']);
            $postData['image_url_blur'] = BlurHash::encode(Storage::path($postData['image_url']));
        }

        if(!empty($request['cover_image_url'])){
            $postData['cover_image_url'] = CustomHelper::uploadMedia('users',$request['cover_image_url']);
        }
        if($request['user_role'] != 2){
            unset($postData['business_category'],
                $postData['business_name'],
                $postData['business_timings'],
                $postData['about_business'],
//                $postData['address'],
                $postData['country'],
                $postData['city'],
                $postData['state'],
                $postData['zipcode'],
            );
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after edit public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$slug    = $slug
    |
    */
    public function hook_after_edit($request, $slug) {
        //Your code here
        $user = User::where('slug',$slug)->first();
        if($user->user_group_id != 1) {
            if (isset($request['keywords']) && !empty($request['keywords'])) {
                if(count($user->userKeyWords)>0){
                    $user->userKeyWords()->delete();
                }
                foreach ($request['keywords'] as $keyword) {
                    if($keyword != ""){
                        $data = [
                            'module_id'=>$user->id,
                            'module'=>'User keyword',
                            'user_id'=>$user->id,
                            'keyword' => $keyword
                        ];
                        KeyWord::create($data);
                    }
                }
            }
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command before delete public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$id      = record id = int / array
    |
    */
    public function hook_before_delete($request, $slug) {
        //Your code here

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after delete public static function called
    | ----------------------------------------------------------------------
    | @$request       = Http request object
    | @records        = deleted records
    |
    */
    public function hook_after_delete($request,$records) {
        //Your code here

    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->isMethod('post') ? [] : $request->except(['user','api_token']);
        return 'users_api_' . md5(implode('',$cache_params));
    }
}
