<?php 
    include('dbconnect.php');
    session_start();

    // $contacts = "01234, 56789";
    // $_SESSION["contacts"] = explode(', ', $contacts);
    // $array = $_SESSION["contacts"];
    // echo $array[1];

    echo "Today is " . date("Y-m-d") . "<br>";
?>