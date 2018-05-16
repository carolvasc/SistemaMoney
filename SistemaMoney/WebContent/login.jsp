<%@page import="br.uninove.financeiro.objetos.entidade.Usuario"%>
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
	 
		
		<!-- Estilo css -->
		<link href="resources/css/login.css" rel="stylesheet">
	
		
	</head>
	<body>
	<%
		Usuario u = (Usuario)request.getAttribute("usuario");
	%>
	
		<div class="container">
  <div class="titulotab"><label>LOGIN</label></div>
  <form id="login" action="autenticador" method="post">
    <div class="form-group">
							<label for="email" class="titulinhos">E-mail:</label>
							<input type="email" name="login" class="form-control" id="lemail"

								   placeholder="Digite seu e-mail">
							
						</div>
	
						<div class="form-group">
							<label for="senha" class="titulinhos">Senha:</label>
							<input type="password" name="senha" class="form-control"
							       id="lsenha" placeholder="Digite sua senha">
							
						</div>
						<div><a id="esqueci" href="#">Esqueci minha senha</a></div>
					
	
    <div class="form-group">        
      
       <button type="submit" onclick="return validate()" class="btn btn-primary" id="botaologar" value="autenticar">Logar</button>
       
      </div>
    </div>
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