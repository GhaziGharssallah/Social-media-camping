<?php

namespace App\Http\Controllers;
use App\Models\Post;
use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function create(Request $request ) {

          $posts = new Post();

     $posts->content = $request->input('content');
//          $posts->content = $_REQUEST->input('content');

             $posts->save();
             return response()->json($posts);

    }
}
