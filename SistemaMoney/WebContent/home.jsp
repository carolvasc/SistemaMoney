<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		
		<%@ include file="menu.jsp"%>
		
		<!-- Estilo css -->
		<link href="resources/css/home.css" rel="stylesheet">
		
		<!-- Javascript -->
		<script type="text/javascript" src="resources/javascript/receita.js"></script>
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
						<h5 class="tituloGrafico">Gr�fico</h5>
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