<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KeyWord extends Model
{
    use CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'keywords';

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
    protected $fillable = ['module','module_id','user_id','keyword'];

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
        return $this->belongsTo(User::class, 'module_id')
            ->where('users.user_group_id', 2)
            ->where('module', 'User keyword');
    }

    public function service(){
        return $this->belongsTo(Service::class, 'module_id')
            ->where('module', 'Service keyword');
    }

}
