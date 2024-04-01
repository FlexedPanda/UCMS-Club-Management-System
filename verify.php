<?php
session_start();
include('dbconnect.php');

//Session Store
$_SESSION["name"] = $_POST["name"];
$_SESSION["agent"] = $_POST["agent"];
$_SESSION["contacts"] = explode(', ', $_POST["contacts"]);
$_SESSION["email"] = $_POST["email"];
$_SESSION["password"] = $_POST["password"];
$check = $_POST["confirm"];


//For Usage
$name = $_SESSION["name"];
$agent = $_SESSION["agent"];
$contacts = $_SESSION["contacts"];
$email = $_SESSION["email"];
$password = $_SESSION["password"];


//Request Check
$sql1 = "SELECT Name, Email FROM unverified_sponsor WHERE Name = '$name' AND Email = '$email'";
$sql2 = "SELECT Sponsor FROM tsponsor_contact WHERE Sponsor = '$name'";
$rows1 = mysqli_query($conn, $sql1);
$rows2 = mysqli_query($conn, $sql2);

if (mysqli_num_rows($rows1) != 0 || mysqli_num_rows($rows2) != 0) {
    header('Location: apply.php?error=Request Already Sent');
    exit();
}

//Sponsor Check
$sql = "SELECT Name FROM verified_sponsor WHERE Name = '$name'";
$rows = mysqli_query($conn, $sql);
if (mysqli_num_rows($rows) != 0) {
    header('Location: apply.php?error=Sponsor Already Exists');
    exit();
}

//Email Check
$tables = array('advisor', 'department', 'oca', 'registered_member', 'unverified_sponsor', 'verified_sponsor');
foreach($tables as $table){
    $sql = "SELECT Email FROM $table WHERE Email = '$email'";
    $rows = mysqli_query($conn, $sql);
    if (mysqli_num_rows($rows) != 0) {
        header('Location: apply.php?error=Email Already Exists');
        exit();
    }
}

//Contacts Check
$tables = array('advisor_contact', 'member_contact', 'oca_contact', 'sponsor_contact');
foreach($tables as $table){
    foreach($contacts as $contact){
        $sql = "SELECT Contact FROM $table WHERE Contact = '$contact'";
        $rows = mysqli_query($conn, $sql);
        if (mysqli_num_rows($rows) != 0) {
            header('Location: apply.php?error=Contact Already Exists');
            exit();
        }
    }
}

//Confirm Check
if ($password != $check) {
    header("Location: apply.php?error=Passwords Don't Match");
    exit();
}

//Insertion
$sql1 = "INSERT INTO unverified_sponsor Values('$name', '$agent', '$email', $password)";
$rows1 = mysqli_query($conn, $sql1);

foreach($contacts as $contact){
    $sql2 = "INSERT INTO tsponsor_contact Values('$name', '$contact')";
    $rows2 = mysqli_query($conn, $sql2);
}

$sql3 = "SELECT p.Panel_ID FROM moderate p, registered_member m WHERE p.Panel_ID = m.Member_ID";
$rows3 = mysqli_query($conn, $sql3);
while ($row = mysqli_fetch_assoc($rows3)) {
    $pid = $row['Panel_ID'];

    $sql4 = "INSERT INTO contact Values('$name', $pid)";
    $rows4 = mysqli_query($conn, $sql4);
}

header('Location: login.php?mssg=Request Successful');
exit();
?>
