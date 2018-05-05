<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Seu DimDim</title>

<!-- icone de dinheiro no title -->
<link rel="icon" type="imagem/dimdim.png"
	href="resources/imagem/dimdim.png" />

<!-- Estilo css -->
<link href="resources/css/menu.css" rel="stylesheet">

<!-- Bootstrap -->
<link href="resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	
	<%
		
		int mes = 0;
	
		if (request.getAttribute("mesVisualizado") != null) {
			String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
			mes = Integer.parseInt(mesTipoString);
		}
	
	%>
	
	<!-- Barra navegação -->

	<nav class="navbar navbar-light" class="navbar navbar-inverse">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#barra-navegacao">
					<span class="sr-only">Alternar Menu</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
		</div>

		<div class="collapse navbar-collapse" id="barra-navegacao">
			<!-- imagem  -->

			<label class="navbar-brand" id="titulo">SEU DIMDIM</label> <img
				src="resources/imagens/cash.png" class="centro">
			<ul class="nav navbar-nav">

				<!-- HOME  -->
				<li class="active"><a href="home.jsp" id="home">HOME</a></li>

				<!-- Receitas   -->

				<li><a href="reccontroller?acao=cadastrar">RECEITA</a></li>

				<!-- Despesas  -->

				<li><a href="despcontroller?acao=cadastrar">DESPESA</a></li>

				<!-- Lançamentos  -->

				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> LANÇAMENTOS <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="reccontroller?acao=listar&mesTela="<%= mes %>>Receitas</a>
						</li>
						<li><a href="despcontroller?acao=listar&mesTela="<%= mes %>>Despesas</a>
						</li>
					</ul>
				</li>

				<!-- Relatório -->
				<li><a href="relatorios.jsp">RELATÓRIO</a></li>
			</ul>
			<!--Icone config-->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" id="iconeConfig">
						<span class="glyphicon glyphicon-cog" class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Preferências</a></li>
						<li><a href="#">Alertas</a></li>
					</ul>
				</li>

				<!-- Icone foto -->

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="resources/imagens/usuario.png" alt="sua-foto" id="iconeFoto"
							class="img-circle" class="centro">
							</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Minha Conta</a></li>
						<li><a href="login.jsp">Logout</a></li></li>
					</ul>
		
		</div>

		</div>
	</nav>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>

</body>
</html>