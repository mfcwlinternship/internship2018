<?php
header('Content-Type: application/json');
//database
define('DB_HOST', '127.0.0.1');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'automart_demo');
//get connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
if(!$mysqli){
	die("Connection failed: " . $mysqli->error);
}

$dateFrom = $_POST['dateFrom'];
$date = DateTime::createFromFormat('m/d/Y',$dateFrom);
$from_date = $date->format("Y-m-d");

$dateTo = $_POST['dateTo'];
$fate = DateTime::createFromFormat('m/d/Y',$dateTo);
$to_date = $fate->format("Y-m-d");

$car = $_POST['cars'];
$client = $_POST['clients'];

if($car == 'default' && $client == 'default'){
    $query = sprintf("SELECT COUNT(cpmodule = '$client') AS frequency, DATE(date_time) as timeline FROM ibb_cardetails_tracker WHERE make = '$car' AND DATE(date_time) BETWEEN '$from_date' AND '$to_date'  GROUP BY DATE(date_time)");
}
else{

    $query = sprintf("SELECT COUNT(cpmodule) AS frequency, DATE(date_time) as timeline FROM ibb_cardetails_tracker AND DATE(date_time) BETWEEN '$from_date' AND '$to_date'  GROUP BY DATE(date_time)");
    
}

$result = $mysqli->query($query);

$data = array();
foreach ($result as $row) {
   $data[] = $row;
}

//close connection
$result->close();

//close connection
$mysqli->close();

//Print data
print json_encode($data);
?>