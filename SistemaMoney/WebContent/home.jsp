<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js" charset="ISO-8859-1"></script>
    	<script type="text/javascript" src="resources/jquery/jquery-3.3.1.min.js"></script>
		<%@ include file="menu.jsp"%>
		
		<!-- Estilo css -->
		<link href="resources/css/home.css" rel="stylesheet">
		
	    <script type="text/javascript">
          
	      function gerarGrafico(){
	    	  json = {};    	  
	      
	    	  $.ajax({
	    		 url: "dashcontroller",
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
	        
	        var options = {'title':'Categoria das Despesas',
	                       'width':400,
	                       'height':250};
	
	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      }
      	
	      gerarGrafico();
    </script>
		
	</head>
	<body>
	
		<!-- box de informa��es -->
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="tabelaSaldo" style="height: 300px">
						<div>
							<span style="display: block">Ol�, Carol!</span> <span>Seu
								saldo � de R$ 800,00</span>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5 ">
					<div class="tabelaAcesso" style="display: block">
						<h5 class="tituloaAcesso">Acesso R�pido</h5>
	
						<div>
							<a href="reccontroller?acao=cadastrar"> <img class="imagem"
								id="imagemReceita" src="resources/imagens/entradaa.png">
							</a> <a href="despcontroller?acao=cadastrar""> <img class="imagem"
								src="resources/imagens/saidaa.png"></a>
						</div>
						<div>
							<label id="receita">Receita</label> <label>Despesa</label>
						</div>
					</div>
				</div>
				 <div class="col-md-5">
					<div class="tabelaGrafico">
						<!--Div that will hold the pie chart-->
    						<div id="chart_div" ></div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<br>
		<br>
	
		<!-- rodap� -->
		<div class="container-fluid">
			<br>
			<br>
			<div class="rodape">� Copyright 2018</div>
		</div>
		
	</body>
</html>