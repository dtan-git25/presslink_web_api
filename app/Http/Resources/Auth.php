<?php

namespace App\Http\Resources;

use App\Http\Resources\Review as ReviewResource;
use Bepsvpt\Blurhash\Facades\BlurHash;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class Auth extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
       return [
           'id'                 => $this->id,
           'user_group_id'      => $this->user_group_id,
           'stripe_cus_id'      => $this->stripe_cus_id,
           'name'               => $this->name,
           'slug'               => $this->slug,
           'email'              => $this->email,
           'mobile_no'          => $this->mobile_no,
           'image_url'          => ($this->image_url!=null)?Storage::url($this->image_url):Storage::url('users/user_default.png'),
           'cover_image_url'    => ($this->cover_image_url!=null)?Storage::url($this->cover_image_url):Storage::url('users/user_default.png'),
           'image_url_blur'    => ($this->image_url_blur!=null) ? $this->image_url_blur : 'LQQ]+wj[~qof_3j[j[j[WBfQIUay',
//           'image_url_blur'     => (!empty($this->image_url)) ? BlurHash::encode(Storage::path($this->image_url)) : BlurHash::encode(Storage::path('users/user_default.png')),
           'cover_image_url_blur' => (!empty($this->cover_image_url)) ? BlurHash::encode(Storage::path($this->cover_image_url)) : BlurHash::encode(Storage::path('users/user_default.png')),
           'status'             => $this->status,
           'rating'             => $this->rating,
           'total_ratings'      => $this->total_ratings,
           'total_reviews'      => $this->total_reviews,
           'total_earnings'     => $this->total_earnings,
           'total_remaining'    => $this->total_remaining,
           'business_category'  => $this->business_category_title,
           'business_name'      => $this->business_name,
           'business_timings'   => $this->business_timings,
           'about_business'     => $this->about_business,
           'is_email_verify'    => $this->is_email_verify,
           'is_mobile_verify'   => $this->is_mobile_verify,
           'country'            => $this->country,
           'state'              => $this->state,
           'city'               => $this->city,
           'zipcode'            => $this->zipcode,
           'address'            => $this->address,
           'latitude'           => $this->latitude,
           'longitude'          => $this->longitude,
           'api_token'          => $this->api_token,
           'device_type'        => $this->device_type,
           'device_token'       => $this->device_token,
           'platform_type'      => $this->platform_type,
           'platform_id'        => $this->platform_id,
           'created_at'         => $this->created_at,
           'keywords'           => $this->userKeyWords->pluck('keyword'),
           'reviews'           => ReviewResource::collection($this->whenLoaded('providerReviews'))
           ];
    }
}
