

<?php
include_once("connection.php");
include_once("session.php");





$qr_id = $_GET['id'];
//selecting
$query = $pdo->prepare("SELECT * FROM qrcodes WHERE qr_id = '$qr_id' ");
$query->execute();

while($rows = $query->fetch()){
  $qrUname = $rows['qrUname'];
  $qrContent = $rows['container_volume'];
  $amount1 = $rows['amount'];

 
  
} 

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
  <link rel="stylesheet" href="css/edit.css">
  
 
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
               <h3> <span class="	fa fa-fax"></span>
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
            
            

        </div>
    </div>    

    

    <div class="main-content">
      <header>
        <h2>
          <label for="nav-toggle">
            <span class="fas fa-bars"></span>
          </label>
          Edit
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

   
     
    

        <div class="recent-grid">
          <div class="projects">
            <div class="card">
              <div class="card-header">
                <h2>Recent Customers</h2>
                
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table width="100%">
                  <thead>
                    <tr>
                    <!-- <td>Container Name</td> -->
                      <td>Volume</td>
                      <!-- <td>Amount</td> -->
                     
                      
                      
                      

                    </tr>
                  </thead>

<form action="update.php" method="POST">

<tr>
 <input type="hidden" name="id" value="<?php echo $qr_id;?>">
<!-- <td><input class="input" type="text" name="qrUname" value="<?php echo   $qrUname;?> "  /><br></td> -->

<td><input class="input" type="text" name="qrContent" value="<?php echo   $qrContent;?> " /><br></td>

<!-- <td><input class="input" type="hidden" name="amount" value="<?php echo   $amount;?> " /><br></td> -->


<input type="submit" name="edit" class="button button_shape"  value="UPDATE ">

                  <tbody>
                    <tr>
                      <td></td>
                      <td></td>
                      <td>
                     <br><br><br><br>
    
    
     
        </div>  

      </main>
    </div>

    </form>
    
    </body>
</html>
