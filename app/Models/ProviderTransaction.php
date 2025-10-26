<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProviderTransaction extends Model
{
    use CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'provider_transactions';

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
    protected $fillable = ['provider_id','identifier','title','reference_id','reference_module', 'date', 'amount'];

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

    public function provider(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'provider_id', 'id');
    }

    public function order(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Order::class, 'reference_id', 'id')->where('identifier','Order');;
    }

    public function cashOut(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(CashOut::class, 'reference_id', 'id')->where('identifier','Cash Out');
    }

    public static function addTransaction($params){
        return self::create($params);
    }

    public static function getProviderTransaction($params)
    {
        if(isset($params['month']) && isset($params['year'])){
            return self::where('provider_id', $params['user']->id)
                ->whereMonth('date', '=', $params['month'])
                ->whereYear('date', '=', $params['year'])
                ->orderby('created_at', 'desc')
                ->get();
        }
            return self::where('provider_id', $params['user']->id)
                ->orderby('created_at', 'desc')
                ->get();

    }

    public static function getMonthlyEarning($params)
    {
        if(isset($params['month']) && isset($params['year'])){
            return self::where('provider_id', $params['user']->id)
                ->where('identifier','Order')
                ->whereMonth('date', '=', $params['month'])
                ->whereYear('date', '=', $params['year'])
                ->sum('amount');
        }
            return self::where('provider_id', $params['user']->id)
                            ->where('identifier','Order')
                            ->sum('amount');

    }

}
