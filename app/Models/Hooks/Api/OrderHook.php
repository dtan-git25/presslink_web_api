<?php

namespace App\Models\Hooks\Api;

use App\Libraries\Payment\Stripe\Stripe;
use App\Models\ChatRoom;
use App\Models\ChatRoomUser;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\ProviderTransaction;
use App\Models\Service;
use App\Models\User;
use App\Models\UserCard;
use Carbon\Carbon;
use Illuminate\Support\Facades\Crypt;

class OrderHook
{
    private $_model, $status =['pending' => '0', 'accepted' =>'1', 'rejected' =>'2', 'completed' =>'3'];

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

        $user = $request->user;

        if($user->user_group_id != 2){
            $query->where('user_id', $user->id);
        }else{
            $query->where('provider_id', $user->id);
        }

        if (isset($request->status)){
            $query->where('status', $request->status);
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
        $service = Service::find($postdata['service_id']);
        $postdata['slug'] =  uniqid().time();
        $postdata['user_id'] =  $request->user->id;
        $postdata['provider_id'] = $service->user_id;
        $postdata['date_time'] =  $request->date_time;
        $postdata['additional_note'] = $request->additional_note;
        $postdata['card_id'] = $request->card_id;

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
        $user = $request->user;
        $targetUser = $record->provider;
        //Your code here
        if (isset($request['service_id'])) {
                $serviceProvider = Service::find($request['service_id']);
                $data = [
                    'order_id' => $record->id,
                    'item_id' => $request['service_id'],
                    'provider_id' => $serviceProvider->user_id,
                    'quantity' => 1,
                    'price' => $serviceProvider->price,
                    'total' => $serviceProvider->price,
                ];
                OrderItem::create($data);

        }
        $record->update(['grand_total' =>$record->orderItems->total]);

        $notification_data = [
            'actor'            => $user,
            'actor_type'      => 'users',
            'target'           => $targetUser,
            'target_type'      => 'users',
            'title'            => env('APP_NAME'),
            'message'          => __('app.user_new_order').$record->id,
            'reference_id'     => $record->id,
            'reference_module' => 'order',
            'redirect_link'    => NULL,
            'badge'            => '0'
        ];
        $custom_data = [
            'record_id'     => $record->id,
            'redirect_link' => NULL,
            'identifier'    => 'new_order',
        ];
        Notification::sendPushNotification('new_order',$notification_data,$custom_data);

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
        $order = Order::where('slug', $slug)->first();
        if(isset($request->start_job)){
            unset($postData['start_job']);
            $order->update(['start_job' => Carbon::now()]);
        }elseif($request->status == 1){                                            // booking accept

//           $userCard = UserCard::find($order->card_id);
//           $card_id = Crypt::decryptString($userCard->card_id);
//           $stripe = new Stripe;
////           dd($order->user->stripe_cus_id, $card_id);
//           $customerCharge = $stripe->customerCharge($order->user->stripe_cus_id,$card_id, $order->grand_total, 'usd', $order->d);
//           $transition_id = $customerCharge['gateway_response']['id'];
//           $order->update(['transition_id' => $transition_id]);

            $order->update(['chat_room_identifier' => 'order-chat-room-'.$order->id]);
            $chatRoom = new ChatRoom;
            $chatRoom->type = 'group';
            $chatRoom->created_by = $request->user->id;
            $chatRoom->slug = 'order-chat-room-'.$order->id;
            $chatRoom->identifier = 'order-chat-room-'.$order->id;
            $chatRoom->reference_module = 'orders';
            $chatRoom->reference_id = $order->id;
            $chatRoom->save();

            ChatRoomUser::insert([
                [
                    'chat_room_id' => $chatRoom->id,
                    'user_id' => $request->user->id,
                    'is_owner' => 0
                ],
                [
                    'chat_room_id' => $chatRoom->id,
                    'user_id' => $order->user->id,
                    'is_owner' => 1
                ]
            ]);


        }elseif($request->status == 3){                                             // booking complete
            $order->update(['end_job' => Carbon::now()]);
            $addTransaction = [
                'provider_id' => $order->provider_id,
                'identifier' => 'Order',
                'title' => $order->orderItems->service->title,
                'reference_id' => $order->id,
                'reference_module' => 'Order',
                'date' => date('Y-m-d'),
                'amount' => $order->grand_total,
            ];
            $providerTransaction = ProviderTransaction::addTransaction($addTransaction);
            if($providerTransaction){
                $provider = User::find($order->provider_id);
                $total_earnings = $provider->total_earnings+$order->grand_total;
                $total_remaining = $provider->total_remaining+$order->grand_total;
                $provider->update(['total_earnings'=>$total_earnings, 'total_remaining'=>$total_remaining]);
            }

            ChatRoom::where('reference_module', 'orders')->where('reference_id', $order->id)->delete();

        }

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
        $order = Order::where('slug', $slug)->first();
        $status = array_search($order->status,$this->status);
        $user = $order->user;
        $provider = $order->provider;
        if($order->status != 3){
            $message = __('app.user_order_update').$status. ' by '.$provider->name.' at '.$order->date_time->format('jS F Y, H:i A');
        }else{
            $message = __('app.user_order_complete').$provider->name. ' has been '.$status. ', Please rate his services';
        }
        $notification_data = [
            'actor'            => $provider,
            'actor_type'      => 'users',
            'target'           => $user,
            'target_type'      => 'users',
            'title'            => env('APP_NAME'),
            'message'          => $message,
            'reference_id'     => $order->id,
            'reference_module' => 'order',
            'redirect_link'    => NULL,
            'badge'            => '0'
        ];
        $custom_data = [
            'record_id'     => $order->id,
            'redirect_link' => NULL,
            'identifier'    => 'update_order',
        ];
        Notification::sendPushNotification('update_order',$notification_data,$custom_data);
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
        return 'OrderHook' . md5(implode('',$cache_params));
    }
}
