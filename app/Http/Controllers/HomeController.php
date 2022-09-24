<?php

namespace App\Http\Controllers;

use App\Library\IPAPI;
use App\Library\sHelper;
use App\Models\Group;
use App\Models\Hobby;
use App\Models\Post;
use App\Models\User;
use App\Community;
use DB;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;



class HomeController extends Controller
{

    public function __construct()
    {

       $this->middleware('auth');

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $user = Auth::user();

        $wall = [
            'new_post_group_id' => 0
        ];




        return view('home', compact('user', 'wall'));

    }


    public function search(Request $request){


        $s = $request->input('s');
        if (empty($s)) return redirect('/');


        $user = Auth::user();

        $posts = Post::leftJoin('users', 'users.id', '=', 'posts.user_id')
            ->where(function($query) use ($user) {

                $query->where('users.private', 0)->orWhere(function($query) use ($user){
                    $query->whereExists(function ($query) use($user){
                        $query->select(DB::raw(1))
                            ->from('user_following')
                            ->whereRaw('user_following.following_user_id = users.id and user_following.follower_user_id = '.$user->id);
                    });
                })->orWhere(function($query) use ($user){
                    $query->where('users.private', 1)->where('users.id', $user->id);
                });

            })->where('posts.content', 'like', '%'.$s.'%')->where('posts.group_id', 0)
            ->groupBy('posts.id')->select('posts.*')->orderBy('posts.id', 'DESC')->get();

        $comment_count = 2;

        $users = User::where('name', 'like', '%'.$s.'%')->orWhere('username', 'like', '%'.$s.'%')->orderBy('name', 'ASC')->get();

        $communities = Community::where('title', 'like', '%'.$s.'%')->orderBy('title', 'ASC')->get();

        return view('search', compact('users', 'posts', 'user', 'comment_count','communities'));

    }

    public function users()
    {
        $users = User::all();
        return $users;
    }

    public function show(User $user)
    {
        return $user;
    }

    public function store(Request $request)
    {
//        $user = User::create($request->all());
//
//        return response()->json($user);
        $user = new User();
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $pass = $request->input('password');
        $user->password = Hash::make($pass);


        $user->save();


    }
public function delete(User $user)
    {
        $user->delete();

        return response()->json(null);
    }

}
