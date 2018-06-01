<%@page import="br.uninove.financeiro.objetos.entidade.Usuario"%>
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

<!-- JavaScript-->
<script src="resources/javascript/login.js"></script>

<style type="text/css">
	body {
	background-color: #eaeaea;
}

/* Classe */

.error{
	color:red;
}

.container{
	background-color: white;
    width: 600px;
    min-height: 100%;
    border: 2px #31b0d5 solid;
    box-shadow: 0px 0px 16px #333;
    margin-top:130px;
}
.titulotab{
	font-size:30px;
	font-family:Trebuchet MS;
	color: #286090;
	padding: 30px 0px 40px 250px;
}
	
.form-group {
   
}

.titulinhos {
	font-size: 17px;
	padding-right: 5px;
	color: #286090;
	font-family:Trebuchet MS;
}

/* ID */

#lemail{
	display: inline;
	width: 500px;
}

#lsenha{
	display: inline;
	width: 500px;
}
#cadastro{
	padding-left: 189px;
	font-family:Trebuchet MS;
	font-size: 13px;
	padding-top:10px;
}

#esqueci{
	font-size: 13px;
    color: #0067b8;
    padding-left: 236px;
    font-family:Trebuchet MS;
}

#botaologar{
	width: 127px;
	margin: 20px 0px 0px 236px;
	font-family:Trebuchet MS;
}

.error {
	color: red;
}
label#lnome-error.error{
	margin-left: 60px;
}

label#lemail-error.error{
	margin-left: 60px;
}

label#lsenha-error.error{
	margin-left: 60px;
}
</style>

</head>
<body>
	
	<%
		Usuario u = (Usuario)request.getAttribute("usuario");
	%>
	
	<div class="container">
		<div class="titulotab">
			<label>LOGIN</label>
		</div>
		<form id="login" action="autenticador" method="post">
			<div class="form-group">
				<label for="email" class="titulinhos">E-mail:</label> <input
					type="email" name="login" class="form-control" id="lemail"
					placeholder="Digite seu e-mail">

			</div>

			<div class="form-group">
				<label for="senha" class="titulinhos">Senha:</label> <input
					type="password" name="senha" class="form-control" id="lsenha"
					placeholder="Digite sua senha">

			</div>
			<div>
				<a id="esqueci" href="usucontroller?acao=buscar">Esqueci minha senha</a>
			</div>
			<div id="cadastro">
				Não tem cadastro ainda?<a href="usucontroller?acao=cadastrar"> clique aqui!</a>
			</div>


			<div class="form-group">

				<button type="submit" class="btn btn-primary" id="botaologar" value="autenticar">Logar</button>

			</div>
		</form>
	</div>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
</body>


</html>