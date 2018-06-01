<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		    <!--Load the AJAX API-->
    
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="resources/jquery/jquery-3.3.1.min.js"></script>

	    <script type="text/javascript">
          
	      function gerarGrafico(){
	    	  json = {};    	  
	      
	    	  $.ajax({
	    		 url: "receitacontroller",
	    		 data: json,	 
	    		 type: "get",
	    		 success:function (result){
	    			 vetor = eval(result);    			 
	    			
				     google.charts.load('current', {'packages':['corechart']});
				
				     google.charts.setOnLoadCallback(drawChart);
				    			 
	    		 }   		
	    	  });    	  
	      }     
	      
	      function drawChart() {
	
	        // Create the data table.
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Topping');
	        data.addColumn('number', 'Slices');
	     
	        data.addRows(vetor);
	        
	        var options = {'title':'Categoria das receitas',
	                       'width':400,
	                       'height':250};
	
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
      	
	      gerarGrafico();

	</script>
</head>
<body>
    						<div id="chart_div" ></div>
</body>
</html>