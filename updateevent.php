<?php
    include_once '/home/rhdmzyzf/public_html/Ewallet/config/Database.php';
    $database = new Database();
    $db = $database->getConnection();
    $conn = $db;
    
    $stmt = $conn->query("set global event_scheduler = 'ON'");
    if($stmt->execute())
    {
        echo "ok";
    } else {
        echo "not ok";
    }
    
    
?>