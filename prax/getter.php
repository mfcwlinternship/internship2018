<?php

	$username = "root";
	$password = "";
	$hostname = "localhost";
	
	$dbhandle = mysql_connect($hostname, $username, $password) or die("Unable to connect to MySQL");
	$selected = mysql_select_db("automart_demo", $dbhandle) or die("Could not select examples");
    $choice = mysql_real_escape_string($_POST['Rank']);
   
	
	$query = "SELECT DISTINCT model FROM ibb_comprehensive_tracker WHERE make='$choice'";
	
	$result = mysql_query($query);
		
	while ($row = mysql_fetch_array($result)) {
   		echo "<option>" . $row{'dd_val'} . "</option>";
	}
?>