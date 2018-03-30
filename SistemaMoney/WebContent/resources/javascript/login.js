$(document).ready( function() {
  $("#cadastro").validate({
    // Define as regras
    rules:{
      nome:{
        // campoNome será obrigatório (required) e terá tamanho mínimo (minLength)
        required: true
      },
      email:{
        // campoEmail será obrigatório (required) e precisará ser um e-mail válido (email)
        required: true, email: true
      },
      senha:{
        // campoMensagem será obrigatório (required) e terá tamanho mínimo (minLength)
        required: true, minlength: 6
      }
    },
    // Define as mensagens de erro para cada regra
    messages:{
      nome:{
        required: "Digite o seu nome"
      },
      email:{
        required: "Digite o seu e-mail",
        email: "Digite um e-mail valido"
      },
      senha:{
        required: "Digite uma senha",
        minLength: "Sua senha deve ter 6 caracteres"
      }
    }
  });
});

$(document).ready( function() {
	  $("#janela").validate({
	    // Define as regras
	    rules:{
	      
	      lemail:{
	        // campoEmail será obrigatório (required) e precisará ser um e-mail válido (email)
	        required: true
	      },
	      lsenha:{
	        // campoMensagem será obrigatório (required) e terá tamanho mínimo (minLength)
	        required: true
	      }
	    },
	    // Define as mensagens de erro para cada regra
	    messages:{
	     
	      lemail:{
	        required: "Digite o seu e-mail"
	      },
	      lsenha:{
	        required: "Digite uma senha"
	
	      }
	    }
	  });
	});