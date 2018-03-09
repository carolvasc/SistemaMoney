<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Title -->
	<title>Seu DimDim</title>

	<!-- icone de dinheiro no title -->
	<link rel="icon" 
	type="resources/imagem/dimdim.png" 
	href="resources/imagem/dimdim.png" />
	
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Inclusão do jQuery-->
  <script src="http://code.jquery.com/jquery-1.11.1.js"></script>
  <!-- Inclusão do Plugin jQuery Validation-->
  <script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>
  
 	 <!-- Estilo css -->
	<link href="resources/css/login.css" rel="stylesheet">

<body class="cadastrar">
		
			<button id="botaoLogin" type="button" 
              data-toggle="modal" data-target="#janela" class="btn btn-danger">Login</button>
		
		<form class="modal fade" id="janela">
        
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            
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
                <input type="email" name="lemail" class="form-control" id="lemail" placeholder="Digite seu e-mail">
              </div>

              <div class="form-group"> 
                <input type="password" name="lsenha" class="form-control" id="lsenha" placeholder="Digite sua senha">
              </div>
              <span ><a id="esqueci" href="#" >Esqueci minha senha</a></span>
            </div>

            <!-- rodape -->
            <div class="modal-footer">

              <button type="button" class="btn btn-default" data-dismiss="modal">
                Cancelar
              </button>

              <button type="submit" onclick="return validar()" class="btn btn-danger">
                Logar
              </button>

            </div>

          </div>
        </div>

      </form>


		<div class="cadastro">
			Cadastre-se
   				 <form id="cadastro">
					
					<div class="form-group" >
   						<input type="hidden" name="id" class="form-control" id="idcadastro" >
   					</div>
					<div class="form-group" >
   						<label  for="nome" class="nome">Nome: </label>
   						<input type="text" name="nome" placeholder="Digite seu nome" class="form-control" id="nome" >
   					</div>

   					<div class="form-group">
   						<label for="email" class="email">E-mail: </label>
   						<input type="email" name="email" placeholder="Digite seu e-mail" class="form-control" id="email">
   					</div>

   					<div class="form-group">
   						<label for="senha" class="senha">Senha:</label>
   						<input type="password" name="senha" placeholder="Digite sua senha" class="form-control" id="senha">
   					</div>
   					<button type="submit" class="btn btn-danger" class="btn btn-default" id="botao">Cadastrar</button>
					</div>
    			  </form>
		</div>
	<!-- Inclusão das validações com o Plugin jQuery Validation-->
    <script src="resources/javascript/login.js"></script>
    <!-- bootstrap -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
     </body>
		</html>