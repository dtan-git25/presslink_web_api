<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class GeneralController extends Controller
{
    public function generateSecret(Request $request)
    {
        $data['secret'] = bin2hex(openssl_random_pseudo_bytes(16));
        $data['iv']     = bin2hex(openssl_random_pseudo_bytes(16));

        file_put_contents(resource_path('secret-key/secret.txt'),$data['secret']);
        file_put_contents(resource_path('secret-key/iv.txt'),$data['iv']);

        $this->__collection  = false;
        $this->__is_paginate = false;

        return $this->__sendResponse($data, 200, 'Secret has been generated successfully');
    }

    public function dataTruncate(Request $request)
    {
        if( App::environment('production') )
            return abort(404);

        if( $request['password'] != 'admin@!@#' )
            return $this->__sendError('Validation Message',['message' => 'Invalid Credential' ], 400);

        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

//        DB::table('cms_users')->where('cms_role_id',2)->delete();
        DB::table('users')->truncate();
        DB::table('user_api_token')->truncate();
        DB::table('media')->truncate();
        DB::table('notification')->truncate();
        DB::table('reset_password')->truncate();
        DB::table('keywords')->truncate();
        DB::table('services')->truncate();
        DB::table('orders')->truncate();
        DB::table('order_items')->truncate();
        DB::table('reviews')->truncate();
        DB::table('provider_transactions')->truncate();
        DB::table('user_cash_out')->truncate();
        DB::table('user_bank_details')->truncate();
        DB::table('user_cards')->truncate();

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $this->__is_paginate = false;
        $this->__collection  = false;

        return $this->__sendResponse([],200, 'Data truncate successfully');
    }
}
