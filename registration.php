<?php

include_once("connection.php");
include_once("session.php");
include("dashboard.php");

$login_id = $_SESSION['login_id'];


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

<title>Registration</title>
  <link rel="stylesheet" href="css/registration.css">
  
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  
  <style>
  

</style>
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
          Registration
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

  include "meRaviQr/qrlib.php";
  include "config.php";

  $query_amount = $pdo->prepare("SELECT * FROM price_list  " );
  $query_amount->execute();
  $rows1 = $query_amount->fetch();
  $amount = $rows1['container_price'];

  $s = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyz", 3)), 0, 3);
  $text = '-GYEANG';

  if(isset($_POST['create']))
{  

    $qc =  $_POST['qrContent'];
    // $container_volume = $_POST['container_volume'];
    $qrUname = $_POST['qrUname'];
    $amount1 = $_POST['amount'];
    
   
    $qrImgName = rand();
   
    //$final = $qc;

    $get_con_volume = $pdo->prepare("SELECT * FROM price_list WHERE price_id = :price_id " );
    $get_con_volume->bindparam(':price_id', $qc);
    


    $get_con_volume->execute();
    $rows2 = $get_con_volume->fetch();
    $container_volume = $rows2['volume'];
    $container_value = $rows2['value'];
    $container_price = $rows2['container_price'];
    // $total_amount = round($container_price * $container_value) ;
  
   $qrs = QRcode::png(strtoupper($qrUname)."".$container_value,"userQr/$qrImgName.png","H","3","3" );
   
  
    $qrimage = $qrImgName.".png";
    
    $workDir = $_SERVER['HTTP_HOST'];
    $qrlink = $workDir."/qrcode".$qrImgName.".png";
    $insQr = $meravi->insertQr($login_id,$qrUname,$container_volume,$container_value,$container_price,$qrimage,$qrlink);
    if($insQr==true)
    {
     echo "<script>alert(' You Success Create Your QR Code'); window.location='registration.php?success=$qrimage';</script>"; 
     
 
    }
    else
    {
      echo "<script>alert('cant create QR Code');</script>";
    }
  }
 
  
  ?>
 
  <?php 
  if(isset($_GET['success']))
  {
  ?>
  <div id="qrSucc">
  <div class="modal-content animate container">
    <?php 
    ?>
 <div></div>

 <div id="print-content">
    <img src="userQr/<?php echo $_GET['success']; ?>" alt="">
   
    <?php 
$workDir = $_SERVER['HTTP_HOST'];


    $qrlink = $workDir."/qrcode/userQr/".$_GET['success'];
    ?>   </div>
<!--      
    <input type="text" value="<?php echo $qrlink; ?>" readonly> -->
    <br><br>
   
<a href="download.php?download=<?php echo $_GET['success']; ?>">Download Now</a>


<!-- 
<input type="button"  class="btn btn-primary" onclick="printDiv('print-content')" value ="PRINT"/> -->


<br>
 <br><br>
    <a href="registration.php">Go Back To Generate Again</a>
   
    
  <?php
}
else
{
  





// $s = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyz", 3)), 0, 3);
// $text = '-GYEANG';

?>

<div id="id01" class="modal1">


  <form class="modal-content animate" method="post" enctype="multipart/form-data">

    <div class="container">
      <h2 align="center">Register your container</h2>
      <label for="uname"><b>Random ID</b></label>
      <input type="hidden" name="login_id" value="<?php echo $login_id; ?>">
      <input type="text" name="qrUname" required value="<?php echo strtoupper($s)."".$text;?>" > 
      <br>

      <label for='txt'><b> Volume of water</b></label><br>
       <!-- <input type="text" id="in1"  name="text"   value="<?php echo $text;?> "  > 
       <input type="hidden" id="in1"  name="text"   value="GYEANG " disabled >
      <input type="number" id="in"  name="qrContent" required   value="<?php if(isset($_POST['create'])){ echo $_POST['qrContent']; } ?>" require>  -->


      <?php
      $query_reg = $pdo->prepare("select * from price_list");
      $query_reg->execute();

        ?>
        
        <select name="qrContent">

    <?php    while($rows = $query_reg->fetch()){ 
      
      $price_id = $rows['price_id'];
      $volume = $rows['volume'];

      
      ?>
      
       
          <option value="<?php echo $price_id;?>"> <?php echo  $volume; ?></option>

    <?php
    }
    ?> 
    
   </select>



      <br>
</label>
        
      <!-- <label for="psw"><b> Amount</b></label> -->
      <input type="hidden"  min="30" name="amount" required value= "<?php echo $total_amount;?>" >
     <!-- <input type="number" min="1" name="quantity" value="<?php if(isset($_POST['create'])){ echo $_POST['quantity']; } ?>"require>    -->
      
      <input type="submit" value="Generate QR Code" name="create">


     
    
    </div>
  </form>
    <?php 
}
   ?>
</div>


    
    
    
    </main>
    
    </body>
</html>

<script type="text/javascript">

  function printDiv(divname){
    var printContents=document.getElementById(divname).innerHTML;
    w=window.open();
    w.document.write(printContents);
    w.print();
    w.close();

  }




</script>