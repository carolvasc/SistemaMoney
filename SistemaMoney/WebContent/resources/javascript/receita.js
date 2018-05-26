$(document).ready(function(){
	$('#receita').validate({
		rules:{
			descricao: {
				required: true
			},
			valor: {
				required:true,
				minlength: 1
			},
			data: {
				required: true
			},
			categoria: {
				required: true
			}
		},
		messages:{
			descricao:{
				required:'Por favor insira uma descri&ccedil;&atilde;o'
					},
			valor:{
				required:'Por favor insira um valor',
				minlength: 'Digite um valor maior (min 1 caracteres)'
				},
				data:{
					required:'Por favor insira uma data'
						},
				categoria:{
					required:'Escolha uma categoria'
								}
			}	
	});
});
			