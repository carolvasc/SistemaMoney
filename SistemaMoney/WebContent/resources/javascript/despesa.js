$(document).ready(function () {

    $("#btn-repetir").click(function () {
        $("#box-repetir").toggle(300);
    });
});

function getRadioValor() {
    var rads = document.getElementsByName('despesa');
    for (var i = 0; i < rads.length; i++) {
        if (rads[i].checked) {
            if (rads[i].value === 'fixa') {
                $("#box-desp-parc").hide();
                $("#box-desp-fixa").show();
            } else {
                $("#box-desp-fixa").hide();
                $("#box-desp-parc").show();
            }
        }
    }
}



$(document).ready(function(){
	$('#despesa').validate({
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
			},
			pagamento: {
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
								},
			pagamento:{
				required:'Escolha um tipo de pagamento'
													}
			}	
	});
});
			