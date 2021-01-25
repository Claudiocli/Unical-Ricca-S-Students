$(document).ready(function () {
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
    document.getElementById("btn-logout").addEventListener("click", logout);
});

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

function logout()   {
    eraseCookie('uid');
    eraseCookie('friendList');
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

// Session controll
let isLogged=getCookie("uid");

if (!isLogged)	{
	window.location.replace(localHost+"/login");
}