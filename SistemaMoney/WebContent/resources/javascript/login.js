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
						required:'Por favor coloque um e-mail',
						email: 'Digite um e-mail válido por favor'
						},
					lsenha:{
						required:'Por favor coloque um e-mail',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
						}
					}	
			});
});
					