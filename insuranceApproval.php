<?php
include_once 'C:\\wamp64\\www\\Ewallet\\config\\Database.php';
$database = new Database();
$con= $database->getConnection();
if($con){
	 //INSERTING DATA----------------------------------------------------------------------------------------------------------
	    $inid=$_POST['inid'];
        $dec=$_POST['dec'];
	     
		 $stmt = "update insurance set insurance_status='$dec' where `insuranceId`='$inid';";
	     $result= mysqli_query($con,$stmt);
	
	    //	if(mysqli_num_rows($result)!=0){
		
		//    $i=0;
		//	 while($row = mysqli_fetch_assoc($result))
		//	 {
		//		 $data[$i]=$row;
		//		 $i++;
		//	 }
			// echo json_encode($data);
	   	
     	//}
}
	  
