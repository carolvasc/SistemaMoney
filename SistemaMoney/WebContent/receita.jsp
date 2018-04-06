<%@page import="br.uninove.financeiro.objetos.entidade.Receita"%>
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
		<title>Receitas</title>
		
		<!-- Bootstrap -->
		<link href="resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!--  jQuery -->
		<script src="resources/jquery/jquery-3.3.1.min.js"></script> 
		
		<!--  Importa��o do Menu antes da chamada do css da p�gina -->
		<%@ include file = "menu.jsp" %> 
		
		<!--  Estilo CSS da p�gina-->
		<link href="resources/css/receita.css" rel="stylesheet">
				
		<!-- Javascript -->
		<script type="text/javascript" src="resources/javascript/receita.js"></script>
		
	</head>
	<body>
				
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<form action="despcontroller" method="post">
			
				<jsp:useBean id="dao" class="br.uninove.financeiro.dao.ReceitaDAO" />
				
				<div id="conteudo">
					<h4>Nova Receita</h4>	
					<div class="row">
					
						<div class="col-md-12">
							<input type="hidden" id="id" name="id" value="${receita.idReceita}" readonly />
								
							<div class="form-group">
								<label>Descri��o</label> 
								<input class="form-class" name="descricao" id="descricao" type="text" autofocus
									value="${receita.nomeReceita}" />
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
									value="${receita.valorReceita}" />
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label>Data</label>
								<input class="form-class" name="data" id="data" type="text"
									value="${receita.dataReceita}" />
							</div>
						</div>
						
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Categoria</label>								
								
								<select class="form-class" id="categoria" name="categoria">
									<option selected="selected">[Selecione uma op��o]</option>
	                                    <c:forEach var="categoria" items="${dao.categoria}">
		                                    <c:if test="${categoria.idCategoria == receita.idCategReceita}">
		                                    	<option value="${categoria.idCategoria}" selected="selected">${categoria.tipoCategoria}</option>
		                                    </c:if>
		                                    <c:if test="${categoria.idCategoria != receita.idCategReceita}">
		                                    	<option value="${categoria.idCategoria}">${categoria.tipoCategoria}</option>
		                                    </c:if>
	                                    </c:forEach>
                            	</select>
								
							</div>
						</div>
						
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-12">
							<button type="button" class="btn btn-success" name="repetir"
								id="btn-repetir">Repetir</button>
						</div>
					</div>
					<!-- /row -->
					
					<div class="row" id="box-repetir" hidden>
					
						<div class="col-md-6">
							<div class="form-group">
								<label>Repetir</label>
								<br />
								<input type="radio" name="receita" id="receita-fixa" value="fixa" onclick="getRadioValor();">
									Receita	Fixa
								</input>
								<br />
								<input type="radio" name="receita" id="receita-parcelada" value="parcelada"
									onclick="getRadioValor();"> Lan�amento Parcelado </input>
							</div>
						</div>
						<div class="col-md-6" id="box-desp-fixa" hidden>
							<div class="form-group">
								<select class="form-class">
									<option>Mensal</option>
									<option>Semestral</option>
									<option>Anual</option>
								</select>
							</div>
						</div>
						
						<div class="col-md-6" id="box-desp-parc" hidden>
							<div class="col-md-4">
								<div class="form-group">
									<input class="form-class" type="text" name="parcelas"
										id="parcelas" />
								</div>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<select class="form-class">
										<option>Mensal</option>
										<option>Semestral</option>
										<option>Anual</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="form-group obs-box">
								<label>Observa��o</label>
								<textarea class="form-class" name="observacao" id="observacao"	rows="4">${receita.obsReceita}
								</textarea>
							</div>
						</div>
					</div>
					<!-- /row -->
					
					<div class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-success" name="salvar"
								id="btn-salvar">Salvar</button>
						</div>
					</div>
					
				</div>
				<!-- /conteudo -->
			</form>
		</div>
		<!-- col-md-6 -->
		
		<div class="col-md-3"></div>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
		
	</body>
</html>