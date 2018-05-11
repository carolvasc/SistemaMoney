$(document).ready(function () {

    $("#btn-repetir").click(function () {
        $("#box-repetir").toggle(300);
    });

});

function getRadioValor() {
    var rads = document.getElementsByName('receita');
    for (var i = 0; i < rads.length; i++) {
        if (rads[i].checked) {
            if (rads[i].value === 'fixa') {
                $("#box-receita-parc").hide();
                $("#box-receita-fixa").show();
            } else {
                $("#box-receita-fixa").hide();
                $("#box-receita-parc").show();
            }
        }
    }
}

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
			