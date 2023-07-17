<!DOCTYPE html>
<html>

<head>
    <title>Signup </title>
</head>

<body>
    <h1>Register User</h1>
    <form method="post">
        
        ID :
        <input type="text" name="id">
        <br><br><br>
        FullName :
        <input type="text" name="name">
        <br><br><br>
        Occupation :
        <input type="text" name="occupation">
        <br><br><br>
        PhoneNumber :
        <input type="number" name="phone">
        <br><br><br>
        Email :
        <input type="email" name="email">
        <br><br><br>
        PASSWORD:
        <input type="password" name="password">
        <br><br><br>
        Income :
        <input type="number" name="income">
        <br><br><br>
        DOB :
        <input type="date" name="dob">
        <br><br><br>
        Address :
        <input type="text" name="address">
        <br><br><br>
        AdharNumber :
        <input type="number" name="adharnumber">
        <br><br><br>
        <input type="submit" name="btn1" value="REGISTER">
      
        <a href="userlogin.php">LOGIN</a>
    </form>
    <?php
    if (isset($_POST["btn1"])) {

        $id = $_POST["id"];
        $name = $_POST["name"];
        $occupation = $_POST["occupation"];
        $PhoneNumber = $_POST["phone"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $Income = $_POST["income"];
        $DOB = $_POST["dob"];
        $Address = $_POST["address"];
        $AdharNumber = $_POST["adharnumber"];

        $con = mysqli_connect("localhost", "root","","visankat_users");

        if ($con) {
            $q = "INSERT INTO `user` ( `userId`,`name`, `occupation`, `phone_num`, `email`, `password`, `annual_Income`, `dob`, `address`, `adhar_number`) VALUES ( '$id','$name', '$occupation', '$PhoneNumber','$email','$password','$Income','$DOB',' $Address','$AdharNumber');";
            $r = mysqli_query($con, $q);
            if ($r) {
                echo " User Added";
            } else {
                echo "Not Added";
            }
        } else {
            echo "Not connect";
        }
    }
    ?>
</body>

</html>