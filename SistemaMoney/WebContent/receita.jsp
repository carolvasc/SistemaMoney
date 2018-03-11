<%@page import="br.uninove.financeiro.objetos.entidade.Receita"%>
<%@page import="br.uninove.financeiro.objetos.entidade.Categoria"%>
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
		
		<!--  Estilo CSS -->
		<link href="resources/css/receita.css" rel="stylesheet">
		
		<!-- Javascript -->
		<script type="text/javascript" src="resources/javascript/receita.js"></script>
	</head>
	<body>
	
		<%@ include file="menu.jsp"%>
		
		<%
			Receita rec = (Receita) request.getAttribute("receita");
			Categoria c = (Categoria) request.getAttribute("categoria");
		%>
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div id="conteudo">
				<form action="reccontroller" method="post">
					<jsp:useBean id="dao" class="br.uninove.financeiro.dao.ReceitaDAO" />
					<h4>Nova Receita</h4>
					<div class="row">
						<div class="col-md-12">
							<input type="hidden" id="id" name="id"
								value="<%=rec.getIdReceita()%>" readonly />
							<div class="form-group">
								<label>Descrição</label> <input class="form-class"
									name="descricao" id="descricao" type="text" autofocus
									value="<%=rec.getNomeReceita()%>" />
							</div>
						</div>
						<!-- /col-md-12 -->
					</div>
					<!-- /row -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Valor</label> <input class="form-class" name="valor"
									id="valor" type="text" value="<%=rec.getValorReceita()%>" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Data</label> <input class="form-class" name="data"
									id="data" type="text" value="<%=rec.getDataReceita()%>" />
							</div>
						</div>
					</div>
					<!-- /row -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Categoria</label> <select class="form-class"
									id="categoria" name="categoria">
									<option>[Selecione uma opção]</option>
									<c:forEach var="categoria" items="${dao.categoria}">
										<option value="${categoria.idCategoria}">${categoria.tipoCategoria}</option>
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
								<label>Repetir</label><br /> <input type="radio" name="receita"
									id="receita-fixa" value="fixa" onclick="getRadioValor();">
								Receita Fixa </input> <br /> <input type="radio" name="receita"
									id="receita-parcelada" value="parcelada"
									onclick="getRadioValor();"> Lançamento Parcelado </input>
							</div>
						</div>
						<div class="col-md-6" id="box-receita-fixa" hidden>
							<div class="form-group">
								<select class="form-class">
									<option>Mensal</option>
									<option>Semestral</option>
									<option>Anual</option>
								</select>
							</div>
						</div>
						<div class="col-md-6" id="box-receita-parc" hidden>
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
								<label>Observação</label>
								<textarea class="form-class" name="observacao" id="observacao"
									rows="4" /><%=rec.getObsReceita()%></textarea>
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
				</form>
			</div>
			<!-- /conteudo -->
		</div>
		<!-- /col-md-6 -->
		<div class="col-md-3"></div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
	</body>
</html>