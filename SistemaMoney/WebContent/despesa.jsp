<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
<%@page import="br.uninove.financeiro.objetos.entidade.Categoria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Despesas</title>
		
		<%@ include file = "menu.jsp" %> 
		
		<!--  Estilo CSS da página-->
		<link href="resources/css/despesa.css" rel="stylesheet">
		
		<script type="text/javascript" src="resources/javascript/despesa.js"></script>
			
	</head>
	<body>
				
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<form action="despcontroller" method="post" id="despesa">
				<jsp:useBean id="dao" class="br.uninove.financeiro.dao.DespesaDAO" />
				
				<div id="conteudo">
					<h4>Nova Despesa</h4>	
					<div class="row">
					
						<div class="col-md-12">
							<input type="hidden" id="id" name="id" value="${despesa.idDespesa}" readonly />
								
							<div class="form-group">
								<label>Descrição</label> 
								<input class="form-class" name="descricao" id="descricao" type="text" autofocus
									value="${despesa.nomeDespesa}" />
							</div>
							
						</div>
						<!-- /col-md-12 -->
					</div>
					<!-- /row -->
					
					<div class="row">
					
						<div class="col-md-6">
							<div class="form-group">
								<label>Valor</label>
								<input class="form-class" name="valor" id="valor" type="text"
									value="${despesa.valorDespesa}" />
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label>Data</label>
								<input class="form-class" name="data" id="data" type="text"
									value="${despesa.dataDespesa}" />
							</div>
						</div>
						
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Categoria</label>								
								
								<select class="form-class" id="categoria" name="categoria">
									<option selected="selected" value="">[Selecione uma opção]</option>
	                                    <c:forEach var="categoria" items="${dao.categoria}">
		                                    <c:if test="${categoria.idCategoria == despesa.idCategDespesa}">
		                                    	<option value="${categoria.idCategoria}" selected="selected">${categoria.tipoCategoria}</option>
		                                    </c:if>
		                                    <c:if test="${categoria.idCategoria != despesa.idCategDespesa}">
		                                    	<option value="${categoria.idCategoria}">${categoria.tipoCategoria}</option>
		                                    </c:if>
	                                    </c:forEach>
                            	</select>
								
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label>Pagamento</label>
								
								<select class="form-class" id="pagamento" name="pagamento">
									<option selected="selected" value="">[Selecione uma opção]</option>
	                                    <c:forEach var="pagamento" items="${dao.pagamento}">
		                                    <c:if test="${pagamento.idPagamento == despesa.idPagtoDespesa}">
		                                    	<option value="${pagamento.idPagamento}" selected="selected">${pagamento.tipoPagamento}</option>
		                                    </c:if>
		                                    <c:if test="${pagamento.idPagamento != despesa.idPagtoDespesa}">
		                                    	<option value="${pagamento.idPagamento}">${pagamento.tipoPagamento}</option>
		                                    </c:if>
	                                    </c:forEach>
                            	</select>
                            	
							</div>
						</div>
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="form-group obs-box">
								<label>Observação</label>
								<textarea class="form-class" name="observacao" id="observacao" rows="4">${despesa.obsDespesa}
								</textarea>
							</div>
						</div>
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-danger" name="salvar"
								id="btn-salvar">Salvar</button>
						</div>
					</div>
					
				</div>
				<!-- /conteudo -->
			</form>
		</div>
		<!-- col-md-6 -->
		
		<div class="col-md-3"></div>

	</body>
</html>