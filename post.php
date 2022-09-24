<?php

class Constants
{
    //DATABASE DETAILS
    static $DB_SERVER="localhost";
    static $DB_NAME="camp_back_office";
    static $USERNAME="root";
    static $PASSWORD="";

    //STATEMENTS.
    static $SQL_INSERT = "INSERT INTO `all_posts`(`image_path`, `content`) SELECT image_path,content from posts, post_images where posts.id= post_images.post_id";
   // static $SQL_INSERT_NAME = "INSERT INTO `all_posts`('name') SELECT name from users where user_id = users.id";
    static $SQL_SELECT_POST="SELECT * FROM all_posts ";

}

class Post
{
    /*******************************************************************************************************************************************/
    /*
       1.CONNECT TO DATABASE.
       2. RETURN CONNECTION OBJECT
    */
    public function connect()
    {
        $con=new mysqli(Constants::$DB_SERVER,Constants::$USERNAME,Constants::$PASSWORD,Constants::$DB_NAME);
        if($con->connect_error)
        {
            // echo "Unable To Connect"; - For debug
            return null;
        }else
        {
            //echo "Connected"; - For debug
            return $con;
        }
    }
    /*******************************************************************************************************************************************/
    /*
       1.SELECT FROM DATABASE.
    */
    public function selectPost()
    {
        $con=$this->connect();

        if($con != null)

        {

        	       $res=$con->query(Constants::$SQL_INSERT);

            $result=$con->query(Constants::$SQL_SELECT_POST);
            if($result->num_rows>0)
            {
                $posts=array();
                while($row=$result->fetch_array())
                {
                    array_push($posts, array("id"=>$row['id'],"image_path"=>$row['image_path'],"content"=>$row['content']));
                }
                print(json_encode(array_reverse($posts)));
            }else
            {
                print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
            }
            $con->close();

        }else{
            print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
        }
    }
}
$posts=new Post();
$posts->selectPost();

//end
