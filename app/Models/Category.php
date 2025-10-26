<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Category extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'categories';

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
    protected $fillable = ['parent_id', 'slug', 'title','description','image_url','status'];

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


    public function child(){

        return $this->hasMany(Category::class, 'parent_id');
    }

    public function parent(){

        return $this->hasMany(Category::class, 'parent_id')->where('parent_id',0);
    }

    public function providers(){

        return $this->hasMany(User::class, 'business_category')
            ->select('users.*', 'cat.title as business_category_title')
            ->leftJoin('categories as cat', 'users.business_category', '=', 'cat.id');;
    }

    public function services(){
        $base_url = \Storage::url('');
        return $this->hasMany(Service::class, 'category_id', 'id')
            ->select('services.*')
            ->selectRaw("CONCAT('$base_url', services.image_url) as image_url")
            ->where('services.status',1);
    }

    public static function generateUniqueSlug($title){

        $username = Str::slug($title);
        $query = self::where('slug',$username)->count();
        if( $query > 0){
            $username = $username . $query . rand(111,999);
        }
        return Str::slug($username);
    }

}
