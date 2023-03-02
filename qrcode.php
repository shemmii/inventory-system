
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

// //SESSION QUERY GET LOGIN DETAILES DISPLAY TO PROFILE
// $id = $_SESSION['login_id'];

// $query_admin = $pdo->prepare("SELECT * FROM login a INNER JOIN  admin b 
// ON a.admin_id = b.admin_id WHERE a.login_id = '$id'");

// $query_admin->execute();

// // GET CUSTOMER USERNAME AND DISPLAY TO PROFILE
// $query_admin_username = $pdo->prepare("SELECT * FROM login a INNER JOIN  admin b 
// ON a.admin_id = b.admin_id WHERE a.login_id = '$id'");

// $query_admin_username->execute();


// $row = $query_admin_username->fetch();  
// $username = $row['username'];

?>
<!DOCTYPE html>   
<html>   
<html lang="en">

<head>
  <link rel="stylesheet" href="css/qrcode.css">
  
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  
 
</head>
   

 
      </header>
      <body>
        
      </div>
    </div>    

    <div class="main-content">
      <header>
        <h2>
          <label for="nav-toggle">
            <span class="fas fa-bars"></span>
          </label>
          QR codes
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
$query = $pdo->prepare("SELECT * FROM qrcodes ORDER BY qr_id DESC");
$query->execute();


while($rows = $query->fetch()){

   
    $qrImg = $rows['qrImg'];
    $qrUname = $rows['qrUname'];

   

?>




    <div class="item">
    <img src ="userQr/<?php echo $qrImg;?>">
    <span class="caption"><?php echo $qrUname;?></span>
</div>
   

   
    
    </table>



    
     <?php
}
?>
 </main>
    </body>
</html>