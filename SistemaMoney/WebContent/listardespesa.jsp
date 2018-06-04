<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
<%@page import="br.uninove.financeiro.objetos.bean.DespesaBean"%>
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
		
		<!-- Javascript -->
		<script type="text/javascript" src="resources/javascript/tela-consulta.js"></script>
	</head>
	<body>
	
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="box-tabela">
				<%
					List<Despesa> lista = (List<Despesa>) request.getAttribute("lista");
					LancamentoController c = new LancamentoController();
	
					int mesVisualizado = 0;
					if (request.getAttribute("mesVisualizado") != null) {
						String mesTipoString = String.valueOf(request.getAttribute("mesVisualizado"));
						mesVisualizado = Integer.parseInt(mesTipoString);
					} else {
						mesVisualizado = c.getMesDataAtual();
					}
				%>
				<h3 id="titulo-despesa">Despesas</h3>
				<hr />
				<div id="mes-atual">
					<input type="submit" value="" id="btn-anterior" title="Mês anterior"
						onClick="javascript:window.location='despcontroller?acao=listar&mesTela=<%=mesVisualizado - 1%>'" />
					<h3><%=c.getMesExtenso(mesVisualizado)%></h3>
					<input type="submit" value="" id="btn-proximo" title="Próximo mês"
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
							<td>
								<input type="submit" value="" id="btn-editar" title="Editar" onClick="javascript:window.location='despcontroller?acao=alterar&id=<%=d.getIdDespesa()%>'" />
								<input type="submit" value="" id="btn-consultar" title="Consultar" onClick="javascript:window.location='despcontroller?acao=consultar&id=<%=d.getIdDespesa()%>'" />				
							</td>
							<td>- <%=d.getValorFormatado()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
			<div class="col-md-2"></div>
	</body>
</html>