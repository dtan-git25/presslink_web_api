<?php

namespace App\Http\Resources;

use Bepsvpt\Blurhash\Facades\BlurHash;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class Service extends JsonResource
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
           'id'          => $this->id ,
           'category_id' => $this->category_id,
           'category_name' => $this->category->title,
           'user_id '    => $this->user_id ,
           'title'       => $this->title,
           'slug'        => $this->slug,
           'image'       => ($this->image_url)? array('image_src'=> Storage::url($this->image_url['image_path']),'image_info'=>$this->image_url):null,
           'description' => $this->description,
           'price'       => $this->price,
           'status'      => $this->status,
           'created_at'  => $this->created_at,
           'order_count' => $this->order_count,
           'keywords'    => $this->serviceKeyWords->pluck('keyword'),
       ];
    }
}
