<?php

$con=mysqli_connect('localhost:3309','root','','visankat_users');
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $uid=$_POST['uid'];
    
	     
		 $stmt = "select * from wallet where userId='$uid';";
	     $result= mysqli_query($con,$stmt);
	
	    	if(mysqli_num_rows($result)!=0){
		
		    $i=0;
			 while($row = mysqli_fetch_assoc($result))
			 {
				 $data[$i]=$row;
				 $i++;
			 }
			 echo json_encode($data);
	   	
     	}
}
	  
