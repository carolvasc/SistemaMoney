<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<title>Seu DimDim</title>
		
		<!-- icone de dinheiro no title -->
		<link rel="icon" type="resources/imagens/dimdim.png" href="resources/imagens/dimdim.png" />
		
		<!-- Bootstrap -->
		<link href="resources/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
		
		<!--  jQuery -->
		<script src="resources/jquery/jquery-3.3.1.min.js"></script>
		
		<!-- Estilo css -->
		<link href="resources/css/home.css" rel="stylesheet">
		
		<!-- Javascript -->
		<script type="text/javascript" src="resources/javascript/receita.js"></script>
	</head>
	<body>
	
		<%@ include file="menu.jsp"%>
		
		<!-- box de informações -->
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="tabelaSaldo" style="height: 300px">
						<div>
							<span style="display: block">Olá, Carol!</span> <span>Seu
								saldo é de R$ 800,00</span>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<div ng-app="app" class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5 ">
					<div class="tabelaAcesso" style="display: block">
						<h5 class="tituloaAcesso">Acesso Rápido</h5>
	
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
				<div ng-controller="dashboardCtrl" class="col-md-5">
					<div class="tabelaGrafico">
						<h5 class="tituloGrafico">Gráfico</h5>
						<div class="panel panel-default dash-panel-mini">
			                    <div class="panel-body">
			                        <canvas id="minilineChart"></canvas>
			                    </div>
			                </div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<br>
		<br>
	
		<!-- rodapé -->
		<div class="container-fluid">
			<br>
			<br>
			<div class="rodape">© Copyright 2018</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.5/angular-route.js"></script>
		<script src="resources/javascript/dashboard.js"></script>
	
	</body>
</html>