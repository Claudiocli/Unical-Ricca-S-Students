$(document).ready(function () {
    initSaldo()
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
});



function initSaldo() {

    var idUser = 1//getCookie("uid");
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

function popolaGestioneAccount(){
    var idUser = 1//getCookie("uid");
    console.log(idUser);
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
            console.log(risposta)
            var ciccia = ""
            ciccia += "<tr>"
            ciccia += "<td>" + "ID" + "</td>"
            ciccia += "<td>" + risposta.id + "</td>"
            ciccia += "</tr>"
            ciccia += "<tr>"
            ciccia += "<td>" + "Indirizzo" + "</td>"
            ciccia += "<td>" + risposta.address + "</td>"
            ciccia += "</tr>"
            ciccia += "<tr>"
            ciccia += "<td>" + "CodiceFiscale" + "</td>"
            ciccia += "<td>" + risposta.cf + "</td>"
            ciccia += "</tr>"
            ciccia += "<tr>"
            ciccia += "<td>" + "Data di Nascita" + "</td>"
            ciccia += "<td>" + risposta.dob + "</td>"
            ciccia += "</tr>"
            ciccia += "<tr>"
            ciccia += "<td>" + "E-mail" + "</td>"
            ciccia += "<td>" + risposta.email + "</td>"
            ciccia += "</tr>"
            ciccia += "<tr>"
            ciccia += "<td>" + "Nome" + "</td>"
            ciccia += "<td>" + risposta.name + "</td>"
            ciccia += "</tr>"
            ciccia += "<tr>"
            ciccia += "<td>" + "Cognome" + "</td>"
            ciccia += "<td>" + risposta.surname + "</td>"
            ciccia += "</tr>"
            $("#corpoGestioneAccount").append(ciccia)
        },
        error: function (err) {
            console.log(err);
        }
    });   
    }
}