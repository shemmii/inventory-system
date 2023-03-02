
<?php

include_once("connection.php");
include_once("session.php");


$query_amount = $pdo->prepare("SELECT amount_ml FROM price_list  " );
    
$query_amount->execute();
$rows1 = $query_amount->fetch();



$amount1 = $rows1['amount_ml'];


//updating
if(isset($_POST['edit'])){
  $qrUname = $_POST['qrUname'];
  $qrContent = $_POST['qrContent'];
  $amount = $_POST['amount'];
  $id = $_POST['id'];
  $amount_ml = round($amount1 * $qrContent) ;


$query = $pdo->prepare("UPDATE qrcodes SET qrUname = :qrUname, qrVolume = :qrVolume, amount = :amount WHERE qr_id = '$id'");
$query->bindparam(':qrUname', $qrUname);
$query->bindparam(':qrVolume', $qrContent);
$query->bindparam(':amount', $amount_ml);
$query->execute();



//echo "<script>alert('Successfully Updated!')</script>";
//echo "<script>window.open('index.php','_self')</script>";
}

?>