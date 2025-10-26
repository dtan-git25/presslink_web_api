<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CashOut extends Model
{
    use CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_cash_out';

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
    protected $fillable = ['slug','user_id','admin_id','amount','message','status'];

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


    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function admin(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(CmsUser::class, 'admin_id', 'id');
    }

    public static function checkCashOutRequest($user){

        $cash_out = self::where('user_id', $user->id)->where('status',0)->first();
        if($cash_out){
            return false;
        }
        return true;
    }

    public function requestStatus($status){

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
