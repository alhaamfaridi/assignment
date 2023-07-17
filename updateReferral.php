<?php
include_once 'C:\\wamp64\\www\\Ewallet\\config\\Database.php';
$database = new Database();
$con= $database->getConnection();
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $uid=$_POST['uid'];
	     
		
	     $stmt = "select * from referrals where user_id='$uid';";
	     $result= mysqli_query($con,$stmt);
	    if(mysqli_num_rows($result)!=0){
		
		   $query = "update referrals set activated=1 where user_id='$uid';";
	       $result= mysqli_query($con,$query);
     	}
		else
		{
	     $query = "insert into referrals(user_id,activated) values('$uid','1');";
	     $result= mysqli_query($con,$query);
		}
}