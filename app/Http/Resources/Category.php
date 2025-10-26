<?php

namespace App\Http\Resources;

use Bepsvpt\Blurhash\Facades\BlurHash;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Service as ServiceResource;
use App\Http\Resources\PublicUser as UserResource;
use Illuminate\Support\Facades\Storage;

class Category extends JsonResource
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
           'id' => $this->id,
           'title' => $this->title,
           'slug' => $this->slug,
           'image_url' => $this->image_url,
           'image_url_blur' => (Storage::exists($this->image_url)) ? BlurHash::encode(Storage::path($this->image_url)) : BlurHash::encode(Storage::path('category/default.png')),
//           'providers' => UserResource::collection($this->providers),
//           'services' => ServiceResource::collection($this->whenLoaded('services'))
       ];
    }
}
