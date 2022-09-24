<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class UserRelationship extends Model
{

    protected $table = 'user_relationship';

    public $timestamps = false;


    public function relative(){
        return $this->belongsTo('App\Models\User', 'related_user_id');
    }

    public function main(){
        return $this->belongsTo('App\Models\User', 'main_user_id');
    }

    public function getAllow(){
        return $this->allow;
    }

    public function getType(){
        if ($this->relation_type == 0){
            return "Мама";
        }else if($this->relation_type == 1){
            return "Папа";
        }else if($this->relation_type == 2){
            return "Муж/жена";
        }else if($this->relation_type == 3){
            return "Сестра";
        }else if($this->relation_type == 4){
            return "Брат";
        }else{
            return "Отношения";
        }
    }
}
