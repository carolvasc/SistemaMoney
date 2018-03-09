<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Seu DimDim</title>

	<!-- icone de dinheiro no title -->
	<link rel="icon" 
	type="resources/imagem/dimdim.png" 
	href="resources/imagem/dimdim.png" />
	<!-- Estilo css -->
	<link href="resources/css/home.css" rel="stylesheet">

		<!-- Bootstrap -->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
			integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
			crossorigin="anonymous">
		<!-- Optional theme -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
			integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
			crossorigin="anonymous">
		<!-- Latest compiled and minified JavaScript -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous"></script>
<!--  jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<!-- Javascript -->
<script type="text/javascript" src="resources/javascript/receita.js"></script>
</head>
<body>

	<%@ include file = "menu.jsp" %>
	<!-- box de informações -->

	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="tabelaSaldo" style="height: 300px">
					<div>
						<span style="display: block">Olá, Carol!</span>
						<span>Seu saldo é de R$ 800,00</span>
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
					<div class="tabelaAcesso">
					<h5 class="tituloaAcesso">Acesso Rápido</h5>
							
							<div > 
								<a href="reccontroller?acao=cadastrar" > <img class="imagem" id="imagemReceita" src="resources/imagem/entradaa.png"> </a>
								<a href="#"> <img  class="imagem"  src="resources/imagem/saidaa.png"></a>
							</div>
							<div >
								<label id="receita">Receita</label>
								<label>Despesa</label>
							</div>
				</div>
				</div>
				<div class="col-md-5">
					<div class="tabelaGrafico">
						<h5  class="tituloGrafico">Gráfico</h5>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<br>
		<br>

		<!-- rodapé -->
		<div class="container-fluid">
			<br><br>
			<div class="rodape">
				 © Copyright 2018 
			</div>
			<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<script src="bootstrap/js/bootstrap.min.js"></script>
		</body>
		</html>