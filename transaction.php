<?php

include_once("connection.php");
include_once("session.php");
include("dashboard.php");

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
  <title>Transaction</title>
  <link rel="stylesheet" href="css/transaction.css">
  
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  
 
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
          History
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
     
        <!-- <div class="cards">
          <div class="card-single">
            <div>
              <h1>50</h1>
              <span>Customers</span>
            </div>
            <div>
              <span class="fas fa-users"></span>
            </div>
          </div>
          <div class="card-single">
            <div>
              <h1>25</h1>
              <span>Pending</span>
            </div>
            <div>
              <span class="fas fa-clipboard-list"></span>
            </div>
          </div>
          <div class="card-single">
            <div>
              <h1>25</h1>
              <span>Received</span>
            </div>
            <div>
              <span class="fas fa-shopping-cart"></span>
            </div>
          </div>
          <div class="card-single">
            <div>
              <h1>Php20K</h1>
              <span>Total</span>
            </div>
            <div>
              <span class="fas fa-wallet"></span>
            </div>
          </div>

        </div> -->

        <div class="recent-grid">
          <div class="projects">
            <div class="card">
              <div class="card-header">
                <h2>Transaction History</h2>
                
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  
    
 <table>
  <tr>
    <th>Container Name</th>
    <th>Volume</th>
    <th>Amount</th>
    <th>Status</th>
    <th>Date</th>
  </tr>
  <?php
$temp_status = "Delivered";
$query = $pdo->prepare("SELECT r_qrUname, container_volume, r_amount, r_status, cast(tx_date AS date ) AS tx_date FROM recent WHERE r_status = 'Delivered' ORDER BY id DESC");
$query->execute();

while($rows = $query->fetch()){
  $qrUname = $rows['r_qrUname'];
  $qrContent = $rows['container_volume'];
  $amount = $rows['r_amount'];
  $status = $rows['r_status'];
  $tx_date = $rows['tx_date'];

  

?>

<tr>
<td><?php echo   $qrUname;?><br></td>

<td><?php echo  $qrContent;?><br></td>

<td><?php echo  $amount;?><br></td>

<td> &nbsp; <?php echo  $status;?><br></td>
<td><?php echo date('M d, Y',strtotime($tx_date)) ;?></td>





</tr>

<?php

}
  ?>

</table>
        

    </body>
</html>
