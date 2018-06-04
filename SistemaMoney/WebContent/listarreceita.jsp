<%@page import="br.uninove.financeiro.objetos.entidade.Receita"%>
<%@page import="br.uninove.financeiro.controller.LancamentoController"%>
<%@page import="br.uninove.financeiro.controller.ReceitaController"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Lan�amentos</title>
		
		<!-- Bootstrap -->
		<link href="resources/bootstrap/dist/css/bootstrap.min.css"
			rel="stylesheet">
		
		<!--  jQuery -->
		<script src="resources/jquery/jquery-3.3.1.min.js"></script>
		
		<!--  Importa��o do Menu antes da chamada do css da p�gina -->
		<%@ include file = "menu.jsp" %>
		
		<!--  Estilo CSS -->
		<link href="resources/css/lancamentos.css" rel="stylesheet">
	</head>
	<body>
	
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="box-tabela">
				<%
					List<Receita> lista = (List<Receita>) request.getAttribute("lista");
					LancamentoController c = new LancamentoController();
	
					int mesVisualizado = 0;
					if (request.getAttribute("mesVisualizado") != null) {
						String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
						mesVisualizado = Integer.parseInt(mesTipoString);
					} else {
						mesVisualizado = c.getMesDataAtual();
					}
				%>
				<h3 id="titulo-receita">Receitas</h3>
				<hr />
				<div id="mes-atual">
					<input type="submit" value="" id="btn-anterior"
						onClick="javascript:window.location='reccontroller?acao=listar&mesTela=<%=mesVisualizado - 1%>'" />
					<h3><%=c.getMesExtenso(mesVisualizado)%></h3>
					<input type="submit" value="" id="btn-proximo"
						onClick="javascript:window.location='reccontroller?acao=listar&mesTela=<%=mesVisualizado + 1%>'" />
				</div>
				<hr />
				<table>
					<%
						for (Receita r : lista) {
					%>
					<tbody>
						<tr>
							<td><%=r.getDataReceita()%></td>
							<td><%=r.getNomeReceita()%></td>
							<td><input type="submit" value="" id="btn-editar"
								onClick="javascript:window.location='reccontroller?acao=alterar&id=<%=r.getIdReceita()%>'" />
								<input type="submit" value="" id="btn-consultar"
								onClick="javascript:window.location='reccontroller?acao=consultar&id=<%=r.getIdReceita()%>'" />
							</td>
							<td><%=r.getValorFormatado()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-2"></div>
	</body>
</html>