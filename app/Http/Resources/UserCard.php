<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Crypt;

class UserCard extends JsonResource
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
           'id'         => $this->id ,
           'slug'       => $this->slug,
           'user_id'    => $this->user_id,
           'card_id'    => Crypt::decryptString($this->card_id),
           'exp_month'  => Crypt::decryptString($this->exp_month),
           'exp_year'   => Crypt::decryptString($this->exp_year),
           'last4'      => Crypt::decryptString($this->last4),
           'brand'      => Crypt::decryptString($this->brand),
           'status'     => $this->status,
           'created_at' => $this->created_at
        ];
    }
}
