$(document).ready(function () {
    initSaldo()
});

function initSaldo() {

    var idUser = getCookie("uid");
    console.log(idUser);

    var saldo = 0;

    if (idUser) {
        var data = {
            id: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/account/me',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                saldo = risposta.balance
                $("#saldo").text(saldo.toFixed(2) + " Euro");
            },
            error: function (err) {
                console.log(err);
            }
        });
    } //else {
        //location.href = "/login"
    //}
}

function getCookie(name) {​​​​

    var nameEQ = name + "=";

    var ca = document.cookie.split(';');

    for(var i=0;i < ca.length;i++) {​​​​

        var c = ca[i];

        while (c.charAt(0)==' ') c = c.substring(1,c.length);

        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);

    }​​​​

    return null;

}​​​​
