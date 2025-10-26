<?php

namespace App\Http\Controllers\Api;

use App\Models\Service;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class ServiceController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('Service');
        $this->__request     = $request;
        $this->__apiResource = 'Service';
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
        $custom_messages = [
            'image_url.max' => __('app.image_upload_max_limit')
        ];
        switch ($action){
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'title'         => 'required',
                    'description'   => 'required',
                    'price'         => 'required',
                    'image_url'     => 'sometimes|required|mimes:jpeg,jpg,png|max:10000',     //5MB
                    'keywords'      => 'required|between:1,5',
                ], $custom_messages);
                break;
            case 'PUT':
                $custom_messages = [
                    'image_url.max' => __('app.image_upload_max_limit')
                ];
                $validator = Validator::make($this->__request->all(), [
                    'slug'          => 'exists:services,slug',
                    'title'         => 'sometimes|required',
                    'description'   => 'sometimes|required',
                    'price'         => 'sometimes|required',
                    'image_url'     => 'sometimes|required|mimes:jpeg,jpg,png|max:10000',     //5MB
                    'keywords'      => 'required|between:1,5',
                    'status'        => 'sometimes|required'
                ],$custom_messages);
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
        $service = Service::where('slug', $slug)->first();
        if(count($service->orderItems)>0){
            $this->__is_error = true;
            $this->__is_paginate   = false;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.service_delete_error')],400);
        }

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }
}
