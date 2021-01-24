$(document).ready(function () {
    initSaldo()
    popolaListaAmici()
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
    document.getElementById("bottoneGestioneId_Account").addEventListener("click", getIdAccount);
    document.getElementById("bottoneCercaAmico").addEventListener("click", cercaAmico);
    document.getElementById("bottoneAggiungiAmico").addEventListener("click", aggiungiAmico);
    document.getElementById("bottoneInviaTransizione").addEventListener("click", inviaTransizione);
    document.getElementById("bottoneAggiungiContribuente").addEventListener("click", addContributor);
    document.getElementById("bottoneRicaricaSaldo").addEventListener("click", ricaricaSaldo);
    document.getElementById("bottoneCreaColletta").addEventListener("click", createColletta);
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
                saldo = risposta.balance;
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
    var importo = document.getElementById("ImportoInputLabel").value;
    var tag = document.getElementById("TagInputLabel").value;
    var datetime = getDateTime();
    console.log(idUser);
    if (idUser) {
        var data = {
            amount: importo,
            datetime: datetime,
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
            console.log(risposta);
            initSaldo();
        },
        error: function (err) {
            console.log(err);
        }
    });
}
function ricaricaSaldo(){
    var idUser = getCookie("uid");
    var importo = document.getElementById("ImportoInputLabel2").value;
    var pan = document.getElementById("panInputLabel").value;
    var datetime = getDateTime();

    console.log(idUser+ importo + pan );
    if (idUser) {
        var data = {
            datetime : datetime,
            card : pan,
            account : idUser,
            amount: importo 
        }
        $.ajax({
            url: 'http://localhost:9090/recharge/add',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                console.log(risposta);
                initSaldo();
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
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
                console.log(risposta);
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
                $("#corpoGestioneAccount").append(ciccia);
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
}

function getIdAccount(){
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
                $("#corpoGestioneId_Account").html("");
                console.log(risposta);
                var ciccia = "";
                ciccia += "<tr>";
                ciccia += "<td>" + "ID" + "</td>";
                ciccia += "<td>" + idUser + "</td>";
                ciccia += "</tr>";
              
                $("#corpoGestioneId_Account").append(ciccia);
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
                console.log(risposta);
                $("#corpoListaAmici").html("");
                for (var i = 0; i < risposta.length; i++) {
                    var ciccia = ""
                    ciccia += "<tr>"
                    ciccia += "<td>" + risposta[i].id + "</td>"
                    ciccia += "<td>" + risposta[i].name + " " + risposta[i].surname + "</td>"
                    ciccia += "</tr>"
                    $("#corpoListaAmici").append(ciccia);
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
                        popolaListaAmici();
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

//L.Russo - funzione per settare Cookie con scadenza variabile
function setCookie(cname,cvalue,exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

// L.Russo - funzione per creare colletta -- datetime dovrebbe essere la data di scadenza della colletta e non la data di creazione --> chiedere info
function createColletta(){
    var idUser = getCookie("uid");
    var datetime = getDateTime();
    var quote = document.getElementById("idQuota").value;
    var beneficiary = document.getElementById("idBeneficiario").value;
    // recupero la lista dei partecipanti alla colletta dal cookie
    var list_id = JSON.parse(getCookie("list_id"));
    // aggiungiamo l'utente che crea la colletta nella lista dei partecipanti
    list_id.push(idUser);
    console.log(idUser);

    if (idUser) {
        var data = {
            colletta:{
                datetime: datetime,
                quote: quote,
                beneficiary: beneficiary
            },
            list_id: list_id
        }
        $.ajax({
            url: 'http://localhost:9090/colletta/new',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                console.log(risposta)
            },
            error: function (err) {
                console.log(err);
            }
        });
        eraseCookie("list_id");
    }
}

// L.Russo - funzione che ad ogni mungiuta del bottone Aggiungi nella modale della colletta aggiunge l'id nel cookie
function addContributor(){
    var list = JSON.parse(getCookie("list_id"));
    if(list != null){
        list.push(document.getElementById("idContribuente").value);
        setCookie("list_id", JSON.stringify(list),1);
    }
    else {
        var list = [];
        list.push(document.getElementById("idContribuente").value);
        setCookie("list_id", JSON.stringify(list),1);
    }
    document.getElementById("idContribuente").value = "";
}

// L.Russo - funzione per calcolare datatime
function getDateTime(){
    var data = new Date();
    var anno, mese, giorno, ore, minuti, secondi;
    anno = data.getFullYear();
    mese = data.getMonth() + 1;
    giorno = data.getDate();
    ore = data.getHours();
    minuti = data.getMinutes();
    secondi = data.getSeconds();

    var finalDate = giorno + "-" + mese + "-" + anno + " " + ore + ":" + minuti + ":" + secondi;
    
    return finalDate;
}

// Session controll
let isLogged=getCookie("uid");
let localHost="http://localHost:9090";

if (!isLogged)	{
	window.location.replace(localHost+"/login");
}

// L.Russo - listeners creazione JSON per tracciare le operazioni
document.getElementById("idBeneficiario").addEventListener("input", () => {
    let operationTracked = JSON.parse(getCookie("lastOperationData"));
    operationTracked["idBeneficiario"] = document.getElementById("idBeneficiario").value;
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);

});

document.getElementById("idQuota").addEventListener("input", () => {
    let operationTracked = JSON.parse(getCookie("lastOperationData"));
    operationTracked["idQuota"] = document.getElementById("idQuota").value;
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);

});

document.getElementById("idContribuente").addEventListener("input", () => {
    let operationTracked = JSON.parse(getCookie("lastOperationData"));
    operationTracked["idContribuente"] = document.getElementById("idContribuente").value;
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);

});

document.getElementById("ImportoInputLabel").addEventListener("input", () => {
    let operationTracked = JSON.parse(getCookie("lastOperationData"));
    operationTracked["ImportoInputLabel"] = document.getElementById("ImportoInputLabel").value;
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);

});

document.getElementById("TagInputLabel").addEventListener("input", () => {
    let operationTracked = JSON.parse(getCookie("lastOperationData"));
    operationTracked["TagInputLabel"] = document.getElementById("TagInputLabel").value;
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);

});