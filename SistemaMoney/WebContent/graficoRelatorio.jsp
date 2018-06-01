<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
  
  <meta charset="UTF-8">
  
    <!--Load the AJAX API-->
    
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="resources/jquery/jquery-3.3.1.min.js"></script>
    
    <script>
    alert('teste');
    
    function gerarGrafico(){
  	  json = {};    	  
    
  	  $.ajax({
  		 url: "relatoriocontroller",
  		 data: json,	 
  		 type: "get",
  		 success:function (result){
  			     vetor = eval(result);    			 
  			
  			    google.charts.load('current', {'packages':['corechart', 'bar']});
  			    google.charts.setOnLoadCallback(drawStuff);
			    			 
  		 }   		
  	  });    	  
    } 
    


    function drawStuff() {

      var chartDiv = document.getElementById('chart_div');
      var data = google.visualization.arrayToDataTable(vetor);
      var options = {
              chart: {
                title: 'DESPESAS X RECEITAS',
              }
            };

       var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

       chart.draw(data, google.charts.Bar.convertOptions(options));
  };
    
  gerarGrafico();
    
    </script>
  </head>

  <body>

    <!--Div that will hold the pie chart-->
    <div id="columnchart_material" style="white: 230px; height: 500px;"></div>
    
  </body>
</html>
