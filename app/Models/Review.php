<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Review extends Model
{
    use CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'reviews';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['slug', 'user_id', 'provider_id', 'order_id', 'rating', 'feedback'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * It is used to enable or disable DB cache record
     * @var bool
     */
    protected $__is_cache_record = false;

    /**
     * @var
     */
    protected $__cache_signature;

    /**
     * @var string
     */
    protected $__cache_expire_time = 1; //days

    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function provider(){
        return $this->belongsTo(User::class, 'provider_id', 'id');
    }

    public static function userReviewUpdate($params){
        $order = Order::find($params['order_id']);
        $user  = User::find($order->provider_id);
        if($params['is_delete'] == 1){
            $reviews = DB::table('reviews')
                ->selectRaw('avg(reviews.rating) as rating, sum(reviews.rating) as total_rating')->where('reviews.provider_id', $order->provider_id)->first();
            $user->update(['rating' => $reviews->rating, 'total_ratings'=>$reviews->total_rating]);
        }else{
            $reviews = DB::table('reviews')
                ->selectRaw('avg(reviews.rating) as rating, sum(reviews.rating) as total_rating, count(reviews.id) as reviews_count')->where('reviews.provider_id', $order->provider_id)->first();
            $user->update(['rating' => $reviews->rating, 'total_ratings'=>$reviews->total_rating, 'total_reviews'=>$reviews->reviews_count]);

        }
//        $total_reviews = $order->provider->userReviews()->count();
//        $total_rating = $order->provider->userReviews()->pluck('rating')->sum();
//        $avg = $total_rating/$total_reviews;
//        $user->update(['rating' => $avg, 'total_ratings'=>$total_rating, 'total_reviews'=>$total_reviews]);

    }


}
