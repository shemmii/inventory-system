<?php
$con  = mysqli_connect("localhost","root","","project_db");
 if (!$con) {
     # code...
    echo "Problem in database connection! Contact administrator!" . mysqli_error();
 }else{
         $temp_status = "Delivered";
         $sql ="SELECT date_format(cast(tx_date as date),'%M %e, %Y') AS tx_date , sum(r_amount) as amount from recent WHERE r_status = 'Delivered' AND YEAR(tx_date) = YEAR(NOW()) AND MONTH(tx_date)=MONTH(NOW())  group by cast(tx_date as date)";
         $result = mysqli_query($con,$sql); 
         $chart_data="";
         while ($row = mysqli_fetch_array($result)) { 
 
            $date[]  = $row['tx_date']  ;
            $total_amount[] = $row['amount'];
            //$total_volume[] = $row['total_volume'];
      
        }

        $search_history ="SELECT * FROM daily_amount";
        $result1 = mysqli_query($con,$search_history);
 


        if ($result1) {
            // if (mysqli_num_rows($result1) > 0) {
            // //   echo 'found!';
            // } else {
                $save_history ="INSERT INTO daily_amount (total_volume,tx_date,containers_filled,total_amount) SELECT sum(r_qrVolume) as volume, cast(tx_date as date) AS tx_date,count(id) as cont_filled, sum(r_amount) as amount from recent WHERE r_status = 'Delivered' AND YEAR(tx_date) = YEAR(NOW()) AND MONTH(tx_date)=MONTH(NOW())  group by cast(tx_date as date) 
                 ON DUPLICATE KEY UPDATE containers_filled=VALUES(containers_filled),total_amount=VALUES(total_amount),total_volume=VALUES(total_volume)";



                
                // (SELECT count(id) as ) from recent WHERE r_status = 'Delivered' AND YEAR(tx_date) = YEAR(NOW()) AND MONTH(tx_date)=MONTH(NOW())); ";   
                
                $result1 = mysqli_query($con,$save_history);
            }
      

        
 
 }

 
?>