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