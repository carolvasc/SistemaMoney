$(document).ready(function(){
			$('#cadastro').validate({
				rules:{
					nome:  {
						required: true,
						minlength: 1
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
						required:'Por favor coloque um nome',
						minlength: 'Digite uma nome maior (min 1 caracteres)',
					},
					email:{
						required:'Por favor coloque um e-mail',
						email: 'Digite um e-mail válido por favor'
						},
					senha:{
						required:'Por favor coloque uma senha',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
						}
					}	
			});
});