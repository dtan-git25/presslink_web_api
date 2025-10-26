<?php

namespace App\Http\Resources;

use App\Models\User;
use Bepsvpt\Blurhash\Facades\BlurHash;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Review as ReviewResource;
class PublicUser extends JsonResource
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
           'id'                => $this->id,
           'user_group_id'      => $this->user_group_id,
           'name'              => $this->name,
           'slug'              => $this->slug,
           'email'             => $this->email,
           'mobile_no'         => $this->mobile_no,
           'business_category' => $this->business_category_title,
           'business_name'     => $this->business_name,
           'business_timings'  => $this->business_timings,
           'about_business'    => $this->about_business,
           'latitude'          => $this->latitude,
           'longitude'         => $this->longitude,
           'rating'            => $this->rating,
           'total_ratings'     => $this->total_ratings,
           'total_reviews'     => $this->total_reviews,
           'image_url'         => (Storage::exists($this->image_url)) ? Storage::url($this->image_url) : Storage::url('users/user_default.png'),
           'image_url_blur'    => ($this->image_url_blur!=null) ? $this->image_url_blur : 'LQQ]+wj[~qof_3j[j[j[WBfQIUay',
           'cover_image_url'   => (Storage::exists($this->cover_image_url)) ? Storage::url($this->cover_image_url) : Storage::url('users/user_default.png'),
//           'image_url_blur'     => (Storage::exists($this->image_url_blur)) ? BlurHash::encode(Storage::path($this->image_url)) : BlurHash::encode(Storage::path('users/user_default.png')),
           'keywords'          => $this->userKeyWords->pluck('keyword'),
           'reviews'           => ReviewResource::collection($this->whenLoaded('providerReviews'))
       ];
    }
}
