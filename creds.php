<?php
include('dbconnect.php');
session_start();

$_SESSION["role"] = $_POST["role"];
$_SESSION["email"] = $_POST["email"];
$_SESSION["password"] = $_POST["password"];

if(isset($_SESSION["role"]) && isset($_SESSION["email"]) && isset($_SESSION["password"])){

    $role = $_SESSION["role"];
    $email = $_SESSION["email"];
    $password = $_SESSION["password"];

    if($role == 'Member'){
        $sql = "SELECT * FROM registered_member WHERE Email = '$email' AND Password = '$password'";
        $result = mysqli_query($conn, $sql);

        while($row = mysqli_fetch_assoc($result)){
            printf($row["Name"]);
        }
    }
}

?>