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
		
		<!-- Javascript -->
		<script type="text/javascript" src="resources/javascript/tela-consulta.js"></script>
	</head>
	<body>
	
		<div class="col-md-1"></div>
		<div class="col-md-6">
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
					<input type="submit" value="" id="btn-anterior" title="M�s anterior"
						onClick="javascript:window.location='despcontroller?acao=listar&mesTela=<%=mesVisualizado - 1%>'" />
					<h3><%=c.getMesExtenso(mesVisualizado)%></h3>
					<input type="submit" value="" id="btn-proximo" title="Pr�ximo m�s"
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
			<div class="col-md-1"></div>
			<div class="col-md-3 box-grafico">
				<h3>Gr�fico</h3>
				<hr />
				<img src="resources/imagens/grafico2.png" height="346" width="376" />
			</div>
		</div>
		
		
		<!-- Tela de Consulta -->
		<div class="row box-consulta modal fade rodape" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-right: 12px;">
	          <span aria-hidden="true">&times;</span>
	        </button>
		
			<div class="row">
			
				<div class="container">
			
					<div class="col-md-2"></div>
					
					<div class="col-md-3">
					
						<h2 id="consulta-nome"></h2>
						<h4 id="consulta-valor"></h4>
						
					</div>
					
					<div class="col-md-3">
					
						<h4>Data</h4>
						<p id="consulta-data"></p>
						
						<h4>Categoria</h4>
						<p id="consulta-categoria"></p>
						
					</div>
					
					<div class="col-md-3">
					
						<h4>Forma de Pagamento</h4>
						<p id="consulta-pagamento"></p>
						
						<h4>Observa��o</h4>
						<p>-----</p>
						
					</div>
					
					<div class="col-md-1"></div>
				
				</div>
				<!-- fim-container -->
				
			</div>
			<!-- fim-row -->
				
			<div class="row">
			
				<div class="container">
						
					<div class="box-acoes" style="float: right;">
						<button class="btn btn-success" >Editar</button>
						<button class="btn btn-warning" >Copiar</button>
						<button class="btn btn-danger" >Excluir</button>
					</div>
					<!-- fim-box-acoes -->
					
				</div>
				<!-- fim-container -->
		
			</div>
			<!-- fim-row -->
			
		</div>
		<!-- fim-box-consulta -->
		
	</body>
</html>