<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'orders';

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
    protected $fillable = ['slug','user_id','provider_id','chat_room_identifier','date_time','transition_id','card_id','additional_note','address','latitude','longitude','start_job','end_job','grand_total','include_vat','status'];

    protected $dates = ['date_time'];
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

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function provider(){
        return $this->belongsTo(User::class, 'provider_id', 'id');
    }

    public function orderItems(){
        return $this->hasOne(OrderItem::class, 'order_id', 'id');
    }

    public function review(){
        return $this->hasOne(Review::class, 'order_id', 'id');
    }

    public function providerOrderTransactions(){
        return $this->hasOne(ProviderTransaction::class, 'reference_id', 'id')->where('identifier', 'Order');
    }

    public function orderStatus($status){

        switch ($status){
            case "0":
               return '<span class="btn btn-xs btn-success">Pending</span>';
                break;
            case "1":
               return '<span class="btn btn-xs btn-success">Accepted</span>';
                break;
            case "2":
               return '<span class="btn btn-xs btn-danger">Rejected</span>';
                break;
            case "3":
               return '<span class="btn btn-xs btn-success">Completed</span>';
                break;
        }
    }

}
