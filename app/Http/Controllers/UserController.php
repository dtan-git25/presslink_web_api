<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use App\Models\Order;
use App\Models\ResetPassword;
use App\Models\User;
use App\Models\UserApiToken;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;

class UserController extends Controller
{
    public function resetPassword(Request $request, $token)
    {
        $checkRequest = ResetPassword::getUserRequest($token);
        if( !isset($checkRequest->id) )
            return redirect('/')->with('error',__('app.invalid_new_password_link'));

        if( strtotime(Carbon::now()) > strtotime(Carbon::make($checkRequest->created_at)->addHour()) )
            return redirect('/')->with('error',__('app.invalid_new_password_link'));

        if( $request->isMethod('post') )
            return self::_submitResetPassword($request,$checkRequest);

        return view('reset-password');
    }

    public function _submitResetPassword($request, $reset_pass_record)
    {
        $custom_messages = [
            'new_password.regex' => __('app.password_regex')
        ];
        $validator = Validator::make($request->all(), [
            'new_password'     => [
                'required',
                'regex:/^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,150}$/'
            ],
            'confirm_password' => 'required|same:new_password',
        ],$custom_messages);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator) ->withInput();
        }
        //update new password
        User::updateUserByEmail($reset_pass_record->email,['password' => Hash::make($request['new_password'])]);
        //delete reset password request
        $reset_pass_record->forceDelete();
        //delete all api token
        UserApiToken::where('user_id',$reset_pass_record->user_id)->forceDelete();

        return redirect('/')->with('success',__('app.password_success_msg'));
    }

    public function verifyEmail($token)
    {
        $email = decrypt($token);
        $user = User::getUserByEmail($email);
        if( !isset($user->id) )
            return redirect('/');

        User::updateUser($user->id,['is_email_verify' => 1, 'email_verify_at' => Carbon::now()]);
        return redirect('/')->with('success',__('app.verify_user_success_msg'));
    }

    public function getSchedule(Request $request){

        $from = Carbon::now();
        $to = Carbon::now()->addMinutes(15);
        $orders = Order::whereBetween('date_time', [$from, $to])->where('status',0)->get();
        if(count($orders)>0){

            foreach ($orders as $order){

                $date = Carbon::parse($order->date_time);
                $notification_data = [
                    'actor'            => $order->provider,
                    'actor_type'      => 'users',
                    'target'           => $order->user,
                    'target_type'      => 'users',
                    'title'            => env('APP_NAME'),
                    'message'          => 'You have a meeting with '.$order->provider->name. ' with in next '.$date->minute.' mins, make your self available',
                    'reference_id'     => $order->id,
                    'reference_module' => 'order',
                    'redirect_link'    => NULL,
                    'badge'            => '0'
                ];
                $custom_data = [
                    'record_id'     => $order->id,
                    'redirect_link' => NULL,
                    'identifier'    => 'schedule_order',
                ];
                Notification::sendPushNotification('schedule_order',$notification_data,$custom_data);
            }

        }
    }
}
