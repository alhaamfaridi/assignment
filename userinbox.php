<h1>Welcome to the Dashboard page</h1>
<!DOCTYPE html>
<html>

<head>
    <title>MEMBERSHIP PLANS </title>
</head>

<body style="font-size:1.1vw">
    <h1>Categories</h1>
  <!-- <?php
    //    if(array_key_exists('silver', $_POST)) {
    //     <a href="wallet\transfercoin.php">Transfer Coin</a>
    //     }
    //     else if(array_key_exists('gold', $_POST)) {
    //         <a href="wallet\transfercoin.php">Transfer Coin</a>
    //     }
        
    //     if(array_key_exists('platinum', $_POST)) {
    //         <a href="wallet\transfercoin.php">Transfer Coin</a>
    //     }
    //     else if(array_key_exists('premium', $_POST)) {
    //         <a href="wallet\transfercoin.php">Transfer Coin</a>
    //     } 
        ?> 
         -->

    <form method="post">
        
    Plan-1 Silver→Monthly 1000rs
    <a href="wallet\transfercoin.php"><button name="silver"style="background-color:powderblue";>Opt In</button></a>
    <!-- <input type="submit" name="silver" style="background-color:powderblue"; value="Opt IN"> -->
        <br><br><br>
    Plan-2 Gold→Yearly 10000rs
    <input type="submit" name="gold"style="background-color:powderblue";  value="Opt IN">
        <br><br><br>
    Plan-3 Platinum→1time payment Rs200000
    <input href="wallet\transfercoin.php" type="submit" name="platinum" style="background-color:powderblue";  value="Opt IN">
    <br><br><br>
    Plan 4 Premium→1time payment Rs2000000
        <input type="submit" name="premium" style="background-color:powderblue"; value="Opt IN">
        <br><br><br>
        
      
        <!-- <a href="wallet\transfercoin.php">Transfer Coin</a> -->
    </form>
</body>

</html>