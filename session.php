<?php
session_start();
include('dbconnect.php');

if ($_SESSION["view"] == "Member" || $_SESSION["view"] == "Panel"){
    $sql1 = "SELECT * FROM registered_member WHERE Email = '".$_SESSION["email"]."'";
    $rows1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_assoc($rows1)) {
        $_SESSION["id"] = $row["Member_ID"];
        $_SESSION["name"] = $row["Name"];
        $_SESSION["gender"] = $row["Gender"];
        $_SESSION["dob"] = $row["Birth_Date"];
        $_SESSION["dept"] = $row["Department"];
        $_SESSION["admit"] = $row["Admitted"];
        $_SESSION["credit"] = $row["Credits"];
        $_SESSION["club"] = $row["Club"];
        $_SESSION["joined"] = $row["Joined_Date"];
        $_SESSION["desig"] = $row["Designation"];
        $_SESSION["email"] = $row["Email"];
        $_SESSION["password"] = $row["Password"];
    }

    $sql2 = "SELECT Contact FROM member_contact WHERE Member_ID = ".$_SESSION["id"]."";
    $rows2 = mysqli_query($conn, $sql2);

    $temp = array();
    while ($row = mysqli_fetch_assoc($rows2)) {
        array_push($temp, $row["Contact"]);
    }
    $contacts = implode(", ", $temp);
    $_SESSION["contacts"] = $contacts;

}

else if ($_SESSION["view"] == "Advisor"){
    $sql1 = "SELECT * FROM advisor WHERE Email = '".$_SESSION["email"]."'";
    $rows1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_assoc($rows1)) {
        $_SESSION["id"] = $row["Advisor_ID"];
        $_SESSION["name"] = $row["Name"];
        $_SESSION["desig"] = $row["Designation"];
        $_SESSION["email"] = $row["Email"];
        $_SESSION["password"] = $row["Password"];
    }

    $sql2 = "SELECT Contact FROM advisor_contact WHERE Advisor_ID = ".$_SESSION["id"]."";
    $rows2 = mysqli_query($conn, $sql2);

    $temp = array();
    while ($row = mysqli_fetch_assoc($rows2)) {
        array_push($temp, $row["Contact"]);
    }
    $contacts = implode(", ", $temp);
    $_SESSION["contacts"] = $contacts;

    $sql3 = "SELECT * FROM club WHERE Advisor_ID = ".$_SESSION["id"]."";
    $rows3 = mysqli_query($conn, $sql3);
    $row = mysqli_fetch_assoc($rows3);
    $_SESSION["club"] = $row["Name"];
}

else if ($_SESSION["view"] == "Oca"){
    $sql1 = "SELECT * FROM oca WHERE Email = '".$_SESSION["email"]."'";
    $rows1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_assoc($rows1)) {
        $_SESSION["id"] = $row["OCA_ID"];
        $_SESSION["name"] = $row["Name"];
        $_SESSION["desig"] = $row["Designation"];
        $_SESSION["balance"] = $row["Fund_Balance"];
        $_SESSION["email"] = $row["Email"];
        $_SESSION["password"] = $row["Password"];
    }

    $sql2 = "SELECT Contact FROM oca_contact WHERE OCA_ID = ".$_SESSION["id"]."";
    $rows2 = mysqli_query($conn, $sql2);

    $temp = array();
    while ($row = mysqli_fetch_assoc($rows2)) {
        array_push($temp, $row["Contact"]);
    }
    $contacts = implode(", ", $temp);
    $_SESSION["contacts"] = $contacts;

}

else if($_SESSION["view"] == 'Sponsor'){
    $sql1 = "SELECT * FROM verified_sponsor WHERE Email = '".$_SESSION["email"]."'";
    $rows1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_assoc($rows1)) {
        $_SESSION["name"] = $row["Name"];
        $_SESSION["agent"] = $row["Agent"];
        $_SESSION["desig"] = $row["Designation"];
        $_SESSION["balance"] = $row["Fund_Provided"];
        $_SESSION["email"] = $row["Email"];
        $_SESSION["password"] = $row["Password"];
    }

    $sql2 = "SELECT Contact FROM sponsor_contact WHERE Sponsor = '".$_SESSION["name"]."'";
    $rows2 = mysqli_query($conn, $sql2);

    $temp = array();
    while ($row = mysqli_fetch_assoc($rows2)) {
        array_push($temp, $row["Contact"]);
    }
    $contacts = implode(", ", $temp);
    $_SESSION["contacts"] = $contacts;

}

else if($_SESSION["view"] == 'Department'){
    $sql1 = "SELECT * FROM department WHERE Email = '".$_SESSION["email"]."'";
    $rows1 = mysqli_query($conn, $sql1);

    while ($row = mysqli_fetch_assoc($rows1)) {
        $_SESSION["name"] = $row["Name"];
        $_SESSION["head"] = $row["Head"];
        $_SESSION["desig"] = $row["Designation"];
        $_SESSION["email"] = $row["Email"];
        $_SESSION["password"] = $row["Password"];
        $_SESSION["estb"] = $row["Established"];
    }
}
?>