<?php
namespace App\Library;


use App\Models\City;
use App\Models\Country;
use App\Models\PostComment;
use App\Models\PostLike;
use App\User;
use App\Models\UserFollowing;
use App\Models\UserLocation;
use Auth;
use DB;

class sHelper
{

    static $notifications = null;



    public static function followButton($following, $follower, $element, $size = ''){

        if ($following  == $follower) return "This is me";

        $relation = UserFollowing::where('following_user_id', $following)->where('follower_user_id', $follower)->get()->first();

        if ($relation){
            if ($relation->allow == 0) {
                return '<a href="javascript:;" class="btn btn-default request-button '.$size.'" onclick="follow(' . $following . ', ' . $follower . ', \''.$element.'\', \''.$size.'\')"></a>';
            }elseif ($relation->allow == 1){
                return '<a href="javascript:;" class="btn btn-default following-button '.$size.'" onclick="follow('.$following.', '.$follower.', \''.$element.'\', \''.$size.'\')"></a>';
            }
        }

        return '<a href="javascript:;" class="btn btn-default follow-button '.$size.'" onclick="follow('.$following.', '.$follower.', \''.$element.'\', \''.$size.'\')"><i class="fa fa-plus-circle"></i> Follow</a>';

    }


    public static function deniedButton($me, $follower, $element, $size = ''){
        if ($me  == $follower) return "";

        $relation = UserFollowing::where('following_user_id', $me)->where('follower_user_id', $follower)->get()->first();

        if ($relation){
            if ($relation->allow == 1) {
                return '<a href="javascript:;" class="btn btn-danger '.$size.'" onclick="deniedFollow('.$me.', '.$follower.', \''.$element.'\', \''.$size.'\')" data-toggle="tooltip" title="Block">
                <i class="fa fa-times"></i>
                </a>';
            }
        }
    }




    public static function notifications(){
        if (self::$notifications == null){
            $notifications = [];

            $user = Auth::user();

            $followers = $user->follower()->where('allow', 0)->count();
            if ($followers > 0){
                $notifications[] = [
                    'url' => url('/followers/pending'),
                    'icon' => 'fa-user-plus',
                        'text' => $followers.' demande d\'abonnement'
                ];
            }

               $relatives = $user->relatives()->where('allow', 0)->count();



            $comments = DB::table('post_comments')->where([['seen', 0],['comment_user_id','!=', $user->id]])->join('posts', 'posts.id', '=', 'post_comments.post_id')
                ->where('posts.user_id', $user->id)->select('post_comments.*')->orderBy('id', 'DESC');
            if ($comments->count() > 0){
                foreach ($comments->get() as $comment){
                $name = DB::table('users')->where('id',$comment->comment_user_id)->value('name');
                    $notifications[] = [
                        'url' => url('/post/'.$comment->post_id),
                        'icon' => 'fa-commenting',
                        'text' => $name.' a laiss?? un commentaire'
                    ];
                }

            }
            $likes = DB::table('post_likes')->where([['seen', 0],['like_user_id','!=', $user->id]])->leftJoin('posts', 'posts.id', '=', 'post_likes.post_id')
                ->where('posts.user_id', $user->id)->select('post_likes.*')->orderBy('id', 'DESC')->get();
            if ($likes->count() > 0){
                foreach ($likes as $likne){
                    $name = DB::table('users')->where('id',$likne->like_user_id)->value('name');
                    $notifications[] = [
                        'url' => url('/post/'.$likne->post_id),
                        'icon' => 'fa-heart',
                        'text' => $name.' aime votre image'
                    ];
                }

            }
            self::$notifications = $notifications;
        }
        return self::$notifications;
    }

//    public static function ip($request){
//        $ip = $request->headers->get('CF_CONNECTING_IP');
//        if (empty($ip))$ip = $request->ip();
//        return $ip;
//    }

//    public static function alternativeAddress($ip, $id){
//        $query = IPAPI::query($ip);
//
//        if ($query->status == "success") {
//
//
//
//            $country_name = $query->country;
//            $lat = $query->lat;
//            $lon = $query->lon;
//            $city = $query->city;
//            $country_code = $query->countryCode;
//
//            $find_country = Country::where('shortname', $country_code)->first();
//            $country_id = 0;
//            if ($find_country) {
//                $country_id = $find_country->id;
//            } else {
//                $country = new Country();
//                $country->name = $country_name;
//                $country->shortname = $country_code;
//                if ($country->save()) {
//                    $country_id = $country->id;
//                }
//            }
//
//            $city_id = 0;
//            if ($country_id > 0) {
//                $find_city = City::where('name', $city)->where('country_id', $country_id)->first();
//                if ($find_city) {
//                    $city_id = $find_city->id;
//                } else {
//                    $city = new City();
//                    $city->name = $city;
//                    $city->zip = "1";
//                    $city->country_id = $country_id;
//                    if ($city->save()) {
//                        $city_id = $city->id;
//                    }
//                }
//            }
//
//
//            if (!empty($lat) && !empty($lon) && !empty($city) && !empty($country_code) && !empty($city_id) && !empty($country_id)) {
//
//                self::updateLocation($id, $city_id, $lat, $lon, $city);
//            }
//        }
//
//    }

//    public static function updateLocation($id, $city_id, $lat, $long, $address){
//        $find_location = UserLocation::where('user_id', $id)->first();
//
//
//        if (!$find_location) {
//
//            $find_location = new UserLocation();
//            $find_location->user_id = $id;
//
//        }
//
//
//        $find_location->city_id = $city_id;
//        $find_location->latitud = $lat;
//        $find_location->longitud = $long;
//        $find_location->address = $address;
//
//        $find_location->save();
//    }
}
