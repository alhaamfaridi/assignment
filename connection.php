
<?php 
$servername = "localhost";  
$username = "root";  
$password = "";  
$database = "visankat_users";  
$con = mysqli_connect($servername, $username, $password, $database);  
if ($conn->connect_error) {  
    die("Connection failed: " . $con->connect_error);  
}  
?>

  