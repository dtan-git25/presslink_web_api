<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Service extends Model
{
    use SoftDeletes,CRUDGenerator;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'services';

    protected $casts = [
      'image_url' => 'json'
    ];

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
    protected $fillable = ['category_id', 'user_id', 'title', 'slug', 'image_url','description', 'price', 'status'];

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

    public function category(){
        return $this->hasOne(Category::class, 'id', 'category_id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function serviceKeyWords(){
        return $this->hasMany(KeyWord::class, 'module_id','id')
            ->where('module','Service keyword');
    }

    public function orderItems(){
        return $this->hasMany(OrderItem::class, 'item_id','id');
    }

    /**
     * This function is used to generate unique username
     * @param string $slug
     * @return string $slug
     */
    public static function generateUniqueSlug($slug)
    {
        $slug = Str::slug($slug);
        $query = self::where('slug',$slug)->count();
        if( $query > 0){
            $slug = $slug . $query . rand(111,999);
        }
        return Str::slug($slug);
    }
}
