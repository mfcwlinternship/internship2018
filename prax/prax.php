<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Record Form</title>
</head>
<body>
    
      <!-- javascript-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/Chart.min.js"></script>
        <script type="text/javascript" src="js/app.js"></script>


<form method="post" id="result_form">
    <?php include 'index.php';?>
    <input type="submit" value="Submit" id="result_button">
    <style type="text/css">
        #chart-container {
            width: 1000px;
            height: auto;
        }
        </style>
    <center><div id="chart-container">

            <canvas id="mycanvas"></canvas>
            </div></center>
</form>



  <script>



  $("#result_button").click(function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: "http://localhost/prax/insert.php",
        data: $('#result_form').serialize(),
       success: function(data) {
			console.log(data);
			var date_time = [];
            var c =  [];
            

			for(var i in data) {
				date_time.push(data[i].date_time);
               c.push(data[i].c);
                
			}

			var chartdata = {
				labels: date_time,
				datasets : [
					{
						label: "Count ", //make this change dynamically 
						backgroundColor: 'rgba(200, 0, 0, 1)',
						borderColor: 'rgba(0, 200, 200, 1)',
						hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
						hoverBorderColor: 'rgba(200, 200, 0, 0.75)',
						data: c
					}
				]
			}

			var ctx = $("#mycanvas");

			var barGraph = new Chart(ctx, {
				type: 'line',
                data: chartdata,
               options:{
				scales: {
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: 'Number of Price Checks',
							fontSize: 20
						},
						ticks: {
							beginAtZero : true
						}
					}]
				}
			   } 
			});
		},
		error: function(data) {
			console.log(data);
		}
    });
});
  </script>
</body>
</html>
