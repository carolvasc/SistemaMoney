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
		<link href="resources/css/cadastro.css" rel="stylesheet">
		
		<!-- JavaScript-->
		<script src="resources/javascript/cadastro.js"></script>
		
	</head>
<body>

<body>
		<div class="container">
  <div class="titulotab"><label>CADASTRE-SE</label></div>
  <form id="cadastro" method="POST">
    <div class="form-group">
					<input type="hidden" name="id" class="form-control" id="idcadastro">
				</div>
				<div class="form-group">
					<label for="nome" class="titulinhos">Nome: </label> <input type="text"
						name="nome" placeholder="Digite seu nome" class="form-control"
						id="nome">
		
				</div>
	
				<div class="form-group">
					<label for="email" class="titulinhos">E-mail: </label> <input
						type="email" name="email" placeholder="Digite seu e-mail"
						class="form-control" id="email">
				</div>
	
				<div class="form-group">
					<label for="senha" class="titulinhos">Senha:</label> <input
						type="password" name="senha" placeholder="Digite sua senha"
						class="form-control" id="senha">
				</div>
					
	
    <div class="form-group">        
      
       <button type="submit" class="btn btn-primary" id="botaocadastrar">Cadastrar</button>
      
     </div>
     </form>
    </div>
  
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="resources/bootstrap/dist/js/bootstrap.min.js"></script>
	</body>
</html>
