@extends('layouts.dashboard')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col col-lg-6 col-md-6">
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img src="{{ asset('img/user2-160x160.jpg') }}" alt="profil"
                                class="profile-user-img img-responsive img-circle">
                        </div>
                        <h3 class="profile-username text-center">{{Auth::user()->name}}</h3>
                        <p class="text-muted text-center">Member sejak : {{Auth::user()->created_at}}</p>
                        <hr>
                        <strong>
                            <i class="fas fa-map-marker mr-2"></i>
                            Alamat
                        </strong>
                        <p class="text-muted">
                            {{Auth::user()->alamat}}
                        </p>
                        <hr>
                        <strong>
                            <i class="fas fa-envelope mr-2"></i>
                            Email
                        </strong>
                        <p class="text-muted">
                            {{Auth::user()->email}}
                        </p>
                        <hr>
                        <strong>
                            <i class="fas fa-phone mr-2"></i>
                            No Tlp
                        </strong>
                        <p class="text-muted">
                            {{Auth::user()->phone}}
                        </p>
                        <hr>
                        <a href="{{ URL::to('admin/setting') }}" class="btn btn-primary btn-block">Setting</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
