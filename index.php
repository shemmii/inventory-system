<?php
require_once 'weekly_record.php'; 
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

//Table registered count
// $query_Total_customer = $pdo->prepare("SELECT count(*) as count from qrcodes");
// $query_Total_customer->execute();


?>

<!DOCTYPE html>   
<html>   

<html lang="en">
<?php
    $url1=$_SERVER['REQUEST_URI'];
    header("Refresh: 5; URL=$url1");
?>




<head>
  <title>Dashboard</title>
  <link rel="stylesheet" href="css/style.css">
  
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  
  
</head>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

var timeout = setInterval(reloadChat, 5000);    
function reloadChat () {

     $('#links').load('index.php');
}

reloadChat();
</script>


    <body>
  
   
    </div>
    </div>    

    <div class="main-content">
      <header>
        <h2>
          <label for="nav-toggle">
            <span class="fas fa-bars"></span>
          </label>
          Dashboard
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
        

  <center><div style="width:80%;height:auto;text-align:center">
            <h2 class="page-header" >Daily Sales Report </h2>
          

            <p style="align:center;"><canvas  id="chartjs_bar"></canvas></p>
        </div>    
    </body>
  <script src="js/jquery.js"></script>
  <script src="js/Chart.min.js"></script>
<script type="text/javascript">
      var ctx = document.getElementById("chartjs_bar").getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels:<?php echo json_encode($date); ?>,
                        datasets: [{
                            backgroundColor: [
                              
                               "#5969aa",
                                "#ff407b",
                                "#25d5f2",
                                "#ffc750",
                                "#FF0000",
                                "#7FFFD4",
                                "#A52A2A",
                                "#cd41d6",
                                "#e26754",
                                "#e25475",
                                "#88ac19",
                                "#40d6c6",
                                "#0e9de3",
                                "#d58136",
                                "#d5568b",
                                "#0c828c",
                                "#40cb96",
                                "#083b5d",
                                "#54bb99",
                                "#3883cc",
                                "#ff407b",
                                "#cb93d0",
                                "#4d4de0",
                                "#9f1451",
                                "#cf52d5",
                                "#cb3f15",
                                "#62e912",
                                "#b66916",
                                "#0b8893",
                                "#8d25d6",
                                "#FF0000"
                            ],
                            data:<?php echo json_encode($total_amount); ?>,
                        }]
                    },
                    options: {
                           legend: {
                        display: true,
                        position: 'bottom',
 
                        labels: {
                            fontColor: '#71748d',
                            fontFamily: 'Circular Std Book',
                            fontSize: 14,
                        }
                    },
 
 
                }
                });
    </script></center>
  

<?php
    $query_total_customer = $pdo->prepare( "SELECT * FROM recent  WHERE DATE(tx_date) = CURDATE();"); 
    $query_total_customer->execute();
    $count = $query_total_customer->rowCount();

  //pending count
    $temp_status1 = "Pending";
    $query_pending = $pdo->prepare( "SELECT * FROM recent WHERE r_status = '$temp_status1' AND DATE(tx_date) = CURDATE();"); 
    $query_pending->execute();
    $count_pending = $query_pending->rowCount();

    //total_amount
    $temp_status = "Delivered";
    $query_sum = $pdo->prepare("SELECT sum(r_amount) as total from recent WHERE r_status = 'Delivered' AND DATE(tx_date) = CURDATE();" );
    $query_sum->execute();
    $rows = $query_sum->fetch();
    $total = $rows['total'];

    //received count
    $temp_status = "Delivered";
    $query_total_received = $pdo->prepare( "SELECT * FROM recent WHERE r_status = '$temp_status' AND DATE(tx_date) = CURDATE(); "); 
    $query_total_received->execute();
    $count_received = $query_total_received->rowCount();

    //total volume count
    $temp_status = "Delivered";
    $query_total_volume = $pdo->prepare("SELECT sum(r_qrVolume) as total_volume from recent WHERE r_status = 'Delivered' AND DATE(tx_date) = CURDATE();" );
    
    $query_total_volume->execute();
    $rows = $query_total_volume->fetch();
    $total_volume = $rows['total_volume'];
  
  ?>

<br>
<!-- <h2 >Daily Report</h2> -->


        <div class="cards">
           <div class="card-single">
            <div>
              <h1><?php echo $count; ?>  </h1>
              <span>Total Customers</span>
            </div>
            <div>
              <span class="fas fa-users"></span>
            </div>
          </div>
          <div class="card-single">
            <div>
              <h1><?php echo $count_pending; ?></h1>
              <span>Pending</span>
            </div>
            <div>
              <span class="fas fa-clipboard-list"></span>
            </div>
          </div>
          <div class="card-single">
            <div>
              <h1><?php echo $count_received; ?></h1>
              <span>Delivered</span>
            </div>
            <div>
              <span class="fas fa-shopping-cart"></span>
            </div>
          </div>
          <div class="card-single">
            <div>
             
              <span>Total Amount</span>
              <h1 style="color: ;">P <?php echo $total; ?></php></h1>
            </div>
            <div>
              <span class="fas fa-wallet"></span>
            </div>
          </div>

          <div class="card-single">
            <div>
             
              <span>Water Consumed</span>
              <h1> <?php echo $total_volume; ?> ml</php></h1>
            </div>
            <div>
              <span class="fas fa-water" style='font-size:48px;color:black'></span>
            </div>
          </div>

        </div>




<?php


//check QR

$stat = 0;

 $query = $pdo->prepare("SELECT qr FROM scan_qr WHERE sstatus = '$stat'");
 $query->execute();

$qr= array();
while ($rows = $query->fetch()){
    $qr[] = $rows['qr'];


?>


<?php

//  if (!empty($qr)) {
  
//if true, insert in recent table
$arraydata = implode(',',$qr);
$query = $pdo->prepare ("INSERT INTO recent (r_qrUname, container_volume, r_qrVolume, r_amount, r_status) 
SELECT qrUname, container_volume, qrVolume, amount, status FROM qrcodes WHERE qrUname in ('$arraydata')  ");
 
$query->execute();
 }



?>

<form action="status.php" method="POST">

        <div class="recent-grid">
          <div class="projects">
            <div class="card">
              <div class="card-header">
                <h2>Recent Customers</h2>

                <input type='submit' name='submit' class="del" value='Delivered'/>

                <!-- <button type="submit" name="save_multiple_checkbox" class="button3">Delivered</button> -->
                
                
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table width="100%">
                  <thead>
                    <tr>
                      <td></td>
                   
          
                      <td>Volume </td>
                      <td>Amount</td>
                      <td>Status</td>
                      <td>Action</td>

                                                             
            </td>
        </tr>
        </tr>
                  </thead>

<?php

$query = $pdo->prepare("SELECT * FROM recent WHERE r_status = 'pending' ORDER BY id DESC");
$query->execute(); 



while ($rows = $query->fetch()){
    $qrUname = $rows['r_qrUname'];
    $qrVolume = $rows['container_volume'];
    $amount = $rows['r_amount'];
    $status = $rows['r_status'];
   
    $id = $rows['id'];

?>

<tr>
  <!-- <td><input type="checkbox" class="check" /><br /> -->
  
<td><?php echo "<input type='checkbox'  name='qr_id[]' value='".$id."'>"; ?></td>
</td>


<td><?php echo  $qrVolume;?> &nbsp; <br></td>


<td>Php &nbsp; <?php echo  $amount;?><br></td>

<td><p>&nbsp; <?php echo  $status;?></p> <br></td>



</form>

<td class="" >


    <!-- <a class="button1" href="edit.php?id=<?php echo $id;?> "><i class=""></i> Edit</button> </a> &nbsp;&nbsp;&nbsp; -->
    <a class=" button2" href="delete.php?id=<?php echo $id;?> ">Delete</button> </a> 
    
</td>


<!-- <td><button  class="button" onclick="myFunction()">Delivered</button></td> -->


<?php

}

$query = $pdo->prepare("UPDATE scan_qr SET sstatus ='1'");
$query->execute();
?>
               



    </body>
</html>
