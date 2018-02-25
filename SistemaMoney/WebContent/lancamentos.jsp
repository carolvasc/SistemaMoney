<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Lançamentos</title>

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

<!--  Estilo CSS -->
<link href="resources/css/lancamentos.css" rel="stylesheet">
</head>
<body>
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div id="box-tabela">
			<%
				List<Despesa> lista = (List<Despesa>) request.getAttribute("listaLanc");
			%>
			<h3>Lançamentos</h3>
			<h3 id="mes-atual"> < Mês atual > </h3>
			<hr/>
			<h4>Filtros</h4>
			<hr/>
			<table>
				<tr>
					<th>Data</th>
					<th>Nome</th>
					<th>Categoria</th>
					<th>Valor</th>
				</tr>

				<%
					for (Despesa d : lista) {
				%>
				<tr>
					<td><%=d.getDataDespesa()%></td>
					<td><%=d.getNomeDespesa()%></td>
					<td><%=d.getNomeCategDespesa()%></td>
					<td>-<%=d.getValorDespesa()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="col-md-3"></div>
</body>
</html>