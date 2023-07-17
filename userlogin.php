<!DOCTYPE html>
<html>
<head>
    <title>User login</title>
</head>

<body>
    <form method="post">
        USERNAME:
        <input type="text" name="txtun">
        <br><br><br>
        PASSWORD:
        <input type="password" name="txtup">
        <br><br><br>
        <input type="submit" name="btn1" value="LOGIN">
        <br>

    </form>
    <?php
    if (isset($_POST["btn1"])) {
        $a = $_POST["txtun"];
        $b = $_POST["txtup"];
        $con = mysqli_connect("localhost", "root","","visankat_users");
        if ($con) {
            $q = "select * from user where name='$a' and password='$b'";
            $r = mysqli_query($con, $q);
            $c = mysqli_num_rows($r);
            if ($c > 0) {
                session_start();
                $_SESSION["un"] = $a;

                header("Location:userinbox.php");
            } else {
                echo "Invalid Login";
            }
        } else {
            echo "Not connect";
        }
        mysqli_close($con);
    }

    ?>
</body>

</html>