<?php

use App\Http\Controllers\Admin\ContentManagementController;
use App\Http\Controllers\Admin\FaqController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;
use App\Http\Controllers\Admin\Auth\ForgotPasswordController;
use App\Http\Controllers\Admin\Auth\ResetPasswordController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\CmsUserController;
use App\Http\Controllers\Admin\CmsRoleController;
use App\Http\Controllers\Admin\ApplicationSettingController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\ServiceProviderController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\ProviderEarningController;
use App\Http\Controllers\Admin\CashOutController;
/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
*/

Route::prefix('admin')->group(function () {

    Route::middleware(['guest:cms_user'])->group( function(){

        Route::match( ['get','post'],'login', [ LoginController::class,'login' ])->name('admin.login');
        Route::match( ['get','post'],'forgot-password', [ ForgotPasswordController::class,'forgotPassword' ])->name('admin.forgot-password');
        Route::match( ['get','post'],'reset-password/{any}', [ ResetPasswordController::class,'resetPassword' ])->name('admin.reset-password');

    });

    Route::middleware(['custom_auth:cms_user'])->group( function(){

        Route::match(['get','post'],'profile',[CmsUserController::class,'profile'])->name('admin.profile');
        Route::match(['get','post'],'change-password',[CmsUserController::class,'changePassword'])->name('admin.change-password');
        Route::get('logout',[CmsUserController::class,'logout'])->name('admin.logout');

        Route::get('dashboard',[DashboardController::class,'index'])->name('admin.dashboard');
        Route::get('dashboard/small-widget',[DashboardController::class,'getSmallWidget'])->name('admin.dashboard.small-widget');
        Route::get('dashboard/line-chart',[DashboardController::class,'getLineChart'])->name('admin.dashboard.line-chart');

        Route::get('cms-roles-management/ajax-listing',[CmsRoleController::class,'ajaxListing'])->name('cms-roles-management.ajax-listing');
        Route::resource('cms-roles-management',CmsRoleController::class);

        Route::get('cms-users-management/ajax-listing',[CmsUserController::class,'ajaxListing'])->name('cms-users-management.ajax-listing');
        Route::resource('cms-users-management',CmsUserController::class);

        Route::match(['get','post'],'application-setting',[ApplicationSettingController::class,'index'])->name('admin.application-setting');

        Route::get('app-users/ajax-listing',[UserController::class,'ajaxListing'])->name('app-users.ajax-listing');
        Route::resource('app-users',UserController::class);

        Route::get('content-management/ajax-listing',[ContentManagementController::class,'ajaxListing'])->name('content-management.ajax-listing');
        Route::resource('content-management',ContentManagementController::class);

        Route::get('faq/ajax-listing',[FaqController::class,'ajaxListing'])->name('faq.ajax-listing');
        Route::resource('faq',FaqController::class);

        Route::get('provider/ajax-listing',[ServiceProviderController::class,'ajaxListing'])->name('provider.ajax-listing');
        Route::resource('provider',ServiceProviderController::class);

        Route::get('category/ajax-listing',[CategoryController::class,'ajaxListing'])->name('category.ajax-listing');
        Route::resource('category',CategoryController::class);

        Route::get('booking?status=pending',[OrderController::class,'index'])->name('booking.pending');
        Route::get('booking?status=accepted',[OrderController::class,'index'])->name('booking.accepted');
        Route::get('booking?status=rejected',[OrderController::class,'index'])->name('booking.rejected');
        Route::get('booking?status=completed',[OrderController::class,'index'])->name('booking.completed');
        Route::get('booking/ajax-listing',[OrderController::class,'ajaxListing'])->name('booking.ajax-listing');
        Route::resource('booking',OrderController::class);

        Route::get('provider-earning/ajax-listing',[ProviderEarningController::class,'ajaxListing'])->name('provider-earning.ajax-listing');
        Route::resource('provider-earning',ProviderEarningController::class);

        Route::get('cash-out-request?status=pending',[CashOutController::class,'index'])->name('cash-out-request.pending');
        Route::get('cash-out-request?status=accepted',[CashOutController::class,'index'])->name('cash-out-request.accepted');
        Route::get('cash-out-request?status=rejected',[CashOutController::class,'index'])->name('cash-out-request.rejected');
        Route::get('cash-out-request/ajax-listing',[CashOutController::class,'ajaxListing'])->name('cash-out-request.ajax-listing');
        Route::resource('cash-out-request',CashOutController::class);



    });

});
