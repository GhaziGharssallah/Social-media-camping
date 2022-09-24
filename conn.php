<?php

$connect = new mysqli("localhost","root","","camp_back_office");

if($connect){
	 echo "Connection seccus";
}else{
	echo "Connection Failed";
	exit();
}
