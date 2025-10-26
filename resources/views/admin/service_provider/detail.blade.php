@extends('admin.master')
@section('content')
{{--    @dd($user->bankDetails)--}}
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                        {{ $page_title }} Detail
                    </div>
                    <div class="card-body">
                        <div class="widget white-bg">
                            <div class="padding-20 text-center">
                                <img alt="Profile Picture" width="140" class="rounded-circle mar-btm margin-b-10 circle-border " src="{{ ($user->image_url != null)?\Storage::url($user->image_url):\Storage::url('users/user_default.png') }}">
                                <p class="lead font-500 margin-b-0">{{ $user->name }}</p>
                                <hr>
                            </div>
                        </div>
                        <div class="widget white-bg friends-group clearfix">
                            <small class="text-muted">Email address </small>
                            <p>{{ $user->email }}</p>
                            <small class="text-muted">Phone</small>
                            <p>{{ ($user->mobile_no!=null)?$user->mobile_no:'-' }}</p>
                            <small class="text-muted">Address</small>
                            <p>{{ ($user->address!=null)?$user->address:'-' }}</p>
                            <small class="text-muted">Country</small>
                            <p>{{ ($user->country!=null)?$user->country:'-' }}</p>
                            <small class="text-muted">State</small>
                            <p>{{ ($user->state!=null)?$user->state:'-' }}</p>
                            <small class="text-muted">ZipCode</small>
                            <p>{{ ($user->zipcode!=null)?$user->zipcode:'-' }}</p>
                            <small class="text-muted">Business Category</small>
                            <p>{{ $user->businessCategory->title }}</p>
                            <small class="text-muted">Business Name</small>
                            <p>{{ $user->business_name }}</p>
                            <small class="text-muted">Business Timings</small>
                            <p>{{ $user->business_timings }}</p>
                            <small class="text-muted">About Business</small>
                            <p>{{ $user->about_business }}</p>
                            <small class="text-muted">Keywords</small>
                            <p>{{ $user->userKeyWords->pluck('keyword')->implode(', ') }}</p>
                        </div>
                        <div class="widget white-bg friends-group clearfix">
                            <h3>Bank Details</h3>
                            @if($user->bankDetails!= null)
                                    <small class="text-muted">Account Number</small>
                                    <p>{{ $user->bankDetails->account_number }}</p>

                                    <small class="text-muted">SSN Number</small>
                                    <p>{{ $user->bankDetails->ss_number }}</p>

                                    <small class="text-muted">Routing Number</small>
                                    <p>{{ $user->bankDetails->routing_number }}</p>

                                    <small class="text-muted">Driving License</small>
                                    <img class="img-thumbnail" src="{{ Storage::url($user->bankDetails->front_image['image_path']) }}" width="200">
                                    <img class="img-thumbnail" src="{{ Storage::url($user->bankDetails->back_image['image_path']) }}" width="200">
                                @else
                                    <p>No Available</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @include('admin.footer')
    </section>
@endsection
