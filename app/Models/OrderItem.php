<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class OrderItem extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'order_items';

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
    protected $fillable = ['order_id','item_id','provider_id','quantity','price','total'];

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

    public function service(){
//        $base_url = Storage::url('');
        return $this->belongsTo(Service::class, 'item_id', 'id');
//                    ->select('services.*')
//                    ->selectRaw("CONCAT('$base_url', services.image_url) as image_url");
    }

    public function order(){
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function provider(){
        return $this->belongsTo(User::class, 'provider_id', 'id')
            ->select('users.*', 'cat.title as business_category')
            ->leftJoin('categories as cat', 'users.business_category', '=', 'cat.id');
    }
}
