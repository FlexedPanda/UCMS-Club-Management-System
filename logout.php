<?php
session_start(); 
include('dbconnect.php');

session_unset(); 
session_destroy(); 
header("Location: index.php"); 
exit();
?> 