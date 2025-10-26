<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class BankDetail extends JsonResource
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
            'slug' => $this->slug,
            'user_id' => $this->user_id,
            'account_number' => $this->account_number,
            'ss_number' => $this->ss_number,
            'routing_number' => $this->routing_number,
            'front_image' => ($this->front_image)? array('image_src'=> Storage::url($this->front_image['image_path']),'image_info'=>$this->front_image):null,
            'back_image' => ($this->back_image)? array('image_src'=> Storage::url($this->back_image['image_path']),'image_info'=>$this->back_image):null,
            'created_at' => $this->created_at,
       ];
    }
}
