<?php

namespace App\Http\Controllers\Api;

use App\Models\ProviderTransaction;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;
use App\Http\Resources\ProviderEarning;

class ProviderTransactionController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('ProviderTransaction');
        $this->__request     = $request;
        $this->__apiResource = 'ProviderTransaction';
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
                    'attribute'        => 'required',
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

    public function providerEarnings(Request $request){

//        $param_rule['month']  = 'required';
//        $param_rule['year']  = 'required';
//
//        $response = $this->__validateRequestParams($request->all(),$param_rule);
//        if( $this->__is_error )
//            return $response;

        $providerEarnings['monthly_earning'] = ProviderTransaction::getMonthlyEarning($request->all());
        $providerEarnings['monthly_data'] = ProviderTransaction::getProviderTransaction($request->all());

        $this->__collection  = false;
        $this->__is_paginate = false;

        return $this->__sendResponse($providerEarnings, 200, 'My Earnings');
    }
}
