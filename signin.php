<?php
session_start();
include('dbconnect.php');

$_SESSION["email"] = $_POST["email"];
$_SESSION["password"] = $_POST["password"];

if (isset($_SESSION["email"]) && isset($_SESSION["password"])) {
    $email = $_SESSION["email"];
    $password = $_SESSION["password"];

    $tables = array('advisor', 'department', 'oca', 'registered_member', 'verified_sponsor');
    foreach ($tables as $table) {
        $sql = "SELECT * FROM $table WHERE Email = '$email' AND Password = '$password'";
        $rows = mysqli_query($conn, $sql);
        if ($row = mysqli_fetch_assoc($rows)) {
            if ($row["Designation"] == 'Member') {
                $_SESSION["view"] = "Member";
            } else if ($row["Designation"] == 'President' || $row["Designation"] == 'Vice President' || $row["Designation"] == 'General Secretary' || $row["Designation"] == 'Treasurer') {
                $_SESSION["view"] = "Panel";
            } else if ($row["Designation"] == 'Advisor') {
                $_SESSION["view"] = "Advisor";
            } else if ($row["Designation"] == 'Officer of Co-curricular Activities') {
                $_SESSION["view"] = "Oca";
            } else if ($row["Designation"] == 'Chairperson') {
                $_SESSION["view"] = "Department";
            } else if ($row["Designation"] == 'Sponsor') {
                $_SESSION["view"] = "Sponsor";
            }
            header('Location: profile.php?mssg=Successfully Logged In');
            exit();
        }
    }
    header('Location: login.php?error=Invalid Email or Password');
    session_destroy();
    exit();
}
?>
