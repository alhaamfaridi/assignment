<!DOCTYPE html>
<html>
<head>
<title>Record show</title>
</head>
<body>
<table width="400px" border=2>
<tr>
<th>ID</th>
<th>Full Name</th>
<th>Occupation</th>
<th>Phone Number</th>
<th>Email</th>
<th>Password</th>
<th>Income</th>
<th>Dob</th>
<th>Address</th>
<th>Adharnumber</th>
</tr>
<?php
$con = mysqli_connect("localhost", "root","","visankat_users");

if($con)
{
$q="SELECT * FROM `user`";
$r=mysqli_query($con,$q);

while($f=mysqli_fetch_array($r)) 
{
echo "<tr>
        <td>$f[0]</td>
        <td>$f[1]</td>
        <td>$f[2]</td>
        <td>$f[3]</td>
        <td>$f[4]</td>
        <td>$f[5]</td>
        <td>$f[6]</td>
        <td>$f[7]</td>
        <td>$f[8]</td>
        <td>$f[9]</td>
        
     </tr>";
}
}
else
{
echo "Not connected";
}
mysqli_close($con);
?>
</table>
</body>
</html>