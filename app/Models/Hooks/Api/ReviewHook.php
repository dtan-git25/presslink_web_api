<?php

namespace App\Models\Hooks\Api;

use App\Models\Order;
use App\Models\Review;
use App\Models\User;

class ReviewHook
{
    private $_model;

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

        if(isset($request->user_id)){
            $query->where('reviews.provider_id', $request->user_id);
            $query->orderby('reviews.created_at', 'desc');
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
        $request->merge(['is_delete' => 0]);
        $userReview = Review::where('user_id', $request->user->id)->where('order_id', $postdata['order_id'])->first();
        if(isset($userReview->id)){
            $userReview->delete();
            $request->merge(['is_delete' => 1]);
        }
        $order = Order::find($postdata['order_id']);
        $postdata['user_id'] = $request->user->id;
        $postdata['provider_id'] = $order->provider_id;
        $postdata['slug'] = uniqid() . time();
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
//        dd($request->all());
        //Your code here
//        $order = Order::find($request['order_id']);
//        $user  = User::find($order->provider_id);
        $review = Review::userReviewUpdate($request->all());
//        $total_reviews = $order->provider->userReviews()->count();
//        $total_rating = $order->provider->userReviews()->pluck('rating')->sum();
//        $avg = $total_rating/$total_reviews;
//        $user->update(['rating' => $avg, 'total_ratings'=>$total_rating, 'total_reviews'=>$total_reviews]);
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
        return 'ReviewHook' . md5(implode('',$cache_params));
    }
}
