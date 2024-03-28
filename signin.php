<?php
include('dbconnect.php');
session_start();

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
                header('Location: member.php');
                exit();
            } else if ($row["Designation"] == 'President' || $row["Designation"] == 'Vice President' || $row["Designation"] == 'General Secretary' || $row["Designation"] == 'Treasurer') {
                header('Location: panel.php');
                exit();
            } else if ($row["Designation"] == 'Advisor') {
                header('Location: advisor.php');
                exit();
            } else if ($row["Designation"] == 'Officer of Co-curricular Activities') {
                header('Location: oca.php');
                exit();
            } else if ($row["Designation"] == 'Chairperson') {
                header('Location: department.php');
                exit();
            } else if ($row["Designation"] == 'Sponsor') {
                header('Location: sponsor.php');
                exit();
            }
        }
    }
    header('Location: login.php?error=Invalid Email or Password');
    exit();
}
?>
