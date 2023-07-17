<?php
$con = mysqli_connect("localhost", "root","","visankat_users");
$response = array();
if($con){
    $sql = "SELECT * FROM `user' ";
    $result = mysqli_query($con,$sql);

    if($result){
        header("Content-Type: JSON");
        $i=0;
        while($row = mysqli_fetch_assoc($result)){
            $response[$i]['id'] = $row['id'];
            $response[$i]['fullname'] = $row['fullname'];
            $response[$i]['occupation'] = $row['occupation'];
            $response[$i]['phonenumber'] = $row['phonenumber'];
            $response[$i]['email'] = $row['email'];
            $response[$i]['password'] = $row['password'];
            $response[$i]['income'] = $row['income'];
            $response[$i]['dob'] = $row['dob'];
            $response[$i]['address'] = $row['address'];
            $response[$i]['adharnumber'] = $row['adharnumber'];
            $i++;

        }
        echo json_encode($response,JSON_PRETTY_PRINT);
  //added      
  //       $fp = fopen('response.json', 'w');
    //fwrite($fp, json_encode($response));
    //fclose($fp);  //added
    }
}else{
    echo "Database Connection failed !";
}

?>