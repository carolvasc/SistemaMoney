$(document).ready(function () {
	
	$("#btn-consultar").click(function() {
		
		$("#consulta-nome").html("Compras");
		$("#consulta-valor").html("R$ 700,00");
		$("#consulta-data").html("10/10/2018");
		$("#consulta-categoria").html("Alimentação");
		$("#consulta-pagamento").html("Dinheiro");
		
	});
	
});

function setId(idLancamento){
	var id = idLancamento;
	return id;
}

// Não é AJAX

//Ao chamar a função no HTML, deverá ser passado o método referente ao mesmo na servlet (onClick = chamarServlet('GET')) 
function chamarServlet(methodType) {
	$("#btn-consultar").action = "/SistemaMoney/despcontroller";
	$("#btn-consultar").method = methodType;					// MethodType será o método pelo qual a servlet será requisitada (GET, POST, PUT, etc)
	
}


// AJAX

// Dentro do JSP da página deverá ter a seguinte função: 
function callServletAjax(methodType){
	
	var xmlhttp;
	
	if(windows.XMLHttpRequest){ // IE7+ and others browsers
		xmlhttp = new XMLHttpRequest();
	} else { // IES, IE6
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhtpp.readyState == 4 && xmlhttp.status == 200){
			$("minhaDiv").html = xmlhtpp.responseText; // Minha div seria aonde o HTML deverá ser escrito dinamicamente
		}
	};
	
	var params = $("#id").val();
	
	xmlhttp.open(methodType, "/SistemaMoney/despcontroller?acao=consultar&id=" + params, true);
	xmlhttp.send();
			
}