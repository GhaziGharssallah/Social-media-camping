<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

// users 
//Route::get('users', 'HomeController@users');



//Route::get('user/{user}' , 'HomeController@show');
//Route::post('users','HomeController@store');
//Route::put('users','SettingsController@update');
//Route::delete('users/{user}', 'HomeController@delete');
//Route::post('user','Auth\RegisterController@create');



//posts
Route::get('onepost/{post}' , 'PostsController@show');
Route::get('allpost' , 'PostsController@posts');

/*Route::get('posts', 'PostsController@posts');
Route::post('postsdelete', 'PostsController@delete');
Route::post('/posts','ApiController@create');
Route::get('/posts','ApiController@create');*/


//user
//Route::post('/register', 'AuthController@register');
Route::post('/login', 'AuthController@login');
Route::get('/user', 'AuthController@getCurrentUser');
Route::post('/update', 'AuthController@update');
Route::get('/logout', 'AuthController@logout');
Route::post('register', 'API\UserController@register');

