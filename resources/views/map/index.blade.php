@extends('layouts.app')

@section('content')
    <div class="h-20"></div>
    <div class="container">
        <div class="row">

            <div class="col-md-12">

               <div id="map"></div>

           </div>
        </div>
    </div>


@section('footer')
<script src="https://js.api.here.com/v3/3.1/mapsjs-core.js"></script>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-service.js"></script>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-ui.js"></script>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-mapevents.js"></script>
    <script type="text/javascript">
       
    var lat = "36.41363";
    var lng = "10.40071";
      const platform = new H.service.Platform({ apikey: 'FLHMxXKzDJMc4N70jJKiKBk8CFxM4NWRKJztyGUE7L8' });
      const defaultLayers = platform.createDefaultLayers();
      const map = new H.Map(document.getElementById('map'),
         defaultLayers.vector.normal.map, {
         center: { lat: lat, lng: lng },
         zoom: 9,
         pixelRatio: window.devicePixelRatio || 1
      });
      window.addEventListener('resize', () => map.getViewPort().resize());
      const behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));
      const ui = H.ui.UI.createDefault(map, defaultLayers);
 
    </script>
@endsection