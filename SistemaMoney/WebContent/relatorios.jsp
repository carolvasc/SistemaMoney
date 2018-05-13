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
			<%
				LancamentoController c = new LancamentoController();
				DespesaBean db = new DespesaBean();

				int mesVisualizado = 0;
				if (request.getAttribute("mesVisualizado") != null) {
					String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
					mesVisualizado = Integer.parseInt(mesTipoString);
				} else {
					mesVisualizado = c.getMesDataAtual();
				}
			%>
			<h3>Relatórios</h3>
			<hr />
			<div>
				<input type="submit" value="" id="btn-anterior" title="Mês anterior"
					onClick="" />
				<h3 style="display: inline; margin: 0 auto"><%=c.getMesExtenso(mesVisualizado)%></h3>
				<input type="submit" value="" id="btn-proximo" title="Próximo mês"
					onClick="" />
			</div>
			<hr />
			<div class="action-button">
				<button class="btn btn-info" id="btn-imprimir" onClick="">Imprimir</button>
			</div>
		</div>
	</div>

	<div class="col-md-2"></div>

</body>
</html>