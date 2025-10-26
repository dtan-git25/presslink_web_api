<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\PublicUser as UserResource;
use App\Http\Resources\OrderItem as OrderItemResource;
use App\Http\Resources\Review as OrderReview;

class Order extends JsonResource
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
           'id'              => $this->id,
           'slug'            => $this->slug,
           'date_time'       => $this->date_time,
           'transition_id'   => $this->transition_id,
           'card_id'         => $this->card_id,
           'additional_note' => $this->additional_note,
           'address'         => $this->address,
           'latitude'        => $this->latitude,
           'longitude'       => $this->longitude,
           'grand_total'     => $this->grand_total,
           'include_vat'     => $this->include_vat,
           'start_job'       => $this->start_job,
           'end_job'         => $this->end_job,
           'status'          => $this->status,
           'created_at'      => $this->created_at,
           'user'            => new UserResource($this->user),
           'order_items'     => new OrderItemResource($this->orderItems),
           'review'          => new OrderReview($this->review),
       ];
    }
}
