<?php

class Constants
{
    //DATABASE DETAILS
    static $DB_SERVER="localhost";
    static $DB_NAME="camp_pro";
    static $USERNAME="root";
    static $PASSWORD="";

    //STATEMENTS
    $id=$_GET['id'];

    static $SQL_SELECT_USER="SELECT * FROM users where id='$id'";

}

class User
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
    public function selectUser()
    {
        $con=$this->connect();
        if($con != null)
        {
            $result=$con->query(Constants::$SQL_SELECT_USER);
            if($result->num_rows>0)
            {
                $users=array();
                while($row=$result->fetch_array())
                {
                    array_push($users, array("id"=>$row['id'],"profile_path"=>$row['profile_path'],"email"=>$row['email'],"name"=>$row['name'],"username"=>$row['username'],"cover_path"=>$row['cover_path']));
                }
                print(json_encode(array_reverse($users)));
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
$users=new User();
$users->selectUser();

//end