<?php
require_once 'Connexion.php';

$id=$_GET['id'];
/*
$query = "SELECT * FROM tb_client where id_client='$ID'";

*/$query="SELECT * FROM users WHERE id='$id'";

$result = mysqli_query($con,$query);

$array = array();

while ($row  = mysqli_fetch_assoc($result))
{
	$array[] = $row;
}


echo ($result) ?
json_encode(array("code" => 1, "result"=>$array)) :
json_encode(array("code" => 0, "message"=>"Data not found !"));


?>