<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Seu DimDim</title>

<!-- icone de dinheiro no title -->
<link rel="icon" type="resources/imagens/dimdim.png"
	href="resources/imagens/dimdim.png" />

<!-- Bootstrap -->
<link href="resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!--  jQuery -->
<script src="resources/jquery/jquery-3.3.1.min.js"></script>

<!-- Inclusão do Plugin jQuery Validation-->
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>

<!-- Estilo css -->
<link href="resources/css/login.css" rel="stylesheet">

<!-- JavaScript-->
<script src="resources/javascript/login.js"></script>

</head>
<body>

	<div class="container">
		<div class="titulotab">
			<label>LOGIN</label>
		</div>
		<form id="login">
			<div class="form-group">
				<label for="email" class="titulinhos">E-mail:</label> <input
					type="email" name="lemail" class="form-control" id="lemail"
					placeholder="Digite seu e-mail">

			</div>

			<div class="form-group">
				<label for="senha" class="titulinhos">Senha:</label> <input
					type="password" name="lsenha" class="form-control" id="lsenha"
					placeholder="Digite sua senha">

			</div>
			<div>
				<a id="esqueci" href="#">Esqueci minha senha</a>
			</div>
			<div id="cadastro">
				Não tem cadastro ainda?<a href="cadastro.jsp"> clique aqui!</a>
			</div>


			<div class="form-group">

				<button type="submit" class="btn btn-primary" id="botaologar">Logar</button>

			</div>
		</form>
	</div>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
</body>


</html>