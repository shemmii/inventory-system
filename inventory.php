
<?php
include_once("connection.php");
include_once("session.php");
include_once 'weekly_record_inv.php'; 
include("dashboard.php");
//include_once("generate_excel.php");



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

?>
<!DOCTYPE html>   
<html>   
<html lang="en">

<head>
  <title>Inventory</title>
  <link rel="stylesheet" href="css/inventory.css">
  
 
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css" /> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
  
</head>
    <body>
        
    </div>
    </div>    

    <div class="main-content">
      <header>
        <h2>
          <label for="nav-toggle">
            <span class="fas fa-bars"></span>
          </label>
          Inventory
        </h2>

        <div class="search-wrapper">
          <span class="fas fa-search"> </span>
          <input type="search" placeholder="Search..." />

        </div>

        <div class="user-wrapper">
        
        <div class="user-wrapper">

        

<div class="dropdown">

<h4 class="dropbtn"><i class="fas fa-user-circle"></i>&nbsp;<?php echo $username;?> </h4>

<div class="dropdown-content"> 

<a href="#">  <span class="	fa fa-user">&nbsp; Profile</a>
<a href="login.php"> <span class="	fa fa-sign-out "> &nbsp;Logout</a>

</div>
</div>

            
         </div>
        </div>
      </header>
  
 


     <main>
 
<?php


$query_total_customer = $pdo->prepare( "SELECT * FROM qrcodes"); 
$query_total_customer->execute();
$count = $query_total_customer->rowCount();

//pending count
$temp_status1 = "Pending";
$query_pending = $pdo->prepare( "SELECT * FROM qrcodes WHERE status = '$temp_status1'"); 
$query_pending->execute();
$count_pending = $query_pending->rowCount();

//total_amount
$temp_status = "Delivered";
$query_sum = $pdo->prepare("SELECT sum(amount) as total from qrcodes WHERE status = 'Delivered' AND DATE(tx_date) = CURDATE();" );
$query_sum->execute();
$rows = $query_sum->fetch();
$total = $rows['total'];

//received count
$temp_status = "Delivered";
$query_total_received = $pdo->prepare( "SELECT * FROM qrcodes WHERE status = '$temp_status' "); 
$query_total_received->execute();
$count_received = $query_total_received->rowCount();


$query = $pdo->prepare("SELECT cast(tx_date as date) , sum(amount) as amount from qrcodes WHERE status = 'Delivered' AND YEAR(tx_date) = YEAR(NOW()) AND MONTH(tx_date)=MONTH(NOW())  group by cast(tx_date as date)");
$query->execute();

 //total volume count
 $temp_status = "Delivered";
 $query_total_volume = $pdo->prepare( "SELECT sum(qrVolume) as total_volume from qrcodes WHERE status = 'Delivered' AND DATE(tx_date) = CURDATE(); "); 
 $query_total_volume->execute();
 $rows = $query_total_volume->fetch();
 $total_volume = $rows['total_volume'];

?>




                              
                  

<div class="container">	
	
	<div class="well-sm col-sm-12">
		<div class="btn-group pull-right">	
			<form action="generate_excel.php" method="post">					
				<button type="submit" id="export_data" name='export_data' value="Export to excel" class="btn btn-info">Export to excel</button>
			</form>
  
      <h2 >Total Daily Sales Report </h2>
<br>

      <table>
  <tr>
    <th>Date</th>
    <th>Containers Filled</th>
    <th>Total Amount</th>
    <th>Consumed Water(ml)</th>
  </tr>

<?php
$query = $pdo->prepare("SELECT * FROM daily_amount  " );
$query->execute();

while($rows = $query->fetch()){

  $tx_date  = $rows['tx_date']  ;
  $total = $rows['containers_filled'];
  $total_amount = $rows['total_amount'];
  $total_volume = $rows['total_volume'];

  

?>

<tr>


<td><?php echo date('M d, Y',strtotime($tx_date));?><br></td>
<td><?php echo   $total;?></td>

<td><?php echo  $total_amount;?> &nbsp; <br></td>
<td><?php echo  $total_volume;?></td>

<?php

}
  ?>

</table>

<?php
    $temp_status = "Delivered";
    $query_sum = $pdo->prepare("SELECT sum(total_amount) as total from daily_amount " );
    $query_sum->execute();
    $rows = $query_sum->fetch();
    $total = $rows['total'];
 ?>    

 <br>
<h2> <td class="total" >Total  Sales: <?php echo $total;?></td></h2>




        </main>
        
    </body>
</html>
