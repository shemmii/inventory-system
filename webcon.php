<?php
include_once("connection.php");
	

	
	if(isset($_POST['text'])){
		$text = $_POST['text'];
		

		$query = $pdo->prepare("UPDATE recent SET r_status ='delivered' WHERE r_qrUname = '$text' ");
        $query->execute();

		echo "<script>alert('Status Updated!')</script>";
		echo "<script>window.open('index.php','_self')</script>";
	}
	
			?>


