<div class="menu">
    <ul class="list-group">
        <li class="list-group-item">
            <a href="{{ url('/') }}" class="menu-home">
                <i class="fa fa-home"></i>
                Page d'accueil
            </a>
        </li>
        <li class="list-group-item">
            <a href="{{ url('/map') }}" class="menu-nearby">
                <i class="fa fa-map-marker"></i>
                Maps
            </a>
        </li>
{{--        <li class="list-group-item">--}}
{{--            <a href="{{ url('/community') }}" class="menu-nearby">--}}
{{--                <i class="fa fa-group"></i>--}}
{{--                Les événements--}}
{{--            </a>--}}
{{--        </li>--}}
        {{-- <li class="list-group-item">
            <a href="{{ url('/groups') }}" class="menu-groups">
                <i class="fa fa-users"></i>
                                Les événements

            </a>
        </li> --}}
        <li class="list-group-item">
            <a href="{{ url('/meteo') }}" class="menu-dm">
                <i class="fa fa-cloud"></i>
                Méteo
            </a>
        </li>
    </ul>
</div>
