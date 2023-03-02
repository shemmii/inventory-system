<?php
include_once("connection.php");



if(isset($_POST['qr_id'])){
  
foreach($_POST['qr_id'] as $value){

    $qr_id1 = $value;
   
    $query = $pdo->prepare("UPDATE recent SET r_status = 'Delivered'  WHERE id = '$qr_id1'");
    // $query->bindparam(':status', $status);
  
    $query->execute();
    //  echo "Status for .$qr_id1. has been updated.<br>";

    header('location:index.php');
    
}

}else{
    echo "<script>alert(' Please select checkbox! '); window.location='index.php';</script>"; 
}
?>
 