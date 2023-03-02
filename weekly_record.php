<?php
$con  = mysqli_connect("localhost","root","","project_db");
 if (!$con) {
     # code...
    echo "Problem in database connection! Contact administrator!" . mysqli_error();
 }else{
         $temp_status = "Delivered";
         $sql ="SELECT cast(tx_date as date) AS tx_date , sum(r_amount) as amount from recent WHERE r_status = 'Delivered' AND YEAR(tx_date) = YEAR(NOW()) AND MONTH(tx_date)=MONTH(NOW())  group by cast(tx_date as date)";
         $result = mysqli_query($con,$sql);
         $chart_data="";
         
         while ($row = mysqli_fetch_array($result)) { 
 
            $date[]  = $row['tx_date'];
            $total_amount[] = $row['amount'];

          
      
        }
        // $save_history ="INSERT IGNORE INTO daily_amount (tx_date,total_amount) SELECT cast(tx_date as date) AS tx_date , sum(amount) as amount from qrcodes WHERE status = 'Delivered' AND YEAR(tx_date) = YEAR(NOW()) AND MONTH(tx_date)=MONTH(NOW())  group by cast(tx_date as date)";
        // $result1 = mysqli_query($con,$save_history);    

//         $search_history ="SELECT * FROM daily_amount";
//         $result1 = mysqli_query($con,$search_history);
 


//         if ($result1) {
//             if (mysqli_num_rows($result1) > 0) {
//             //   echo 'found!';
//             } else {
//                 $save_history ="INSERT INTO daily_amount (tx_date,total_amount) Select cast(tx_date as date) As tx_date, sum(amount) as amount from qrcodes WHERE status = 'Delivered' AND  WEEKOFYEAR(tx_date)=WEEKOFYEAR(NOW()) group by cast(tx_date as date)";
//                 $result1 = mysqli_query($con,$save_history);    
//             }
      

    
//  }

}
?>