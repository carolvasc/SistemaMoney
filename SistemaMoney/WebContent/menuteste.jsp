<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Clever Cash</title>

<!-- icone de dinheiro no title -->
<link rel="icon" type="resources/imagens/CCs.png"
	href="resources/imagens/CCs.png" />

<!-- Estilo css -->
<link href="resources/css/menuteste.css" rel="stylesheet">

<!-- Bootstrap -->
<link href="resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!--  jQuery -->
<script src="resources/jquery/jquery-3.3.1.min.js"></script>

<!-- Inclusão do Plugin jQuery Validation-->
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>



</head>
<body>

<%
		
		int mes = 0;
	
		if (request.getAttribute("mesVisualizado") != null) {
			String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
			mes = Integer.parseInt(mesTipoString);
		}
	
	%>
	
	<nav class="navbar navbar-light" class="navbar navbar-inverse">
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bar1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#" ></a> 
    <img src="resources/imagens/Logo.png" class="centro" ><p style="color: black">.................................................................................</a>
</p>></div>
<div class="collapse navbar-collapse" id="bar1">
<ul class="nav navbar-nav" >
          <li><a href="home.jsp">HOME</a></li>
          <li><a href="reccontroller?acao=cadastrar">RECEITA</a></li>
          <li><a href="despcontroller?acao=cadastrar">DESPESA</a></li>
          <li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"> LANÇAMENTOS <span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="reccontroller?acao=listar&mesTela" <%= mes %>>RECEITAS</a>
					</li>
					<li><a href="despcontroller?acao=listar&mesTela=" <%= mes %>>DESPESAS</a>
					</li>
				</ul>
		  </li>
          <li><a href="relatorios.jsp">RELATÓRIO</a></li>
			</ul>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown" id="iconeConfig" >
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="
    padding-bottom:  35px;
    padding-left: 37px;">
						<img src="resources/imagens/engra.png" alt="sua-foto" id="iconeFoto"
							 class="centroo">	
					</a>
					<ul class="dropdown-menu">
						<li><a href="alterarSenha.jsp">Alterar Senha</a></li>
						<li><a href="login.jsp">Logout</a></li></li>
					</ul>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

	
</body>
</html>