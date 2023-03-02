<?php
require_once 'weekly_record.php'; 
include_once("connection.php");
include_once("session.php");

//SESSION QUERY GET LOGIN DETAILES DISPLAY TO PROFILE
$id = $_SESSION['login_id'];

$query_admin = $pdo->prepare("SELECT * FROM login a INNER JOIN  admin b 
ON a.admin_id = b.admin_id WHERE a.login_id = '$id'");

$query_admin->execute();

// GET CUSTOMER USERNAME AND DISPLAY TO PROFILE
$query_admin_username = $pdo->prepare("SELECT * FROM login a INNER JOIN  admin b 
ON a.admin_id = b.admin_id WHERE a.login_id = '$id'");

$query_admin_username->execute();

$row = $query_admin_username->fetch();  
$username = $row['username'];

//Table registered count
// $query_Total_customer = $pdo->prepare("SELECT count(*) as count from qrcodes");
// $query_Total_customer->execute();


?>

<!DOCTYPE html>   
<html>   
<html lang="en">

<head>
  <title>GYEAN GATS</title>
  <link rel="stylesheet" href="css/dashboard.css">
  
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  
  
</head>
    <body>
  
   
     <input type="checkbox" id="nav-toggle"> 
    
    <div class="sidebar"> 
        <div class="sidebar-brand"> 
          <h1> <span class="fab fa-"> </span> <span>Water Refilling Station</span>
          </h1>
        </div>
        <br> <br> <br> <br> <br>
        
        <div class="sidebar-menu">
        
          <ul>
            <li>
              <a href="index.php" class=""> 
              <h3>  <span class="fas fa-tachometer-alt"></span>
                
                <span>Dashboard</span> </h3>
              </a>
            </li>
            
            <li>
              <a href="registration.php">
              <h3>  <span class="fas fa-users" ></span>
                <span>Registration</span> </h3>
              </a>
            </li>
            <li>
              <a href="transaction.php">
              <h3>  <span class="	fa fa-credit-card"></span>
              <span>Transaction</span> </h3>
              </a>
            </li>
            <li>
              <a href="inventory.php">
               <h3> <span class="	fa fa-fax"></span>
                <span>Inventory</span> </h3>
              </a>
            </li>
            <li>
              <a href="qrcode.php">
               <h3> <span class="	fa fa-qrcode" style="font-size:24px"></span>
                <span>QR Codes</span> </h3>
              </a>
            </li>
            <li>
              <a href="price.php">
               <h3> <span class="	fa fa-money" ><i style="font-size:24px" class="fa">&#xf0d6;</i></span>
                <span>Price</span> </h3>
              </a>
            </li>
            <li>
              <a href="webcam.php">
               <h3> <span class="	fa fa-check-circle" ></span>
                <span>Status</span> </h3>
              </a>
            </li>
            
            

     
  
      </body>
</html>
