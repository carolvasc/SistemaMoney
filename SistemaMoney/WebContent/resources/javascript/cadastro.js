
$(document).ready(function(){
			$('#cadastro').validate({
				rules:{
					nome:  {
						required: true,
						minlength: 2
					},
					email: {
						required: true,
						email: true
					},
					senha: {
						required:true,
						minlength: 7,
						maxlength: 15
					}
				},
				messages:{
					nome: {
						required:'Por favor insira um nome',
						minlength: 'Digite uma nome maior (min 2 caracteres)',
					},
					email:{
						required:'Por favor insira um e-mail',
						email: 'Digite um e-mail v&aacute;lido por favor'
						},
					senha:{
						required:'Por favor insira uma senha',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
						}
					}	
			});
});

