@extends('layouts.app')

@section('content')

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

    <div class="h-20"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                 @include('widgets.sidebar')
            </div>
            <div class="col-md-9">


                <div class="content-page-title" style="color: #fff;">    
                    {{--<i class="fa fa-commenting"></i>--}}
                    <i class="fa fa-cloud"></i> Meteo
                </div>


<div class="links col-md-7" style="color: #fff;">
  <h4 align="center">{{ $forecast->city }} - {{ $forecast->state }} - {{ $forecast->country }}</h4>
  <hr>
 <!--  <br> -->
  <!-- {{ $forecast->latitude }},{{ $forecast->longitude }} -->
  @if (count($forecast->forecast))
    <table class="table" style="color: #fff;">
      <thead>
      <tr>
        <th scope="col"></th>
        <th scope="col"><b>Weather</b></th>
        <th scope="col"><b>Hour</b></th>
        <th scope="col"><b>Temperature</b></th>
      </tr>
      </thead>
      <tbody>
      @foreach (array_slice($forecast->forecast,0,24) as $f)
        <tr>
          <th scope="row">
            <img width=24 src="{{ $f->iconLink }}">
          </th>
          <td>{{ $f->description }}</td>
          <td>{{ Carbon\Carbon::createFromFormat("HmdY", $f->localTime) }}</td>
          <td> {{ $f->temperature }}&deg;</td>
        </tr>

      @endforeach
      </tbody>
    </table>
  @else
    <li>Sorry my dear friend, no forecast here.</li>
  @endif

</div>


<style>


  .single {
padding: 30px 15px;
margin-top: 40px;
background: #fcfcfc;
border: 1px solid #f0f0f0; }
.single h3.side-title {
margin: 0;
margin-bottom: 10px;
padding: 0;
font-size: 20px;
color: #333;
text-transform: uppercase; }
.single h3.side-title:after {
content: '';
width: 60px;
height: 1px;
background: #ff173c;
display: block;
margin-top: 6px; }

.single ul {
margin-bottom: 0; }
.single li a {
color: #666;
font-size: 14px;
text-transform: uppercase;
border-bottom: 1px solid #f0f0f0;
line-height: 40px;
display: block;
text-decoration: none; }
.single li a:hover {
color: #ff173c; }
.single li:last-child a {
border-bottom: 0; }
</style>


<div class="col-md-5">
        <!-- Localisations -->
    <div class="single category">
        <h3 class="side-title">Localisations</h3>
        
<br />
<div class="container">
    <div class="row">
        <div class="ui-widget">
            <select name="location" id="location" class="selectpicker" data-live-search="true">
                  <option value="">Select localisation</option>
                @foreach($localisations as $localisation)
                  <option value="{{ $localisation->id }}" data-tokens="{{ $localisation->id }}">{{ $localisation->name }}</option>
                @endforeach
            </select>
        </div>
    </div>
</div>
   </div>
</div>


<div class="col-md-5">
        <!-- Localisations -->
    <div class="single category">
        <h3 class="side-title">Map</h3>
        
<br />
<div id="map"></div>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-core.js"></script>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-service.js"></script>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-ui.js"></script>
   <script src="https://js.api.here.com/v3/3.1/mapsjs-mapevents.js"></script>
   <script>
    var lat = <?php echo json_encode($lat); ?>;
    var lng = <?php echo json_encode($lng); ?>;
      const platform = new H.service.Platform({ apikey: 'FLHMxXKzDJMc4N70jJKiKBk8CFxM4NWRKJztyGUE7L8' });
      const defaultLayers = platform.createDefaultLayers();
      const map = new H.Map(document.getElementById('map'),
         defaultLayers.vector.normal.map, {
         center: { lat: lat, lng: lng },
         zoom: 13,
         pixelRatio: window.devicePixelRatio || 1
      });
      window.addEventListener('resize', () => map.getViewPort().resize());
      const behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));
      const ui = H.ui.UI.createDefault(map, defaultLayers);
   </script>
   </div>
</div>




            </div>
        </div>
    </div>


@section('footer')

<script>
    $(document).ready(function(){
        $("#location").change(function(){
            var id = $("#location").val();
            window.location.href = '/meteo/'+id;
        }); 
    });
</script>

    <script src="{{ asset('js/dm.js') }}"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script> -->

@endsection
