<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@page import="br.uninove.financeiro.controller.DespesaController"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Lançamentos</title>
		
		<!-- Bootstrap -->
		<link href="resources/bootstrap/dist/css/bootstrap.min.css"
			rel="stylesheet">
		
		<!--  jQuery -->
		<script src="resources/jquery/jquery-3.3.1.min.js"></script>
		
		<!--  Importação do Menu antes da chamada do css da página -->
		<%@ include file = "menu.jsp" %>
		
		<!--  Estilo CSS -->
		<link href="resources/css/lancamentos.css" rel="stylesheet">
	</head>
	<body>
	
		<div class="col-md-1"></div>
		<div class="col-md-6">
			<div id="box-tabela">
				<%
					List<Despesa> lista = (List<Despesa>) request.getAttribute("lista");
					LancamentoController l = new LancamentoController();
	
					int mesVisualizado = 0;
					if (request.getAttribute("mesVisualizado") != null) {
						String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
						mesVisualizado = Integer.parseInt(mesTipoString);
					} else {
						mesVisualizado = l.getMesDataAtual();
					}
				%>
				<h3 id="titulo-despesa">Despesas</h3>
				<hr />
				<div id="mes-atual">
					<input type="submit" value="" id="btn-anterior"
						onClick="javascript:window.location='despcontroller?acao=listar&mesTela=<%=mesVisualizado - 1%>'" />
					<h3><%=l.getMesExtenso(mesVisualizado)%></h3>
					<input type="submit" value="" id="btn-proximo"
						onClick="javascript:window.location='despcontroller?acao=listar&mesTela=<%=mesVisualizado + 1%>'" />
				</div>
				<hr />
				<table>
					<%
						for (Despesa d : lista) {
					%>
					<tr>
						<td><%=d.getDataDespesa()%></td>
						<td><%=d.getNomeDespesa()%></td>
						<td><input type="submit" value="" id="btn-editar"
							onClick="javascript:window.location='despcontroller?acao=alterar&id=<%=d.getIdDespesa()%>'" />
							<input type="submit" value="" id="btn-consultar"
							onClick="javascript:window.location='despcontroller?acao=consultar&id=<%=d.getIdDespesa()%>'" />
						</td>
						<td>- <%=d.getValorFormatado()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-3 box-grafico">
			<h3>Gráfico</h3>
			<hr />
			<img src="resources/imagens/grafico2.png" height="346" width="376" />
		</div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
	</body>
</html>