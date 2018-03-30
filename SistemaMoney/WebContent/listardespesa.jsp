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
	
		<div class="col-md-1"></div>
		<div class="col-md-6">
			<div id="box-tabela">
				<%
					List<Despesa> lista = (List<Despesa>) request.getAttribute("lista");
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
				<h3 id="titulo-despesa">Despesas</h3>
				<button class="btn btn-info" id="btn-imprimir" onClick="imprimir()">Imprimir</button>
				<hr />
				<div id="mes-atual">
					<input type="submit" value="" id="btn-anterior" title="mês anterior"
						onClick="javascript:window.location='despcontroller?acao=listar&mesTela=<%=mesVisualizado - 1%>'" />
					<h3><%=c.getMesExtenso(mesVisualizado)%></h3>
					<input type="submit" value="" id="btn-proximo" title="próximo mês"
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
								<input type="submit" value="" id="btn-editar" title="editar" onClick="javascript:window.location='despcontroller?acao=alterar&id=<%=d.getIdDespesa()%>'" />
								<input type="submit" value="" id="btn-consultar" title="consultar" data-toggle="modal" data-target=".box-consulta" onClick="setId(<%=d.getIdDespesa()%>)"/>				
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
						
						<h4>Observação</h4>
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
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
	</body>
</html>