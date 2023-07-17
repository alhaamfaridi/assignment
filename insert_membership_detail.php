<?php

$con=mysqli_connect('localhost:3309','root','','visankat_users');
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $mid=$_POST['mid'];
		$uid=$_POST['uid'];
		$sd=$_POST['startdate'];
		$ed=$_POST['enddate'];
		$p=$_POST['price'];
    
	     
		 $stmt = "INSERT INTO `membership_taken` (`user_id`, `mem_id`, `start_date`, `end_date`, `amount_paid`) VALUES ('$uid', '$mid', '$sd', '$ed', '$p');";
	     $result= mysqli_query($con,$stmt);
	
	    //	if(mysqli_num_rows($result)!=0){
		
		//    $i=0;
		//	 while($row = mysqli_fetch_assoc($result))
		//	 {
		//		 $data[$i]=$row;
		//		 $i++;
		//	 }
		//	 echo json_encode($data);
	   	
}
	  
