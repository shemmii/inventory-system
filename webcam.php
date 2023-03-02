<?php
require_once 'webcon.php'; 
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

<html>
	<head>
	<link rel="stylesheet" href="css/price.css">
  
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"> </script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"> </script>
		<script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"> </script>
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	
	
		
	</head>

	<body>
  
   </header>
   </div>
    </div>    

    <div class="main-content">
      <header>
        <h2>
          <label for="nav-toggle">
            <span class="fas fa-bars"></span>
          </label>
          Status
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
	
	<!-- <body style=" background-color:#ececee; position:center"> -->
	<br> <br><br> <br><br>
	<div class="" >
			<div class="row">
				<div class="">
				<center>	<video id="preview" width="50%"> </video>
				</div></center>
				<br><br>
				<div class="">
				<br>
					<form action="webcon.php" method="post" class="">
					<center>	<label> SCAN QR CODE </label>
			<input type="text" name="text" id="text" readonly="" placeholder="scan qr code here" class="form-control" style="width:50%; border:none;padding: 12px 20px;border: 1px solid #ccc;"></center>
					</form>
					
				</div>
			</div>
		</div>
	<br>
	<center>
		<script>
		let scanner = new Instascan.Scanner({video:document.getElementById('preview')});
		Instascan.Camera.getCameras().then(function(cameras){
			if (cameras.length > 0){
				scanner.start(cameras[0]);
				
			} else{
				alert('No cameras found!');
			}
		}).catch(function(e){
			console.error(e);
		});
		
		scanner.addListener('scan', function(c){
			document.getElementById('text').value=c;
			document.forms[0].submit();
		});
		</script></center>	
	</body>
</html>
		