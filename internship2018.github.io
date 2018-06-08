<!DOCTYPE html>
<html lang ="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ChartJS - BarGraph</title>
    <style type = "text/css">
            #chart-container{
                width: 640px;
                height: auto; 
         }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/Chart.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet">

    <!-- <style>form{width:10%; margin:100px auto;}</style> -->

    <script type="text/javascript">
        $(document).ready(function () {
                $("#dateFrom").datepicker({
                    onClose: function () {
                        $("#dateTo").datepicker(
                            "change", {
                            minDate: new Date($('#dateFrom').val())
                        });
                       $("#dateFrom").datepicker({dateFormat: "dd/mm/yy"});
                    }
                });
        
                $("#dateTo").datepicker({
                    onClose: function () {
                        $("#dateFrom").datepicker(
                            "change", {
                            maxDate: new Date($('#dateTo').val())
                        });
                        $("#dateTo").datepicker({dateFormat: "dd/mm/yy"});
                    }
                });
            });
        </script>

</head>
<body>

    <form method = "POST" id="result_form">

    Select Start Date: <br>
    <!-- <input type="text" id="start" placeholder="Start Date">  -->
    <input type="text" name="dateFrom" id="dateFrom" readonly="true" value="" class="textbox" />

    <br><br>
    Select End Date: <br>
    <!-- <input type="text" id="end" placeholder="End Date"> -->
    <input type="text" name="dateTo" id="dateTo" readonly="true" value="" class="textbox" />
    


    <br><br>

    Select Make: <br>
    <select name="cars">
        <option value="ASHOK LEYLAND">Ashok Leyland</option>
        <option value="ASTON MARTIN">Aston Martin</option>
        <option value="AUDI">Audi</option>
        <option value="BENTLEY">Bentley</option>
        <option value="BMW">BMW</option>
        <option value="BUGATTI">Bugatti</option>
        <option value="CHEVROLET">Chevrolet</option>
        <option value="DAEWOO">Daewoo</option>
        <option value="DATSUN">Datsun</option>
        <option value="DC">DC</option>
        <option value="FERRARI">Ferrari</option>
        <option value="FIAT">Fiat</option>
        <option value="FORCE MOTORS">Force Motors</option>
        <option value="FORD">Ford</option>
        <option value="HINDUSTAN MOTORS">Hindustan Motors</option>
        <option value="HONDA">Honda</option>
        <option value="HYUNDAI">Hyundai</option>
        <option value="ISUZU">Isuzu</option>
        <option value="JAGUAR">Audi</option>
        <option value="LAMBORGHINI">Volvo</option>
        <option value="LANDROVER">Saab</option>
        <option value="MAHINDRA">Fiat</option>
        <option value="MARUTI SUZUKI">Maruti Suzuki</option>
        <option value="MAHINDRA RENAULT">Mahindra Renault</option>
        <option value="MASERATI">Maserati</option>
        <option value="MERCEDES BENZ">Mercedes-Benz</option>
        <option value="MINI">Mini</option>
        <option value="MITSUBISHI">Mitsubishi</option>
        <option value="NISSAN">Nissan</option>
        <option value="OPEL">Opel</option>
        <option value="PORSCHE">Porsche</option>
        <option value="RENAULT">Renault</option>
        <option value="ROLLS ROYCE">Rolls Royce</option>
        <option value="SKODA">Skoda</option>
        <option value="SANGYONG">Ssangyong</option>
        <option value="TATA">Tata</option>
        <option value="TOYOTA">Toyota</option>
        <option value="VOLKSWAGEN">Volkwaged</option>
        <option value="VOLVO">Volvo</option>
    </select>
    <br>
    <br>
    Select Client: <br>
    <select name="clients">
        <option value="Autoportal">Autoportal</option>
        <option value="Cplite">CP lite</option>
        <option value="FIATFIRST">Fiat First</option>
        <option value="Fordassured">Ford Assured</option>
        <option value="HondaApp">Honda App</option>
        <option value="IBBVIN">IBB VIN</option>
        <option value="KMPL">KMPL</option>
        <option value="MFCWL">MFCWL</option>
        <option value="MMFSL">MMFSL</option>
        <option value="TCFSL">TCFSL</option>
        <option value="TEAMBHP">TEAMBHP</option>
        <option value="TEST IBBapp">Test IBB App</option>
        <option value="TestTvs">Test TVS</option>
        <option value="XMART">XMART</option>
    </select>
    <br><br>
    <input type = "submit" id="result_button">
    </form>


    <div id="chart-container">
    <canvas id="mycanvas"></canvas>
    </div>

    <br><br>
        
   


    <!-- <script type="text/javascript" src="js/app.js"></script> -->
    <script>
        $("#result_button").click(function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: "http://localhost/chartjs/create.php",
        data: $("#result_form").serialize(),
        success: function(result) {
            //alert('ok');
             var serno = [];
            var bestpriceyo = [];
            for(var i in result){
                serno.push("Serial Number ") + result[i].timeline
                bestpriceyo.push(result[i].frequency)
            }
            var chardata = {
                labels : DateAndTime, 
                datasets : [ 
                    {
                        label : 'Car ID',
                        backgroundColor: 'rgba(200,200,200,0.75)',
                        borderColor : 'rgba(200,200,200,0.75)',
                        hoverBackgroundColor : 'rgba(200,200,200,1)',
                        hoverBorderColor : 'rgba(200,200,200,1)',
                        data : bestpriceyo
                        
                    }
                ]
            };
            var ctx = $("#mycanvas")
            var barGraph = new CharacterData(ctx, {
                type : 'bar',
                data: chardata
            });
        },
        error: function(result){
            console.log(result);
        }
    
       
    });
});
   
    </script>

</body>
</html>
