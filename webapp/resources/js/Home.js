$(document).ready(function () {
    initSaldo()
});

function initSaldo(){
    var saldo = 0;
    //chiamata get al DB
    $("#saldo").text(saldo.toFixed(2) + " Euro");
}
