@extends('admin.master')
@section('content')
{{--    @dd($record->orderItems->total)--}}
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
{{--                    <div class="card-header card-default col-md-6">--}}
{{--                        {{$page_title}} Detail--}}
{{--                    </div>--}}
{{--                    <div class="card-body">--}}
{{--                        <div class="row">--}}
{{--                            <div class="col-md-6">--}}
{{--                                <h4>Status:<small> {!! $record->orderStatus($record->status) !!}</small></h4>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </div>--}}

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h4>{{$page_title}} Detail</h4>
                            </div>
                            <div class="col-md-6">
                                <div class="text-right">
                                    <h4>Status:<small> {!! $record->orderStatus($record->status) !!}</small></h4>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row margin-b-40">
                            <div class="col-sm-6">
                                <h4>{{ $record->user->name }}</h4>

                                <address>
                                    <strong>{{ $record->address }}</strong><br>
                                    <abbr>Phone:</abbr> {{ $record->user->mobile_no }}
                                </address>
                            </div>

                        </div>
                        <div class="table-responsive margin-b-40">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Service</th>
                                    <th>Unit Price</th>
                                    <th>Total Price</th>
                                </tr>
                                </thead>
                                <tbody>
{{--                                @foreach($record->orderItems as $orderItem)--}}
                                    <tr>
                                        <td>
                                            <div><strong>{{ $record->orderItems->service->title }}</strong></div>
                                            <small>{{ $record->orderItems->service->description }}</small>
                                        </td>
                                        <td>{{ \Config::get('constants.currency_sign').$record->orderItems->price }}</td>
                                        <td>{{ \Config::get('constants.currency_sign').$record->orderItems->total }}</td>
                                    </tr>
{{--                                @endforeach--}}
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <h5>Additional Information</h5>
                                <p>{{ $record->additional_note }}</p>
                            </div>
                            <div class="col-md-4 col-md-offset-2">
                                <table class="table table-striped text-right">
                                    <tbody>
                                    <tr>
                                        <td><strong>Sub Total :</strong></td>
                                        <td>{{ \Config::get('constants.currency_sign').$record->orderItems->total }}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>TOTAL :</strong></td>
                                        <td>{{ \Config::get('constants.currency_sign').$record->grand_total }}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @include('admin.footer')
    </section>
@endsection
