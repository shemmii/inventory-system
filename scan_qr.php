<?php
class scan_qr{
 public $link='';
 function __construct($qr, $sstatus){
  $this->connect();
  $this->storeInDB($qr, $sstatus);
 }
 
 function connect(){
  $this->link = mysqli_connect('localhost','root','') or die('Cannot connect to the DB');
  mysqli_select_db($this->link,'project_db') or die('Cannot select the DB');
 }
 
 function storeInDB($qr, $sstatus){
  $query = "insert into scan_qr set sstatus='".$sstatus."', qr='".$qr."'";
  $result = mysqli_query($this->link,$query) or die('Errant query:  '.$query);
 }
 
}
if($_GET['qr'] != '' and  $_GET['sstatus'] != ''){
 $scan_qr =new scan_qr($_GET['qr'],$_GET['sstatus']);
}


?>