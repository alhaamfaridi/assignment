<?php
include_once 'D:\\XAMPP\\htdocs\\Ewallet\\config\\Database.php';
$database = new Database();
$con= $database->getConnection();
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $query=$_POST['query'];		
	    $result= mysqli_query($con,$query);
}