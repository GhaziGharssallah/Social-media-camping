<div class="container-fluid">
    <div class="row">
        <div class="cover @if(!$user->getCover() || !$can_see){{ 'no-cover' }}@endif" style="@if($can_see) background-image: url('{{ $user->getCover() }}') @endif">
            @if($my_profile)
                <div class="loading-cover">
                    <img src="{{ asset('images/rolling.gif') }}" alt="">
                </div>
            @endif
            <div class="bar">
                <div class="container">
                    <div class="profile-image @if($user->sex == 1){{ 'female' }}@endif">
                        @if($my_profile)
                            <div class="loading-image">
                                <img src="{{ asset('images/rolling.gif') }}" alt="">
                            </div>
                            <form id="form-upload-profile-photo" enctype="multipart/form-data">
                                <div class="change-image">
                                    <a href="javascript:;" class="upload-button" onclick="uploadProfilePhoto()"><i class="fa fa-upload"></i> Téléchargez l'image</a>
                                    <input type="file" accept="image/*" name="profile-photo" class="profile_photo_input">
                                </div>
                            </form>
                        @endif
                        <a data-fancybox="group" href="{{ $user->getPhoto() }}">
                            <img class="image-profile" src="{{ $user->getPhoto(200, 200) }}" alt="" />
                        </a>
                    </div>
                    <div class="profile-text">
                        <h2>{{ $user->name }}</h2>
                        {{-- <h4>{{ '@'.$user->username }}</h4> --}}

                          {{--@if($user->isOnline())--}}
                            {{--<i class="fa fa-dot-circle-o" style = 'color:lime;'></i> online--}}
                          {{--@else--}}
                            {{--<div class="fa fa-dot-circle-o" style = 'color:red;'></div> offline--}}
                            {{--<div class="">Был в сети {{$user->last_sing_in_at}}</div>--}}
                          {{--@endif--}}


                        @if($can_see)
                            {{-- <small>{{ Auth::user()->distance($user) }}</small> --}}
                        @endif
                    </div>
                    @if($my_profile)
                        <form id="form-upload-cover" enctype="multipart/form-data">
                            <div class="profile-upload-cover">
                                <a href="javascript:;" class="btn btn-info upload-button" onclick="uploadCover()"><i class="fa fa-upload"></i> Changer photo de couverture</a>
                                <input type="file" accept="image/*" name="cover" class="cover_input">
                            </div>
                        </form>
                    @else
                        <div class="profile-follow">
                          {{--<div class="profile-follow-b1 pull-left" style="margin-right: 10px ">--}}
                            {{--<a class="btn btn-primary" href="/direct-messages/show/{{$user->id}}">Rédiger un message</a>--}}
                          {{--</div>--}}
                            <div class="profile-follow-b1 pull-left" style="margin-right: 10px">
                                {!! sHelper::followButton($user->id, Auth::id(), '.profile-follow-b1') !!}
                            </div>
                            <div class="profile-follow-b2 pull-right">
                                {!! sHelper::deniedButton(Auth::id(), $user->id, '.denied-button-'.$user->id, 'denied-button-'.$user->id) !!}
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>
