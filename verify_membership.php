<?php

$con=mysqli_connect('localhost:3309','root','','visankat_users');
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $uid=$_POST['uid'];
    
	     
		 $stmt = "select m.*,x.memName from `membership` x ,`membership_taken` m where m.`user_id`='$uid' and m.mem_id=x.memId;";
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
	  
