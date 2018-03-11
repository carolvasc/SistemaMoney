<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@page import="br.uninove.financeiro.controller.DespesaController"%>
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
	<div class="col-md-1"></div>
	<div class="col-md-6">
		<div id="box-tabela">
			<%
				List<Despesa> lista = (List<Despesa>) request.getAttribute("listaLanc");
				LancamentoController c = new LancamentoController();
				
				int mesVisualizado = 0;
				if (request.getAttribute("mesVisualizado") != null){
					String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
				    mesVisualizado = Integer.parseInt(mesTipoString);
				} else {
				    mesVisualizado = c.getMesDataAtual();
				}
			%>
			<h3 class="titulo">Despesas</h3>
			<hr />
			<div id="mes-atual">
				<input type="submit" value="" id="btn-anterior"
				onClick="javascript:window.location='lanccontroller?acao=lancamentos&mesTela=<%=mesVisualizado-1%>'" />
				<h3><%=c.getMesExtenso(mesVisualizado)%></h3>
				<input type="submit" value="" id="btn-proximo"
				onClick="javascript:window.location='lanccontroller?acao=lancamentos&mesTela=<%=mesVisualizado+1%>'" />
			</div>
			<hr />
			<table>
				<%
					for (Despesa d : lista) {
				%>
				<tr>
					<td><%=d.getDataDespesa()%></td>
					<td><%=d.getNomeDespesa()%></td>
					<td style="text-align: center;">
						<input type="submit" value="" id="btn-editar"
						onClick="javascript:window.location='despcontroller?acao=alterar&id=<%=d.getIdDespesa()%>'" />
						<input type="submit" value="" id="btn-consultar"
						onClick="javascript:window.location='despcontroller?acao=consultar&id=<%=d.getIdDespesa()%>'" />
					</td>
					<td id="valor-despesa">-  <%=d.getValorDespesa()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-3 box-grafico" >
		<h3>Gráfico</h3>
		<hr />
		<img src="resources/imagens/grafico2.png" height="346" width="376" />
	</div>
</body>
</html>