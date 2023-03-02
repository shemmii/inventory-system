<?php
session_start();
include_once("connection.php");


if(isset($_POST['login'])){

    $username = $_POST['username'];
    $password = sha1($_POST['password']);
    
    

    $query = $pdo->prepare("SELECT * FROM login WHERE username =:username AND password = :password");
    $query->bindParam(':username', $username);
    $query->bindParam(':password', $password);
    $query->execute();

    $count = $query->rowCount();

    if($count > 0){

        while($rows = $query->fetch()){
            $id = $rows['login_id'];
            $_SESSION['id'] = $id;
            $_SESSION['login_id'] = $id;
            header("location:index.php");

        }
         
    }else {
        echo "<script>alert('Sorry wrong username or password!')</script>";
       echo "<script>window.open('login.php','_self')</script>";

    }
}


?>

<!DOCTYPE html>   
<html>   
<html lang="en">

<head>
  <link rel="stylesheet" href="css/login.css">
  <title style="color: brown">LOGIN/SIGN UP WITH ZAUR</title>
  <meta name="author" content="Zaur">
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
    <div class="header">Login </div>
    <form method="post">
      <div class="fields">
        <div class="field input-field">
          <i class="fas fa-user"></i>
          <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="field input-field">
          <i class="fas fa-lock"></i>
          <input type="password" name="password" placeholder="Passoword" required>
        </div>

        <div class="form-link">
          <a href="#" class="forgot-pass">Forgot password?</a>
        </div>

        <div class="field button-field">
          <button name="login">Login</button>
        </div>
        <div class="sign-up form-link">
          <span>Don't have an account?</span>
          <!-- <a href="register.php" class="signup-link">Sign up</a> -->
        </div>
      </div>
    </form>
  </div>
</body>

</html>