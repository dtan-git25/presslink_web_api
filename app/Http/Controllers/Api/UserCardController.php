<?php

namespace App\Http\Controllers\Api;

use App\Libraries\Payment\Stripe\Stripe;
use App\Models\Order;
use App\Models\UserCard;
use App\Http\Resources\UserCard as UserCardResource;
use Illuminate\Support\Facades\Crypt;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Http\Controllers\RestController;

class UserCardController extends RestController
{

    public function __construct(Request $request)
    {
        parent::__construct('UserCard');
        $this->__request     = $request;
        $this->__apiResource = 'UserCard';
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
            case 'PUT':
            case 'POST':
                $validator = Validator::make($this->__request->all(), [
                    'card_token'        => 'required',
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
        $user = $request->user;
        $orders = Order::where('user_id', $user->id)->whereIn('status', ['0', '1'])->get();
        if(count($orders)>0){
            $this->__is_error = true;
            return $this->__sendError(__('app.validation_msg'),['message' => __('app.user_card_cant_delete') ],400);
        }
        $userCard = UserCard::where('slug', $slug)->first();
        $card_id = Crypt::decryptString($userCard->card_id);
        $stripe = new Stripe;
        $stripe->deleteCustomerCard($request->user->stripe_cus_id, $card_id);
        $userCard->delete();

    }

    /**
     * @param $request
     * @param $slug
     */
    public function afterDestroyLoadModel($request,$slug)
    {

    }

    public function makeCardDefault(Request $request){

        UserCard::where('user_id', $request->user->id)->update(['status'=>0]);
        $userCard = UserCard::find($request->card_id);
        $card_id = Crypt::decryptString($userCard->card_id);

        $stripe = new Stripe;
        $stripe->makeDefaultCard($request->user->stripe_cus_id, $card_id);

        $userCard->update(['status'=>1]);
        $this->__is_paginate = false;
        $this->__collection  = false;
        $userCardResource = new UserCardResource($userCard);
        return $this->__sendResponse($userCardResource, 200, ['message' => __('app.card_update') ]);
    }

    public function getDefaultCard(Request $request){

        $userCard = UserCard::where('user_id', $request->user->id)->where('status',1)->first();
        $this->__is_paginate = false;
        $this->__collection  = false;
        $userCardResource = ($userCard!=null)?new UserCardResource($userCard):[];
        return $this->__sendResponse($userCardResource, 200, ['message' => __('app.default_card') ]);
    }
}
