$(document).ready(function () {
    initSaldo()
    popolaListaAmici()
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
    document.getElementById("bottoneCercaAmico").addEventListener("click", cercaAmico);
    document.getElementById("bottoneAggiungiAmico").addEventListener("click", aggiungiAmico);
    document.getElementById("bottoneInviaTransizione").addEventListener("click", inviaTransizione);
    document.getElementById("btn-logout").addEventListener("click", logout);
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
    }
}

function inviaTransizione() {
    var idUser = getCookie("uid");
    var importo = document.getElementById("ImportoInputLabel").value
    var tag = document.getElementById("TagInputLabel").value
    console.log(idUser);
    if (idUser) {
        var data = {
            amount: importo,
            datetime: "12 - 12 - 2020" ,
            category: "Normal",
            sender: idUser,
            recipient: tag
        }
    }
    $.ajax({
        url: 'http://localhost:9090/storico/send',
        method: 'POST',
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (risposta) {
            console.log(risposta)
            initSaldo()
        },
        error: function (err) {
            console.log(err);
        }
    });
}

function popolaGestioneAccount() {
    var idUser = getCookie("uid");
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
                $("#corpoGestioneAccount").html("");
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

function popolaListaAmici() {
    var idUser = getCookie("uid");
    console.log(idUser);
    if (idUser) {
        var data = {
            id: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/home/friendship',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                console.log(risposta)
                $("#corpoListaAmici").html("");
                for (var i = 0; i < risposta.length; i++) {
                    var ciccia = ""
                    ciccia += "<tr>"
                    ciccia += "<td>" + risposta[i].id + "</td>"
                    ciccia += "<td>" + risposta[i].name + " " + risposta[i].surname + "</td>"
                    ciccia += "</tr>"
                    $("#corpoListaAmici").append(ciccia)
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
}

function aggiungiAmico() {
    var idUser = getCookie("uid");
    var x = document.getElementById("tagInputLabel").value
    console.log(idUser);
    console.log(x);

    if (idUser) {
        var data = {
            datetime: "12-12-2020",
            account1: idUser,
            account2: x
        }
        $.ajax({
            url: 'http://localhost:9090/friendship/add',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                popolaListaAmici()
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
}

function cercaAmico() {
    var idUser = getCookie("uid");
    var x = document.getElementById("tagInputLabel").value
    console.log(idUser);
    console.log(x);

    if (idUser) {
        var data = {
            id: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/home/friendship',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                for (var i = 0; i < risposta.length; i++) {
                    if (x == risposta[i].id) {
                        $("#corpoListaAmici").html("");
                        var ciccia = ""
                        ciccia += "<tr>"
                        ciccia += "<td>" + risposta[i].id + "</td>"
                        ciccia += "<td>" + risposta[i].name + " " + risposta[i].surname + "</td>"
                        ciccia += "</tr>"
                        $("#corpoListaAmici").append(ciccia)
                    }
                    else if (x == "") {
                        popolaListaAmici()
                    }
                }

            },
            error: function (err) {
                console.log(err);
            }
        });
    }
}

function logout()   {
    eraseCookie('uid');
    window.location.replace("http://localhost:9090/login");
}

function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}
function eraseCookie(name) {   
    document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}