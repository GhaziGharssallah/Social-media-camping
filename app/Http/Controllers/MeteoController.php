<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Response;
use View;
use Session;
use DB;
use Log;
use Cache;
use App\Models\Localisation;

class MeteoController extends Controller
{
public $lan; public $lang;
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // user connected :
        $user = Auth::user();

        $this->lan = "36.41363";
        $this->lang = "10.40071" ;

        // liste de localisations :
        $localisations = Localisation::all();

        $minutes = 0;
        $forecast = Cache::remember('forecast', $minutes, function () {
        Log::info("Not from cache");
        $app_id = "0tL0PIALgK12GCkNtf20";
        $app_code = "HxWHGhO9IQtBiyL-WcgKTw";
        $lat = $this->lan ;
        $lng = $this->lang;
        $url = "https://weather.api.here.com/weather/1.0/report.json?product=forecast_hourly&latitude=${lat}&longitude=${lng}&oneobservation=true&language=fr&app_id=${app_id}&app_code=${app_code}";
        Log::info($url);
        $client = new \GuzzleHttp\Client();
        $res = $client->get($url);
        if ($res->getStatusCode() == 200) {
          $j = $res->getBody();
          $obj = json_decode($j);
          $forecast = $obj->hourlyForecasts->forecastLocation;
        }
        return $forecast;
      });

      return view('messages.index')
        ->with('forecast',$forecast)
        ->with('user', $user)
        ->with('localisations', $localisations)
        ->with('lat', $this->lan)
        ->with('lng', $this->lang);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $localisation = Localisation::where('id',$id)->first();
        //dd($localisation->longitude);
        
        //laltitude :
       
            $this->lan = $localisation->latitude;
        

        //longitude :
        
            $this->lang = $localisation->longitude;
       

        // user connected :
        $user = Auth::user();

        // liste de localisations :
        $localisations = Localisation::all();


        $minutes = 0;
        $forecast = Cache::remember('forecast', $minutes, function () {
        Log::info("Not from cache");
        $app_id = "0tL0PIALgK12GCkNtf20";
        $app_code = "HxWHGhO9IQtBiyL-WcgKTw";
        $lat = $this->lan; //"41.894392700114";
        $lng = $this->lang; //"12.483014757919278";
        $url = "https://weather.api.here.com/weather/1.0/report.json?product=forecast_hourly&latitude=${lat}&longitude=${lng}&oneobservation=true&language=fr&app_id=${app_id}&app_code=${app_code}";
        Log::info($url);
        $client = new\GuzzleHttp\Client();
        $res = $client->get($url);
        if ($res->getStatusCode() == 200) {
          $j = $res->getBody();
          $obj = json_decode($j);
          $forecast = $obj->hourlyForecasts->forecastLocation;
        }
        return $forecast;
      }); 

      return view('messages.index')
        ->with('forecast',$forecast)
        ->with('user', $user)
        ->with('localisations', $localisations)
        ->with('lat', $this->lan)
        ->with('lng', $this->lang);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
