<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@page import="br.uninove.financeiro.objetos.bean.DespesaBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Consultar Lan�amento</title>

<!-- Bootstrap -->
<link href="resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!--  Importa��o do Menu antes da chamada do css da p�gina -->
<%@ include file="menu.jsp"%>

<!--  Estilo CSS da p�gina-->
<link href="resources/css/relatorios.css" rel="stylesheet">

</head>
<body>

	<div class="col-md-2"></div>

	<div class="col-md-8 box-detalhe">
	<div>
		<h3>Relat�rios</h3>
		<hr />
		
		<div>
		
			<%@ include file="graficoRelatorio.jsp"%>
			
		</div>
		
		<div class="action-button">

			<button class="btn btn-danger" id="btn-despesas" title="Gerar relat�rio de despesas"
				onClick="javascript:window.location='RelatorioDespesaController'">
				Despesas <i class="glyphicon glyphicon-print"></i>
			</button>
			
			<button class="btn btn-success" id="btn-receitas" title="Gerar relat�rio de receitas"
				onClick="javascript:window.location='RelatorioReceitaController'">
				Receitas <i class="glyphicon glyphicon-print"></i>
			</button>
			
		</div>
		
		</div>
	</div>

	<div class="col-md-2"></div>

</body>
</html>