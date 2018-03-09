<%@page import="br.uninove.financeiro.objetos.entidade.Receita"%>
<%@page import="br.uninove.financeiro.objetos.entidade.Categoria"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Money - Receitas</title>

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
<link href="resources/css/receita.css" rel="stylesheet">

<!--  jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<!-- Javascript -->
<script type="text/javascript" src="resources/javascript/receita.js"></script>
</head>
<body>

  <%@ include file = "menu.jsp" %>

	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Receitas</title>
	
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
	<link href="resources/css/receita.css" rel="stylesheet">
	
	<!--  jQuery -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	<!-- Javascript -->
	<script type="text/javascript" src="resources/javascript/receita.js"></script>
	</head>
	<body>
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
							<input type="hidden" id="id" name="id" value="<%=rec.getIdReceita()%>" readonly/>
							<div class="form-group">
								<label>Descrição</label>
								<input class="form-class" name="descricao" id="descricao" type="text" autofocus
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
								<label>Categoria</label>
									<select class="form-class" id="categoria" name="categoria">
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
	</body>
</html>