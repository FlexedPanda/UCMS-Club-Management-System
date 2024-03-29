<?php
include('dbconnect.php');
session_start();

// include('session.php');
$sql2 = "SELECT Contact FROM member_contact WHERE Member_ID = 1036";
$rows2 = mysqli_query($conn, $sql2);

$temp = array();
while ($row = mysqli_fetch_assoc($rows2)) {
    array_push($temp, $row["Contact"]);
}
$contacts = implode(", ", $temp);
echo $contacts;
