
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
  <title>Price List</title>

  <link rel="stylesheet" href="css/price.css">
  
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
          Price List
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
<form action="pricelist.php" method="POST">
<center>
<div class="con">
<h3>Add Container</h3>
<label for="" class="vol">Volume:</label>
<input type="text" id="in"  name="volume" required  > 
<br>
<label for="" class="vol">Value:</label>
<input type="text" id="in"  name="value" required >
<br>
<label for="" class="vol">Amount:</label> 
<input type="text" id="in"  name="container_price" required >

<br><br>


<input type='submit' name='submit'  value='submit'/></center>


</form> 




<table style="width:100%">
  <thead>
    <tr>
      <th>Type of Container</th>
      <th>Price</th>
      <th>Action</th>
    
    </tr>
  </thead>
<?php
  $temp_status = "Pending";
$query = $pdo->prepare("SELECT * FROM price_list  " );
$query->execute();



while($rows = $query->fetch()){


  $volume = $rows['volume']; 
  $value = $rows['value']; 
  $container_price = $rows['container_price']; 
  $id = $rows['price_id'];


  ?>
  <tbody>
    <tr>
      <td data-column="First Name"><?php echo $volume;?></td>
      <td data-column="Last Name"><?php echo $container_price;?></td>

   
     <td>
     <a class="button2" href="edit_price.php?id=<?php echo $id;?> "><i class=""></i> Edit</button> </a> &nbsp;&nbsp;&nbsp;
     <a class=" button2" href="delete_price.php?id=<?php echo $id;?> ">Delete</button> </a> 
     </td>

</tr>
  
    <?php
}

?>


  </tbody>
</table>