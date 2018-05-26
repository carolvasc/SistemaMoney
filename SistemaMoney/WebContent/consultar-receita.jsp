<%@page import="br.uninove.financeiro.objetos.entidade.Receita"%>
<%@page import="br.uninove.financeiro.controller.ReceitaController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<title>Consultar Lançamento</title>
		
		<!-- Bootstrap -->
		<link href="resources/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
		
		<!--  jQuery -->
		<script src="resources/jquery/jquery-3.3.1.min.js"></script>
		
		<!--  Importação do Menu antes da chamada do css da página -->
		<%@ include file="menu.jsp"%>
		
		<!--  Estilo CSS da página-->
		<link href="resources/css/tela-consulta.css" rel="stylesheet">
		
	</head>
	<body>
	
		<div class="col-md-2"></div>
		
		<div class="col-md-8 box-detalhe">
			
			<div class="row">
			
				<div class="container col-md-12 box-container">
			
					<div class="col-md-1"></div>
					
					<div class="col-md-3">
					
						<h2>${receita.nomeReceita}</h2>
						<h4>R$ ${receita.valorFormatado}</h4>
						
					</div>
					
					<div class="col-md-1"></div>
					
					<div class="col-md-3">
					
						<h4>Data</h4>
						<p>${receita.dataReceita}</p>
						
						<br/>
						
						<h4>Categoria</h4>
						<p>${receita.nomeCategReceita}</p>
						
					</div>
					
					<div class="col-md-3">
						
						<h4>Observação</h4>
						<p>${receita.obsReceita}</p>
						
					</div>
					
					<div class="col-md-1"></div>
				
				</div>
				<!-- fim-container -->
				
			</div>
			<!-- fim-row -->
			
			<div class="row">
			
				<div class="container col-md-12 box-acoes">
						
					<div class="col-md-4 botoes-acao">
						<button class="btn btn-primary" onClick="javascript:window.location='reccontroller?acao=listar&mesTela='">
								<i class="glyphicon glyphicon-arrow-left"></i>
								Voltar
						</button>
						
						<button class="btn btn-success" onClick="javascript:window.location='reccontroller?acao=alterar&id=${receita.idReceita}'">
							<i class="glyphicon glyphicon-pencil"></i>
							Editar
						</button>
						
						<button class="btn btn-danger" onClick="javascript:window.location='reccontroller?acao=excluir&id=${receita.idReceita}'">
							<i class="glyphicon glyphicon-remove"></i>
							Excluir
						</button>
					</div>
					<!-- fim-box-acoes -->
					
				</div>
				<!-- fim-container -->
		
			</div>
			<!-- fim-row -->
			
		</div>
		
		<div class="col-md-2"></div>
	
	</body>
</html>