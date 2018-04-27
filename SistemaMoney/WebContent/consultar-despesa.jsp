<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
<%@page import="br.uninove.financeiro.controller.DespesaController"%>
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
		<link href="resources/css/consultar-despesa.css" rel="stylesheet">
		
	</head>
	<body style="background-color: lightgray; font-family: Trebuchet MS">
	
		<div class="col-md-2"></div>
		
		<div class="col-md-8" style="background-color: white; border-radius: 5px; box-shadow: 0px 0px 50px; min-height: 100%; margin-top: 5%;">
			
			<div class="row">
			
				<div class="container col-md-12" style="padding: 50px; font-size: 17px;">
			
					<div class="col-md-1"></div>
					
					<div class="col-md-3">
					
						<h2>${despesa.nomeDespesa}</h2>
						<h4>R$ ${despesa.valorFormatado}</h4>
						
					</div>
					
					<div class="col-md-1"></div>
					
					<div class="col-md-3">
					
						<h4 style="font-weight: bold;">Data</h4>
						<p>${despesa.dataDespesa}</p>
						
						<br/>
						
						<h4 style="font-weight: bold;">Categoria</h4>
						<p>${despesa.nomeCategDespesa}</p>
						
					</div>
					
					<div class="col-md-3">
					
						<h4 style="font-weight: bold;">Forma de Pagamento</h4>
						<p>${despesa.nomePagtoDespesa}</p>
						
						<br/>
						
						<h4 style="font-weight: bold;">Observação</h4>
						<p>${despesa.obsDespesa}</p>
						
					</div>
					
					<div class="col-md-1"></div>
				
				</div>
				<!-- fim-container -->
				
			</div>
			<!-- fim-row -->
			
			<div class="row">
			
				<div class="container col-md-12" style="padding: 20px;">
						
					<div class="col-md-4" style="float: right; padding: 0px">
						<button class="btn btn-primary" onClick="javascript:window.location='despcontroller?acao=listar&mesTela='">
								<i class="glyphicon glyphicon-arrow-left" style="padding-right: 5px"></i>
								Voltar
						</button>
						
						<button class="btn btn-success" onClick="javascript:window.location='despcontroller?acao=alterar&id=${despesa.idDespesa}'">
							<i class="glyphicon glyphicon-pencil" style="padding-right: 5px"></i>
							Editar
						</button>
						
						<button class="btn btn-danger" onClick="javascript:window.location='despcontroller?acao=excluir&id=${despesa.idDespesa}'">
							<i class="glyphicon glyphicon-remove" style="padding-right: 5px"></i>
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