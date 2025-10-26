<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use App\Models\Category;
use App\Models\KeyWord;
use App\Models\Service;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Bepsvpt\Blurhash\Facades\BlurHash;
class ServiceHook
{
    private $_model, $except_update_params = [
                    'slug',
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
//        $base_url = Storage::url('');
        $query->select('services.*', DB::raw('count(item.id) as order_count'))
            ->leftJoin('order_items as item', 'services.id', '=', 'item.item_id')
            ->groupBy('services.id');

        if($user->user_group_id != 1){
            $query->where('services.user_id', $user->id);
//            $query->where('services.status', 1);
            $query->orderby('services.created_at', 'desc');
        }

        if(isset($request->user_id)){
            $query->where('services.user_id', $request->user_id);
            $query->orderby('services.created_at', 'desc');
            $query->where('services.status', 1);
        }


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
        $category = Category::where('title', $request->user->business_category)->first();
        $postdata['title']        = $request->title;
        $postdata['slug']         = $this->_model::generateUniqueSlug($request['title']);
        $postdata['category_id']  = 1;
        $postdata['user_id']      = $request->user->id;
        $postdata['description']  = $request->description;
        $postdata['price']        = $request->price;
        $postdata['status']       = 1;

          if(!empty($request['image_url'])){
//              $postdata['image_url'] = CustomHelper::uploadMedia('services',$request['image_url']);

              [$width, $height] = getimagesize($request['image_url']);
              $post['image_url'] = array(
                  'image_path' => CustomHelper::uploadMedia('services',$request['image_url']),
                  'image_width' => $width,
                  'image_height' => $height,
                  'blur_hash' => BlurHash::encode($request['image_url'])
              );

              $postdata['image_url'] =  $post['image_url'];
          };
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
        //Your code here
        if (isset($request['keywords'])) {
            if(count($record->serviceKeyWords)>0){
                $record->serviceKeyWords()->delete();
            }
            foreach ($request['keywords'] as $keyword) {
                $data = [
                    'module_id'=> $record->id,
                    'module'=> 'Service keyword',
                    'user_id'=> $request->user->id,
                    'keyword' => $keyword
                ];
                KeyWord::create($data);
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

//        if(!empty($postData['image_url'])){
//            $postData['image_url'] = CustomHelper::uploadMedia('services',$request['image_url']);
//        }else{
//            $postdata['image_url']  = 'services/default_image.png';
//        }

        if(!empty($postData['image_url'])){
//              $postData['image_url'] = CustomHelper::uploadMedia('services',$request['image_url']);

            [$width, $height] = getimagesize($request['image_url']);
            $post['image_url'] = array(
                'image_path' => CustomHelper::uploadMedia('services',$request['image_url']),
                'image_width' => $width,
                'image_height' => $height,
                'blur_hash' => BlurHash::encode($request['image_url'])
            );

            $postData['image_url'] =  $post['image_url'];
        };
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
        $record = Service::where('slug',$slug)->first();
        if (isset($request['keywords']) && !empty($request['keywords'])) {
            if(count($record->serviceKeyWords)>0){
                $record->serviceKeyWords()->delete();
            }
            foreach ($request['keywords'] as $keyword) {
                if($keyword != "") {
                    $data = [
                        'module_id' => $record->id,
                        'module' => 'Service keyword',
                        'user_id' => $request->user->id,
                        'keyword' => $keyword
                    ];
                    KeyWord::create($data);
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
        $cache_params = $request->except(['user','api_token']);
        return 'ServiceHook' . md5(implode('',$cache_params));
    }
}
