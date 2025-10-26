<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\FaqController;
use App\Http\Controllers\Api\GeneralController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ReviewController;
use App\Http\Controllers\Api\ProviderTransactionController;
use App\Http\Controllers\Api\CashOutController;
use App\Http\Controllers\Api\BankDetailController;
use App\Http\Controllers\Api\UserCardController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['api_authorization'])->group(function(){

    Route::post('data-truncate',[GeneralController::class,'dataTruncate']);
    Route::post('generate-secret',[GeneralController::class,'generateSecret']);

    Route::post('user/login',[UserController::class,'login']);
    Route::post('user/forgot-password',[UserController::class,'forgotPassword']);
    Route::post('user/change-password',[UserController::class,'changePassword']);
    Route::post('user/logout',[UserController::class,'userLogout']);
    Route::post('user/social-login',[UserController::class,'socialLogin']);
    Route::post('user/verify-code',[UserController::class,'verifyCode']);
    Route::post('user/resend-code',[UserController::class,'resendCode']);
    Route::post('user/check-exists',[UserController::class,'userEmailOrPhoneExists']);

    Route::resource('user',UserController::class)->except(['delete']);

    //category index
    Route::get('category',[CategoryController::class,'index']);

    Route::resource('faq',FaqController::class)->only('index');

    Route::middleware(['custom_auth:api'])->group(function(){

        Route::get('notification',[NotificationController::class,'index']);
        Route::put('notification/{any}',[NotificationController::class,'update']);
        Route::post('notification/send',[NotificationController::class,'sendNotification']);
        Route::post('notification/setting',[NotificationController::class,'saveNotificationSetting']);
        Route::get('notification/setting',[NotificationController::class,'getNotificationSetting']);

        //category
        Route::resource('category',CategoryController::class)->except('index');
        //services
        Route::resource('service',ServiceController::class);
        //orders
        Route::resource('order',OrderController::class);
        Route::get('order-detail/{id}',[OrderController::class,'getOrderDetail']);
        //reviews
        Route::resource('review',ReviewController::class);
        //my earning
        Route::get('my-earnings',[ProviderTransactionController::class, 'providerEarnings']);
        //cash out
        Route::resource('cash-out',CashOutController::class);
        //cash out
        Route::resource('bank-detail',BankDetailController::class);
        //User Card
        Route::resource('user-card',UserCardController::class);
        Route::post('make-card-default',[UserCardController::class, 'makeCardDefault']);
        Route::get('default-card',[UserCardController::class, 'getDefaultCard']);

    });
});
