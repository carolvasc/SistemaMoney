<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@page import="br.uninove.financeiro.objetos.bean.DespesaBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Consultar Lançamento</title>

<!-- Bootstrap -->
<link href="resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!--  Importação do Menu antes da chamada do css da página -->
<%@ include file="menu.jsp"%>

<!--  Estilo CSS da página-->
<link href="resources/css/relatorios.css" rel="stylesheet">

</head>
<body>

	<div class="col-md-2"></div>

	<div class="col-md-8 box-detalhe">
	<div>
		<h3>Relatórios</h3>
		<hr />
		<div class="action-button">
			<!-- 				<a href="relatorios">Imprimir</a> -->
			<button class="btn btn-primary" id="btn-imprimir"
				onClick="javascript:window.location='relatorios'">
				Gerar Relatório <i class="glyphicon glyphicon-print"></i>
			</button>
		</div>
		
		</div>
	</div>

	<div class="col-md-2"></div>

</body>
</html>