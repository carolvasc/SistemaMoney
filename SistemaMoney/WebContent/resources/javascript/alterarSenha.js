$(document).ready(function(){
			$('#alterarSenha').validate({
				rules:{
					senhaantiga:  {
						required:true,
						minlength: 7,
						maxlength: 15
					},
					senhanova: {
						required:true,
						minlength: 7,
						maxlength: 15
					},
					repetir: {
						required:true,
						minlength: 7,
						maxlength: 15
					}
				},
				messages:{
					senhaantiga: {
						required:'Por favor insira uma senha',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
					},
					senhanova:{
						required:'Por favor insira uma senha',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
						},
					repetir:{
						required:'Por favor insira uma senha',
						minlength: 'Digite uma senha maior (min 7 caracteres)',
						maxlength: 'Digite uma senha menor (max 15 caracteres)'
						}
					}	
			});
});

