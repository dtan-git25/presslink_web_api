<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PublicUser as UserResource;

class Review extends JsonResource
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
           'id'          => $this->id,
           'slug'        => $this->slug,
           'user_id'     => $this->user_id,
           'provider_id' => $this->provider_id,
           'order_id'    => $this->order_id,
           'rating'      => $this->rating,
           'feedback'    => $this->feedback,
           'created_at'  => $this->created_at,
           'user'        => new UserResource($this->user),
       ];
    }
}
