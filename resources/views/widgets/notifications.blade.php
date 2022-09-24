

<li class=" ">
    <a href="{{url('/meteo')}}" class="dropdown-toggle parent" role="button" aria-expanded="false">
        <i class="fa fa-cloud" aria-hidden="true"></i>


    </a>
</li>


<li class="">
    <a href="{{url('/map')}}" class="dropdown-toggle parent"  role="button" aria-expanded="false">
<i class="fa fa-map" aria-hidden="true"></i>


    </a>
</li>

<li class="dropdown">
    <a href="#" class="dropdown-toggle parent" data-toggle="dropdown" role="button" aria-expanded="false">
        @if(count(sHelper::notifications()) > 0)<span class="badge badge-notify">{{count(sHelper::notifications()) }}</span>@endif
        <i class="fa fa-bell"></i>


    </a>
    <ul class="dropdown-menu" role="menu">
        @if(count(sHelper::notifications()) == 0)
            <li style="padding: 10px"><a href="javascript:;">Aucune notification.</a></li>
        @else
            @foreach(sHelper::notifications() as $notification)
                <li>
                    <a href="{{ $notification['url'] }}">
                        <i class="fa {{ $notification['icon'] }}"></i> {{ $notification['text'] }}

                    </a>


            @endforeach
        @endif
    </ul>
</li>
