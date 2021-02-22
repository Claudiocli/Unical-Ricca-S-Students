var paginaCorrente = 0
var numPagine = 0
$(document).ready(function () {
    initStorico()
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
});

function initStorico() {

    var idUser = getCookie("uid");
    console.log(idUser);

    if (idUser) {
        var data = {
            id: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/storico/size',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                calcoloPagine(risposta)
                console.log(risposta)
            },
            error: function (err) {
                console.log(err);
            }
        });
        popolaStorico(0, data);
    }
}

function calcoloPagine(size) {
    // 10 is the number of row of the table. It can be changed. Delete the hardcode
    var pagine = Math.floor(size / 10);
    numPagine = pagine;
    var prec = $("#Prec")
    var pros = $("#Pros") 
    $("#pagination").html("");
    $("#pagination").append(prec)
    for(var i=0 ; i<=pagine; i++){
        var pagina = i+1;
        $("#pagination").append('<li class="page-item "><a class="page-link nav-bar-pages" href="#">'+ pagina +'</a></li>')
    }
    $("#pagination").append(pros)     
}

function popolaStorico(page, data){
    $.ajax({
        url: 'http://localhost:9090/storico/getColumn/' + page,
        method: 'POST',
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (risposta) {
            console.log(risposta)
            $("#corpoTabella").html("");
            for(var i=0 ;i<risposta.length; i++){
                var ciccia = ""
                var verifica = "Ricevi"
                if(risposta[i].amount < 0)
                    verifica = "Invia"
                ciccia += "<tr>"
                ciccia += "<td>" + risposta[i].datetime + "</td>"
                ciccia += "<td>" + risposta[i].amount + "</td>"
                ciccia += "<td>" + risposta[i].recipient + "</td>"
                ciccia += "<td>" + verifica + "</td>"
                ciccia += "</tr>"
                $("#corpoTabella").append(ciccia)
            }
        },
        error: function (err) {
            console.log(err);
        }
    });   
}

function precedente(){
    var idUser = getCookie("uid");
    var data = {
        id: idUser
    }    
    if(paginaCorrente > 0){
        paginaCorrente-- 
        popolaStorico(paginaCorrente, data);
    }
}

function prossima(){
    var idUser = getCookie("uid");
    var data = {
        id: idUser
    }
    if(paginaCorrente < numPagine)
        paginaCorrente++
        popolaStorico(paginaCorrente, data);
}

function popolaGestioneAccount(){
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

let dataButton=document.getElementById("data-filter");
let importButton=document.getElementById("import-filter");
let tipoButton=document.getElementById("type-filter");

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