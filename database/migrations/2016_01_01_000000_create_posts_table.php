<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Create table for storing roles
        Schema::create('posts', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('author_id');
            $table->integer('category_id')->nullable();

            $table->string('seo_title')->nullable();
            $table->text('excerpt');
            $table->text('body');
            $table->string('image')->nullable();
            $table->string('slug')->unique();
            $table->text('meta_description');
            $table->text('meta_keywords');
            $table->enum('status', ['PUBLISHED', 'DRAFT', 'PENDING'])->default('DRAFT');
            $table->boolean('featured')->default(0);
            $table->integer('user_id')->unsigned();
            $table->integer('group_id')->nullable();
            $table->boolean('has_image')->default(0);
            $table->text('content')->nullable();
            $table->text('title');

            $table->foreign('user_id')->references('id')->on('users')->onDelete('CASCADE');


            $table->timestamps();
        });

        Schema::create('post_comments', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('post_id')->unsigned();
            $table->integer('comment_user_id')->unsigned();

            $table->text('comment');

            $table->foreign('post_id')->references('id')->on('posts')->onDelete('CASCADE');
            $table->foreign('comment_user_id')->references('id')->on('users')->onDelete('CASCADE');


            $table->timestamps();
        });

        Schema::create('post_images', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('post_id')->unsigned();
            $table->string('image_path');

            $table->foreign('post_id')->references('id')->on('posts')->onDelete('CASCADE');

        });

        Schema::create('post_likes', function (Blueprint $table) {
            $table->integer('post_id')->unsigned();
            $table->integer('like_user_id')->unsigned();

            $table->timestamps();

            $table->foreign('post_id')->references('id')->on('posts')->onDelete('CASCADE');
            $table->foreign('like_user_id')->references('id')->on('users')->onDelete('CASCADE');


            $table->primary(['post_id', 'like_user_id']);

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('post_images');
        Schema::dropIfExists('post_likes');
        Schema::dropIfExists('post_comments');
        Schema::dropIfExists('posts');

    }
}
