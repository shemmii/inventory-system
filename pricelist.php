<?php
include_once("connection.php");
include_once("session.php");



if(isset($_POST['submit'])){

    $volume = $_POST['volume'];
    $value = $_POST['value'];
    $container_price = $_POST['container_price'];



$query_pricelist = $pdo->prepare("INSERT INTO price_list (volume, value, container_price) VALUES (:volume, :value, :container_price)");
$query_pricelist->bindparam(':volume', $volume);
$query_pricelist->bindparam(':value', $value);
$query_pricelist->bindparam(':container_price', $container_price);

$query_pricelist->execute();

echo "<script>alert('Successfully Inserted!')</script>";
echo "<script>window.open('price.php','_self')</script>";
}

?>