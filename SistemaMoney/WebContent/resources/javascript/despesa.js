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