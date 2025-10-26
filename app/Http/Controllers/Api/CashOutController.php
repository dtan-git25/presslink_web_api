<?php

namespace App\Http\Controllers\Api;

use App\Models\CashOut;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class CashOutController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('CashOut');
        $this->__request     = $request;
        $this->__apiResource = 'CashOut';
    }

    /**
     * This function is used for validate restfull request
     * @param $action
     * @param string $slug
     * @return array
     */
    public function validation($action,$slug=0)
    {
        $validator = [];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
//                    'user_id'       => 'required',
                    'amount'        => 'required',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'attribute'     => 'required',
                ]);
                break;
        }
        return $validator;
    }

    /**
     * @param $request
     */
    public function beforeIndexLoadModel($request)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterIndexLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     */
    public function beforeStoreLoadModel($request)
    {
        $user = $request->user;
        if($request->amount>$user->total_remaining){
//            $this->__is_error = true;
            $this->__is_paginate = false;
            $this->__collection  = false;
//            return $this->__sendError(__('app.validation_msg'),['message' => __('app.cash_request_amount') ],400);
            return $this->__sendResponse([], 200, ['message' => __('app.cash_request_amount') ]);

        }

        $cash_out = CashOut::checkCashOutRequest($user);
        if($cash_out == false){
            $this->__is_error = true;
            $this->__is_paginate = false;
            $this->__collection  = false;
            return $this->__sendResponse([], 200, ['message' => __('app.cash_request_pending') ]);

        }



    }

    /**
     * @param $request
     * @param $record
     */
    public function afterStoreLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeShowLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterShowLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeUpdateLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $record
     */
    public function afterUpdateLoadModel($request,$record)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function beforeDestroyLoadModel($request,$slug)
    {

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }
}
