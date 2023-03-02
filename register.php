<?php

session_start();
include_once("connection.php");
//include_once("session.php");


if(isset($_POST['submit'])){
$fullname = $_POST['fullname'];
$email = $_POST['email'];
$username = $_POST['username'];
$password_1 = sha1($_POST['password_1']);
$password_2 = sha1($_POST['password_2']);

$query = $pdo->prepare("SELECT * FROM admin WHERE email = ?");
	 $query->execute([$email]);
	 $result = $query->rowCount();
	 
	 if ($result > 0)
	 {
		echo "<script>alert('Email address is already existed  ')</script>";
		echo "<script>window.open('register.php','_self')</script>";
	}

	 
	 else
	 {
		 $query = $pdo->prepare("SELECT * FROM admin WHERE username = ?");
		 $query->execute([$username]);
	     $result = $query->rowCount();
   }
		 if ($result > 0)
		{
			echo "<script>alert('Username is already existed  ')</script>";
			echo "<script>window.open('register.php','_self')</script>";
		}
	 
		
    
     else


  if ($password_1 == $password_2)
  {
    
    $user_type = "customer";
     $query_admin = $pdo->prepare("INSERT INTO admin (fullname, username, email) VALUES (:fullname, :username, :email)");
    $query_admin->bindparam(':fullname', $fullname);
    $query_admin->bindparam(':email', $email);
    $query_admin->bindparam(':username', $username);
   
    
    $query_admin->execute();
    $admin_id = $pdo->lastInsertId();

    


    $query_login = $pdo->prepare("INSERT INTO login (admin_id, username, password) VALUES (:admin_id, :username,:password )");
    $query_login->bindparam(':admin_id', $admin_id);
    $query_login->bindparam(':username', $username);
    $query_login->bindparam(':password', $password_2);
    
   
    $query_login->execute();

   
    
        echo "<script>alert('Your Registration has been Successfully Completed!')</script>";
        echo "<script>window.open('login.php','_self')</script>";

    } else
          {
        
            echo "<script>alert('Password does not match')</script>";
          }
        }
  
      
  

?>


<!DOCTYPE html>   
<html>   
<html lang="en">

<head>
  <link rel="stylesheet" href="css/register.css">
  <title style="color: brown">SIGN UP</title>
 
  <meta descryption content="Presentation of website">
  <meta name="keywords" content="technology, cyber security, software">
  <meta http-equiv="refresh" content="30">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <link rel="stylesheet" href="login7.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
  <div class="container">
 
    <div class="header">Register</div>
    <form action="register.php" method="POST">
      <div class="fields">

      <div class="field input-field">
          <i class="fas fa-user"></i>
          <input type="text" name="fullname" placeholder="Full name" required>
        </div>


      <div class="field input-field">
          <i class="fas fa-user-circle"></i>
          <input type="text" name="username" placeholder="username" required>
        </div>


        <div class="field input-field">
          <i class="fas fa-envelope"></i>
          <input type="email" name="email" placeholder="Email" required>
        </div>

        <div class="field input-field">
          <i class="fas fa-lock"></i>
          <input type="password" name="password_1" placeholder="Create Password" required>
        </div>

        <div class="field input-field">
          <i class="fas fa-lock"></i>
          <input type="password" name="password_2" placeholder="Confirm Password" required>
        </div>

      

        <div class="field button-field">
          <button type="submit" name="submit">Sign up</button>
        </div>
        <div class="sign-up form-link">
          <span>Already have an account?</span>
          <a href="login.php" class="signup-link">Log in</a>
        </div>
      </div>
    </form>
  </div>
</body>

</html>