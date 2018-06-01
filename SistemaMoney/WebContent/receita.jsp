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

<%@ include file="menu.jsp"%>

<!--  Estilo CSS da página-->
<link href="resources/css/receita.css" rel="stylesheet">

<script type="text/javascript" src="resources/javascript/receita.js"></script>
<script type="text/javascript" src="resources/javascript/mask.js" charset="utf-8""></script>

</head>
<body>

	<div class="col-md-3"></div>

	<div class="col-md-6">
		<div id="conteudo">
			<form action="reccontroller" method="post" id="receita">
				<jsp:useBean id="dao" class="br.uninove.financeiro.dao.ReceitaDAO" />
				<h4>Nova Receita</h4>
				<div class="row">

					<div class="col-md-12">
						<input type="hidden" id="id" name="id"
							value="${receita.idReceita}" readonly />

						<div class="form-group">
							<label>Descrição</label> <input class="form-class"
								name="descricao" id="descricao" type="text" autofocus
								value="${receita.nomeReceita}" />
						</div>

					</div>
					<!-- /col-md-12 -->
				</div>
				<!-- /row -->

				<div class="row">

					<div class="col-md-6">
						<div class="form-group">
							<label>Valor</label> <input class="form-class" name="valor"
								id="valor" type="text" value="${receita.valorReceita}" />
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group">
							<label>Data</label> <input class="form-class" name="data"
								id="data" type="text" value="${receita.dataReceita}" />
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
						<div class="form-group obs-box">
							<label>Observação</label>
							<textarea class="form-class" name="observacao" id="observacao"
								rows="4">${receita.obsReceita}
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
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
		<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>
</body>
</html>