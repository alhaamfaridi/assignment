<?php   
  require_once 'connection.php';  
  $response = array();  
  if(isset($_GET['apicall'])){  
  switch($_GET['apicall']){  
  case 'signup':  
    if(isTheseParametersAvailable(array('name','occupation','phone','email','password','income','dob','address','adharnumber')))
{  

 $name = $_POST["name"];
        $occupation = $_POST["occupation"];
        $PhoneNumber = $_POST["phone"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $income = $_POST["income"];
        $dob = $_POST["dob"];
        $address = $_POST["address"];
        $adharnumber = $_POST["adharnumber"];

$stmt = $conn->prepare("SELECT id FROM user WHERE name = ? OR email = ?");  
 $stmt->bind_param("ss", $name, $email);  
    $stmt->execute();  
    $stmt->store_result();  
if($stmt->num_rows > 0){  
        $response['error'] = true;  
        $response['message'] = 'User already registered';  
        $stmt->close();  
    }  
    else{  
$stmt = $conn->prepare("INSERT INTO user (name, occupation, phone, email, password, income, dob, address, adharnumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"); 

 $stmt->bind_param("ssss", $name, $occupation, PhoneNumber, $email, $password, $income, $dob, $address, $adharnumber);

if($stmt->execute()){ 
 
            $stmt = $conn->prepare("SELECT id, id, name, occupation, phone, email, password, income, dob, address, adharnumber FROM user WHERE name = ?");   
            $stmt->bind_param("s",$name);  
            $stmt->execute(); 
 
$stmt->bind_result($userid, $id, $name, $occupation, PhoneNumber, $email, $password, $income, $dob, $address, $adharnumber);
   $stmt->fetch();  
   
            $user = array(  
            'id'=>$id,   
            'name'=>$name,
	    'occupation'=>$occupation,
	    'phone'=>$PhoneNumber,   
            'email'=>$email,  
	    'password'=>$password,
            'income'=>$income,
	    'dob'=>$dob,
	    'address'=>$address,
	    'adharnumber'=>$adharnumber  
            );  
   
            $stmt->close();  

 $response['error'] = false;   
            $response['message'] = 'User registered successfully';   
            $response['user'] = $user;   
        }  
    } 
}

else{  
    $response['error'] = true;   
    $response['message'] = 'required parameters are not available';   
}  
break;  

  case 'login':  
  if(isTheseParametersAvailable(array('name', 'password'))){  
    $name = $_POST['name'];  
    $password = md5($_POST['password']); 
$stmt = $conn->prepare("SELECT id, name, occupation, phone, email, password, income, dob, address, adharnumber FROM user WHERE name = ? AND password = ?");  
    $stmt->bind_param("ss",$name, $password);  
$stmt->execute();  
    $stmt->store_result();  
    if($stmt->num_rows > 0){  
    $stmt->bind_result($userid, $id, $name, $occupation, $PhoneNumber, $email, $password, $income, $dob, $address, $adharnumber);  
    $stmt->fetch();  
  //  $user = array( 
 $user = array(  
            'id'=>$id,   
            'name'=>$name,
	    'occupation'=>$occupation,
	    'phone'=>$PhoneNumber,   
            'email'=>$email,  
	    'password'=>$password,
            'income'=>$income,
	    'dob'=>$dob,
	    'address'=>$address,
	    'adharnumber'=>$adharnumber  
 );  
   
    $response['error'] = false;   
    $response['message'] = 'Login successfull';   
    $response['user'] = $user;   
 }  
 else{  
    $response['error'] = false;   
    $response['message'] = 'Invalid username or password';  
 }  
}  
break;   
default:   
 $response['error'] = true;   
 $response['message'] = 'Invalid Operation Called';  
}  
}  
else{  
 $response['error'] = true;   
 $response['message'] = 'Invalid API Call';  
}  
echo json_encode($response);  
function isTheseParametersAvailable($params){  
foreach($params as $param){  
 if(!isset($_POST[$param])){  
     return false;   

}  
}  
return true;   
}  
?>  