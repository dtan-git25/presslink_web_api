@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                        {{ $page_title }}
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('cash-out-request.update',['cash_out_request' => $record->slug]) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="PUT">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Amount</label>
                                        <input type="text" required value="{{ $record->amount }}" name="amount" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="status" class="form-control" required>
                                            <option value="" >Select Status</option>
{{--                                            <option value="0" {{ $record->status == 0 ? 'selected disabled' : '' }}>Pending</option>--}}
                                            <option value="1" {{ $record->status == 1 ? 'selected' : '' }}>Accepted</option>
                                            <option value="2" {{ $record->status == 2 ? 'selected' : '' }}>Rejected</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Reason</label>
                                        <textarea class="form-control" name="message">{{ $record->message }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @include('admin.footer')
    </section>
@endsection
