$(document).ready(function(){
			$('#login').validate({
				rules:{
					lemail: {
						required: true,
						email: true
					},
					lsenha: {
						required:true,
						minlength: 7,
						maxlength: 15
					}
				},
				messages:{
					lemail:{
						required:'Por favor insira um e-mail',
						email: 'Digite um e-mail v&aacute;lido por favor'
						},
					lsenha:{
						required:'Por favor insira uma senha',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
						}
					}	
			});
});
					