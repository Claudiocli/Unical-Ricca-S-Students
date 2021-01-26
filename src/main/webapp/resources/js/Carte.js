var firebaseConfig = {
	apiKey: "AIzaSyAlsmnuWM9U1etPRjMB3zEYhP9XXmyUn34",
	authDomain: "payball8-1f27c.firebaseapp.com",
	databaseURL: "https://payball8-1f27c-default-rtdb.europe-west1.firebasedatabase.app",
	projectId: "payball8-1f27c",
	storageBucket: "payball8-1f27c.appspot.com",
	messagingSenderId: "39509751218",
	appId: "1:39509751218:web:6fb7cc6cbb7960386e60ab",
	measurementId: "G-PY99LWBLTW"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();

$(document).ready(function(){
    popolaTabellaCarte();
    aggiungiCarta();
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
    document.getElementById("bottoneAggiungiCarta").addEventListener("click", checkData);
    document.getElementById("btn-logout").addEventListener("click", logout);
    // L.Russo - listeners creazione JSON per tracciare le operazioni
    var operationTracked = {};
    operationTracked["operation"] = "AddCard";
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);

    document.getElementById("idNumeroCarta").addEventListener("input", () =>{
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if(operationTracked != null){
            operationTracked["idNumeroCarta"] = document.getElementById("idNumeroCarta").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } else {
            var operationTracked = {};
            operationTracked["idNumeroCarta"] = document.getElementById("idNumeroCarta").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } 
    });
    
    document.getElementById("idIntestatario").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if(operationTracked != null){
            operationTracked["idIntestatario"] = document.getElementById("idIntestatario").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } else {
            var operationTracked = {};
            operationTracked["idIntestatario"] = document.getElementById("idIntestatario").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } 
    });
    
    document.getElementById("mese").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if(operationTracked != null){
            operationTracked["mese"] = document.getElementById("mese").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } else {
            var operationTracked = {};
            operationTracked["mese"] = document.getElementById("mese").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } 
    });
    
    document.getElementById("anno").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if(operationTracked != null){
            operationTracked["anno"] = document.getElementById("anno").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } else {
            var operationTracked = {};
            operationTracked["anno"] = document.getElementById("anno").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } 
    });
    
    document.getElementById("cvc").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if(operationTracked != null){
            operationTracked["cvc"] = document.getElementById("cvc").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } else {
            var operationTracked = {};
            operationTracked["cvc"] = document.getElementById("cvc").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000*60, true);
        } 
    });
});
function aggiungiCarta(){
    $("#aggiungiCarta").click(show);
}

function show(){
    $("#form").attr("hidden",false);
};

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
            $("#corpoGestioneAccount").html("");
            console.log(risposta);
            var ciccia = "";
            ciccia += "<tr>";
            ciccia += "<td>" + "ID" + "</td>";
            ciccia += "<td>" + risposta.id + "</td>";
            ciccia += "</tr>";
            ciccia += "<tr>";
            ciccia += "<td>" + "Indirizzo" + "</td>";
            ciccia += "<td>" + risposta.address + "</td>";
            ciccia += "</tr>";
            ciccia += "<tr>";
            ciccia += "<td>" + "CodiceFiscale" + "</td>";
            ciccia += "<td>" + risposta.cf + "</td>";
            ciccia += "</tr>";
            ciccia += "<tr>";
            ciccia += "<td>" + "Data di Nascita" + "</td>";
            ciccia += "<td>" + risposta.dob + "</td>";
            ciccia += "</tr>";
            ciccia += "<tr>";
            ciccia += "<td>" + "E-mail" + "</td>";
            ciccia += "<td>" + risposta.email + "</td>";
            ciccia += "</tr>";
            ciccia += "<tr>";
            ciccia += "<td>" + "Nome" + "</td>";
            ciccia += "<td>" + risposta.name + "</td>";
            ciccia += "</tr>";
            ciccia += "<tr>";
            ciccia += "<td>" + "Cognome" + "</td>";
            ciccia += "<td>" + risposta.surname + "</td>";
            ciccia += "</tr>";
            $("#corpoGestioneAccount").append(ciccia);
        },
        error: function (err) {
            console.log(err);
        }
    });   
    }
}

function popolaTabellaCarte(){
    var idUser = getCookie("uid");
    console.log(idUser);
    if (idUser) {
        var data = {
            id: idUser
        }
    $.ajax({
        url: 'http://localhost:9090/card/myCard',
        method: 'POST',
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (risposta) {
            var size = 0;
            $("#corpoTabellaCarte").html("");
            for(var i=0 ;i<risposta.length; i++){
                size+=1;
                var ciccia = "";
                ciccia += "<tr>";
                ciccia += "<td>" + risposta[i].expiration_date + "</td>";
                ciccia += "<td>" + risposta[i].pan + "</td>";
                ciccia += "<td> <button type='button' class='serch-button-font' style='background-color:#69c974;' id='deleteBtn"+i+"'>X</button></td>";
                ciccia += "</tr>";
                $("#corpoTabellaCarte").append(ciccia);
            }
            createEventListenerBtn(risposta);
        },
        error: function (err) {
            console.log(err);
        }
    });   
    }
}

// L.Russo - eliminazione carte - 
function createEventListenerBtn(risposta){
    for(let i = 0; i < risposta.length; i++){
        document.getElementById("deleteBtn"+i).addEventListener("click", function(e) {
            var idUser = getCookie("uid");
            var pan = risposta[i].pan;
            console.log(idUser);
            if (idUser) {
                var data = {
                    pan: pan
                }
                if(confirm("Vuoi eliminare la carta definiitivamente?")){
                    $.ajax({
                        url: 'http://localhost:9090/card/deleteCard/'+idUser,
                        method: 'DELETE',
                        data: JSON.stringify(data),
                        contentType: "application/json",
                        success: function (risposta) {
                            alert("Carta eliminata con successo");
                            popolaTabellaCarte();
                        },
                        error: function (err) {
                            alert("ERRORE: Eliminazione non riuscita! Riprovare.");
                            console.log(err);
                        }
                    });  
                } 
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

function setCookie(name, value, days, daysIsMillisecond) {
	var expires = "";
	if (daysIsMillisecond)	{
		var date = new Date();
		date.setTime(date.getTime()+(days));
		expires= "; expires="+date.toUTCString();
	}
    else if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
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

// L.Russo - funzione per aggiunta carta
function insertCard(){
    var idUser = getCookie("uid");
    var pan = document.getElementById("idNumeroCarta").value;
    var holder = document.getElementById("idIntestatario").value;
    var expiration_date = document.getElementById("mese").value + "-" + document.getElementById("anno").value;
    var cvv = document.getElementById("cvc").value;
    var datetime = getDateTime();

    console.log(idUser);
    if (idUser) {
        var data = {
            pan: pan,
            holder: holder,
            expiration_date: expiration_date,
            cvv: cvv,
            datetime: datetime,
            account: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/card/add',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                console.log(risposta)
                window.alert("Carta inserita con successo!");
            },
            error: function (err) {
                console.log(err);
                window.alert("ERRORE: Carta non inserita. Riprovare.")
            }
        });
    }
    eraseCookie("lastOperationData");
}

function checkData(){
    var pan = document.getElementById("idNumeroCarta").value;
    var holder = document.getElementById("idIntestatario").value;
    var expiration_date = document.getElementById("mese").value + document.getElementById("anno").value;
    var cvv = document.getElementById("cvc").value;
    var terminiduso = document.getElementById("exampleCheck1").checked;
    var anno = document.getElementById("anno").value;
    if(pan == "" || holder == "" || expiration_date == "" || cvv == "" || !terminiduso || cvv.length != 3 || pan.length != 16 || anno.length != 4){
        console.log("Campi richiesti");
        alert("NONONO")
    }
    else{
        insertCard();
    }
}
// Session controll
let isLogged=getCookie("uid");
let localHost="http://localHost:9090";

if (!isLogged)	{
	window.location.replace(localHost+"/login");
}


function onKeyNumeric(e) {
    // Accetto solo numeri e backspace <-
    if ( ((e.keyCode >= 48) && (e.keyCode <= 57)) || (e.keyCode == 8) ) {
        return true;
    } else {
        return false;
    }
}

function checkMese(){
    let mese = document.getElementById("mese").value;
    if(mese > 12){
        document.getElementById("mese").value = "12";
    }
}

function checkAnno(){
    let anno = document.getElementById("anno").value;
    if(anno.length > 3){
        if(anno > (new Date().getFullYear()+50)){
            document.getElementById("anno").value = (new Date().getFullYear())+50;
        }
        else if(anno < (new Date().getFullYear())){
            document.getElementById("anno").value = new Date().getFullYear();
        }
    }
}
