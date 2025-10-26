<?php

namespace App\Models\Hooks\Admin;

use App\Helpers\CustomHelper;
use App\Models\CashOut;
use App\Models\ProviderTransaction;
use App\Models\User;

class CashOutHook
{
    private $_model, $status =['0' => 'pending', '1' =>'accepted', '2' =>'rejected'];

    public function __construct($model)
    {
        $this->_model = $model;
    }

    /*
   | ----------------------------------------------------------------------
   | Hook for manipulate query of index result
   | ----------------------------------------------------------------------
   | @query   = current sql query
   | @request = laravel http request class
   |
   */
    public function hook_query_index(&$query,$request, $slug=NULL) {
        //Your code here
        $query->with(['user', 'admin']);

        if(isset($request->status)){
            $status = array_search($request->status,$this->status);
            $query->where('status',$status);
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before add data is execute
    | ----------------------------------------------------------------------
    | @arr
    |
    */
    public function hook_before_add($request,&$postdata)
    {

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after add public static function called
    | ----------------------------------------------------------------------
    | @record
    |
    */
    public function hook_after_add($request,$record)
    {
        //Your code here
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for manipulate data input before update data is execute
    | ----------------------------------------------------------------------
    | @request  = http request object
    | @postdata = input post data
    | @id       = current id
    |
    */
    public function hook_before_edit($request, $slug, &$postData)
    {
        $postData['admin_id'] = CustomHelper::currentUser()->id;
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after edit public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$slug    = $slug
    |
    */
    public function hook_after_edit($request, $slug) {
        //Your code here
        $cash_out = CashOut::where('slug', $slug)->first();
        if($cash_out->status == 1){
            $transaction = ProviderTransaction::where('reference_id', $cash_out->id)->where('reference_module','Cash Out')->first();
            if($transaction == null){
                $addTransaction = [
                    'provider_id' => $cash_out->user_id,
                    'identifier' => 'Cash Out',
                    'title' => 'Cash Out',
                    'reference_id' => $cash_out->id,
                    'reference_module' => 'Cash Out',
                    'date' => date('Y-m-d'),
                    'amount' => $cash_out->amount,
                ];
                $providerTransaction = ProviderTransaction::addTransaction($addTransaction);
                if($providerTransaction){
                    $provider = User::find($cash_out->user_id);
                    $total_remaining = $provider->total_remaining-$cash_out->amount;
                    $provider->update(['total_remaining'=>$total_remaining]);
                }
            }
        }
    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command before delete public static function called
    | ----------------------------------------------------------------------
    | @request  = Http request object
    | @$id      = record id = int / array
    |
    */
    public function hook_before_delete($request, $slug) {
        //Your code here

    }

    /*
    | ----------------------------------------------------------------------
    | Hook for execute command after delete public static function called
    | ----------------------------------------------------------------------
    | @$request       = Http request object
    | @records        = deleted records
    |
    */
    public function hook_after_delete($request,$records) {
        //Your code here
    }

    public function create_cache_signature($request)
    {
        $cache_params = $request->except(['user','api_token']);
        return 'CashOutHook' . md5(implode('',$cache_params));
    }
}
