@extends('admin.master')
@section('content')
    <section class="main-content">
        <div class="row">
            <div class="col-sm-12">
                @include('admin.flash-message')
                <div class="card">
                    <div class="card-header card-default">
                        {{$page_title}}
                    </div>
                    <div class="card-body">
                        <form method="post" action="{{ route('provider.update',['provider' => $userDetail->slug]) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            <input type="hidden" name="_method" value="PUT">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="status" class="form-control">
                                            <option value="1" {{ $userDetail->status == 1 ? 'selected' : '' }}>Active</option>
                                            <option value="0" {{ $userDetail->status == 0 ? 'selected' : '' }}>Disabled</option>
                                        </select>
                                    </div>
                                </div>
                                @if($userDetail->is_approve != 1)
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Registration</label>
                                            <select name="is_approve" class="form-control">
                                                <option value="1" {{ $userDetail->is_approve == 1 ? 'selected' : '' }}>Approve</option>
                                                <option value="0" {{ $userDetail->is_approve == 0 ? 'selected' : '' }}>Disapprove</option>
                                            </select>
                                        </div>
                                    </div>
                                @endif
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
