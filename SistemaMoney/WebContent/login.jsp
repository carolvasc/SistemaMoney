<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<title>Seu DimDim</title>
		
		<!-- icone de dinheiro no title -->
		<link rel="icon" type="resources/imagens/dimdim.png" href="resources/imagens/dimdim.png" />
		
		<!-- Bootstrap -->
		<link href="resources/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
		
		<!--  jQuery -->
		<script src="resources/jquery/jquery-3.3.1.min.js"></script>
		
		<!-- Inclusão do Plugin jQuery Validation-->
		<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>
		
		<!-- Estilo css -->
		<link href="resources/css/login.css" rel="stylesheet">
		
	</head>
	<body class="cadastrar">
	
		<button id="botaoLogin" type="button" data-toggle="modal"
			data-target="#janela" class="btn btn-danger">Login</button>
	
		<form class="modal fade" id="janela">
	
			<div class="modal-dialog modal-lg">
				<div class="modal-content" style="margin-top: 161px;">
	
					<!-- cabecalho -->
					<div class="modal-header">
	
						<button type="button" class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>
						<h4 class="efetuarLogin">Efetuar login</h4>
					</div>
	
					<!-- corpo -->
					<div class="modal-body">
	
						<div class="form-group">
							<input type="email" name="lemail" class="form-control" id="lemail"
								 placeholder="Digite seu e-mail">
						</div>
	
						<div class="form-group">
							<input type="password" name="lsenha" class="form-control"
								id="lsenha" placeholder="Digite sua senha">
						</div>
						<span><a id="esqueci" href="#">Esqueci minha senha</a></span>
					</div>
	
					<!-- rodape -->
					<div class="modal-footer">
	
						<button type="button" class="btn btn-default" data-dismiss="modal">
							Cancelar</button>
	
						<button type="submit" onclick="return validar()"
							class="btn btn-danger">Logar</button>
	
					</div>
	
				</div>
			</div>
	
		</form>
	
	
		<div class="cadastro" style="margin-top: 90px;">
			Cadastre-se
			<form id="cadastro">
	
				<div class="form-group">
					<input type="hidden" name="id" class="form-control" id="idcadastro">
				</div>
				<div class="form-group">
					<label for="nome" class="nome">Nome: </label> <input type="text"
						name="nome" placeholder="Digite seu nome" class="form-control"
						id="nome">
				</div>
	
				<div class="form-group">
					<label for="email" class="email">E-mail: </label> <input
						type="email" name="email" placeholder="Digite seu e-mail"
						class="form-control" id="email">
				</div>
	
				<div class="form-group">
					<label for="senha" class="senha">Senha:</label> <input
						type="password" name="senha" placeholder="Digite sua senha"
						class="form-control" id="senha">
				</div>
				<button type="submit" class="btn btn-danger" class="btn btn-default"
					id="botao">Cadastrar</button>
			</form>
		</div>
		<!-- Inclusão das validações com o Plugin jQuery Validation-->
		<script src="resources/javascript/login.js"></script>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
	</body>
</html>