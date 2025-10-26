<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Service as ServiceResource;
use App\Http\Resources\PublicUser as ProviderResource;

class OrderItem extends JsonResource
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
           'id'=> $this->id,
           'order_id'=> $this->order_id,
           'item_id'=> $this->item_id,
           'quantity'=> $this->quantity,
           'price'=> $this->price,
           'total'=> $this->total,
           'service'=> new ServiceResource($this->service),
           'provider_id'=> new ProviderResource($this->provider),
       ];
    }
}
