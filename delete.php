<?php

include_once("connection.php");


$id = $_GET['id'];

$query = $pdo->prepare("DELETE FROM recent where id ='$id'");
$query->execute();

echo "<script>alert('Successfully Deleted!')</script>";
echo "<script>window.open('index.php','_self')</script>";

?>