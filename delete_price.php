<?php

include_once("connection.php");


$id = $_GET['id'];

$query = $pdo->prepare("DELETE FROM price_list where price_id ='$id'");
$query->execute();

echo "<script>alert('Successfully Deleted!')</script>";
echo "<script>window.open('price.php','_self')</script>";

?>