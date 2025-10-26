<?php

namespace App\Models\Hooks\Api;

use App\Helpers\CustomHelper;
use Bepsvpt\Blurhash\Facades\BlurHash;

class BankDetailHook
{
    private $_model,  $except_update_params = [
        'slug',
        'user_id',
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
//        $base_url = \Storage::url('');

//        $query->selectRaw("CONCAT('$base_url', user_bank_details.front_image) as front_image")
//                ->selectRaw("CONCAT('$base_url', user_bank_details.back_image) as back_image")
        $query->where('user_id', $request->user->id);
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
        $postdata['user_id'] = $request->user->id;
        $postdata['slug']    = uniqid() . time();

        if(!empty($request['front_image']) && !empty($request['back_image'])){
//            $postdata['front_image'] = CustomHelper::uploadMedia('bank_details',$request['front_image']);
//            $postdata['back_image'] = CustomHelper::uploadMedia('bank_details',$request['back_image']);

            [$width, $height] = getimagesize($request['front_image']);
            $post['front_image'] = array(
                'image_path' => CustomHelper::uploadMedia('bank_details',$request['front_image']),
                'image_width' => $width,
                'image_height' => $height,
                'blur_hash' => BlurHash::encode($request['front_image'])
            );

            $postdata['front_image'] =  $post['front_image'];

            [$width, $height] = getimagesize($request['back_image']);
            $post['back_image'] = array(
                'image_path' => CustomHelper::uploadMedia('bank_details',$request['back_image']),
                'image_width' => $width,
                'image_height' => $height,
                'blur_hash' => BlurHash::encode($request['back_image'])
            );

            $postdata['back_image'] =  $post['back_image'];
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
        //Your code here
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

        if(!empty($request['front_image'])){
            [$width, $height] = getimagesize($request['front_image']);
            $post['front_image'] = array(
                'image_path' => CustomHelper::uploadMedia('bank_details',$request['front_image']),
                'image_width' => $width,
                'image_height' => $height,
                'blur_hash' => BlurHash::encode($request['front_image'])
            );

            $postData['front_image'] =  $post['front_image'];
        }

        if(!empty($request['back_image'])){
            [$width, $height] = getimagesize($request['back_image']);
            $post['back_image'] = array(
                'image_path' => CustomHelper::uploadMedia('bank_details',$request['back_image']),
                'image_width' => $width,
                'image_height' => $height,
                'blur_hash' => BlurHash::encode($request['back_image'])
            );

            $postData['back_image'] =  $post['back_image'];
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
        return 'BankDetailHook' . md5(implode('',$cache_params));
    }
}
