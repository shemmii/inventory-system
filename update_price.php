
<?php

include_once("connection.php");
include_once("session.php");




//updating
if(isset($_POST['edit'])){
  $volume = $_POST['volume']; 
  $value = $_POST['value'];
  $container_price = $_POST['container_price'];
  $id = $_POST['id'];

 


$query = $pdo->prepare("UPDATE price_list SET volume = :volume, value = :value, container_price = :container_price WHERE price_id = '$id'");
$query->bindparam(':volume', $volume);
$query->bindparam(':value', $value);
$query->bindparam(':container_price', $container_price);


$query->execute();



echo "<script>alert('Successfully Updated!')</script>";
echo "<script>window.open('price.php','_self')</script>";
}

?>