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
// Escape user inputs for security
$varMake = $_POST['country-list'];



 
// attempt insert query execution
if (isset($_POST['state-list']) && !empty($_POST['state-list'])) {
    $varModel = $_POST['state-list'];
    $query = sprintf("SELECT date_time, count(*) as c FROM ibb_cardetails_tracker WHERE date_time BETWEEN DATE '2017-12-05' AND '2018-03-05' AND make
    = '$varMake' AND model = '$varModel' GROUP BY CAST(date_time as DATE)");  
}else{  
    $query = sprintf("SELECT date_time, count(*) as c FROM ibb_cardetails_tracker WHERE date_time BETWEEN DATE '2017-12-05' AND '2018-03-05' AND make
    = '$varMake' GROUP BY CAST(date_time as DATE)"); 
}

 $result = $mysqli->query($query);

 $data = array();
foreach ($result as $row) {
	$data[] = $row;
}



// close connection
$result->close();
//close connection
$mysqli->close();
print json_encode($data);
?>