function Zone() {
    $('#zone-select').empty();
    $('#zone-select').append("<option>Chargement</option>");
    $.ajax({
       type: "GET",
       url: "http://localhost/chartjs/data2.php",
       dataType: "json",
       success: function(data) {
          //console.log(data)
          $('#zone-select').empty();
          $('#zone-select').append("<option value='0'>-- Select zone --</option>");
          $.each(data, function(i, item) {
             $('#zone-select').append('<option value=' + data[i].zone_pop + '>' + data[i].zone_nom + '</option>');
          });
 
          $("#zone-select").change(function() {
             var nom = $("#zone-select option:selected").text(); // name of selected option
             var index = zoneNom.indexOf(nom);
             var new_labels = [zoneNom[index]];
             var new_data1 = [zonePop[index]];
             var new_data2 = [zoneSalaries[index]];
             barGraph.data.labels = new_labels;
             barGraph.data.datasets[0].data = new_data1;
             barGraph.data.datasets[1].data = new_data2;
             barGraph.update(); // update chart
          });
 
          var zoneNom = [];
          var zonePop = [];
          var zoneSalaries = [];
          for (var i in data) {
             zoneNom.push(data[i].zone_nom);
             zonePop.push(data[i].zone_pop);
             zoneSalaries.push(data[i].zone_salaries)
          }
          var chartdata = {
             labels: zoneNom,
             datasets: [{
                label: 'Population',
                backgroundColor: 'rgba(200, 200, 200, 0.75)',
                borderColor: 'rgba(200, 200, 200, 0.75)',
                hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
                hoverBorderColor: 'rgba(200, 200, 200, 1)',
                data: zonePop
             }, {
                label: 'Salaries',
                backgroundColor: 'rgba(200, 200, 200, 0.75)',
                borderColor: 'rgba(200, 200, 200, 0.75)',
                hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
                hoverBorderColor: 'rgba(200, 200, 200, 1)',
                data: zoneSalaries
             }]
          };
 
          var option = {
             scales: {
                yAxes: [{
                   ticks: {
                      beginAtZero: true
                   }
                }]
             }
          };
          var ctx = $("#mycanvas");
          var barGraph = new Chart(ctx, {
             type: 'bar',
             data: chartdata,
             options: option
          });
          var myBarChart;
 
          $("#zone-select").val(zonePop[0]).trigger('change'); // select first option
 
       },
       complete: function() {}
    });
 }
 $(document).ready(function() {
    Zone();
 });