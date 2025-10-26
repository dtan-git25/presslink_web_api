<?php

namespace App\Http\Controllers\Api;

use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class BankDetailController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('BankDetail');
        $this->__request     = $request;
        $this->__apiResource = 'BankDetail';
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
                    'account_number'   => 'required|max:11',
                    'ss_number'        => 'required|max:9',
                    'routing_number'   => 'required|max:9',
                    'front_image'      => 'required|mimes:jpeg,jpg,png|max:10000',
                    'back_image'       => 'required|mimes:jpeg,jpg,png|max:10000',
                ]);
                break;
            case 'PUT':
                $validator = Validator::make($this->__request->all(), [
                    'account_number'   => 'required|max:11',
                    'ss_number'        => 'required|max:9',
                    'routing_number'   => 'required|max:9',
                    'front_image'      => 'sometimes|required|mimes:jpeg,jpg,png|max:10000',
                    'back_image'       => 'sometimes|required|mimes:jpeg,jpg,png|max:10000',
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
}
