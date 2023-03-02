<?php 



class RaviKoQr
{
  public $server = "localhost";
  public $user = "root";
  public $pass = "";
  public $dbname = "project_db";
	public $conn;
  public function __construct()
  {
  	$this->conn= new mysqli($this->server,$this->user,$this->pass,$this->dbname);
  	if($this->conn->connect_error)
  	{
  		die("connection failed");
  	}
  }






 	public function insertQr($login_id,$qrUname, $container_volume,$container_value,$amount,$qrimage,$qrlink)

 	{
			
			$qrUname = $qrUname ."". $container_value;
 			$sql = "INSERT INTO qrcodes(login_id,qrUname,container_volume,qrVolume,amount,status,qrImg,qrlink) VALUES('$login_id','$qrUname','$container_volume','$container_value','$amount','Pending','$qrimage','$qrlink')";
 			$query = $this->conn->query($sql);
 			return $query;

			echo $qrUname;



 	
 	}
 	public function displayImg()
 	{
 		$sql = "SELECT qrimg,qrlink from qrcodes where qrimg='$qrimage'";

 	}
}
$meravi = new RaviKoQr();