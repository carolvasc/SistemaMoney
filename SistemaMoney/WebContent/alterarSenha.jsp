<%@ include file="menu.jsp"%>

<!-- Estilo css -->
<link href="resources/css/alterarSenha.css" rel="stylesheet">

<!-- JavaScript-->
<script src="resources/javascript/alterarSenha.js"></script>
</head>
<body>

	
	<div class="container">
		<div class="titulotab">
			<label>Alterar a Senha</label>
		</div>

		<form id="alterarSenha" >
			
			<div class="form-group">
				<label for="senhaantiga" class="titulinhos">Senha: </label> <input
					type="text" name="login"
					placeholder="Digite seu email" class="form-control"
					id="senhaantiga">
			</div>		
			
			<div class="form-group">
				<label for="senhaantiga" class="titulinhos">Senha: </label> <input
					type="text" name="senhanova"
					placeholder="Digite seu email" class="form-control"
					id="senhaantiga">
			</div>

			<div class="form-group">
				<label for="repetir" class="titulinhos">Nova senha:</label> <input
					type="password" name="senha2"
					placeholder="Digite a nova senha novamente" class="form-control"
					id="repetir">
			</div>


			<div class="form-group">

				<button type="submit" class="btn btn-primary" id="botaoalterarsenha" >Alterar</button>

			</div>
		</form>
	</div>	
</body>
</html>