<?php

$con=mysqli_connect('localhost:3309','root','','visankat_users');
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $query=$_POST['uid'];
    
	     //echo $uid;
		
	     $result= mysqli_query($con,$query);
	
	    	if(mysqli_num_rows($result)!=0){
		
			echo "1234";
		    $i=0;
			 while($row = mysqli_fetch_assoc($result))
			 {
				 $data[$i]=$row;
				 $i++;
			 }
			 echo json_encode($data);
	   	
     	}
}
	  
