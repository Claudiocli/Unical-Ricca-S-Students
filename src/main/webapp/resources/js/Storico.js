var paginaCorrente = 0;
var numPagine = 0;
$(document).ready(function () {
    initStorico();
    document.getElementById("bottoneGestioneAccount").addEventListener("click", popolaGestioneAccount);
    document.getElementById("btn-logout").addEventListener("click", logout);
});

function initStorico() {

    var idUser = getCookie("uid");

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
                calcoloPagine(risposta);
            },
            error: function (err) {
            }
        });
        popolaStorico(0, data);
    }
}
setInterval(initStorico,60*1000); 

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

function calcoloPagine(size) {
    var pagine = Math.floor(size / 10);
    numPagine = pagine;
    var prec = $("#Prec");
    var pros = $("#Pros") ;
    $("#pagination").html("");
    $("#pagination").append(prec);
    for(var i=0 ; i<=pagine; i++){
        var pagina = i+1;
        $("#pagination").append('<li class="page-item "><a class="page-link nav-bar-pages" href="#">'+ pagina +'</a></li>');
    }
    $("#pagination").append(pros);     
}


function popolaStorico(page, data){
    let listaAmici = JSON.parse(getCookie("friendList"));
    $.ajax({
        url: 'http://localhost:9090/storico/getColumn/' + page,
        method: 'POST',
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function (risposta) {
            $("#corpoTabella").html("");
            for(var i=0 ;i<risposta.length; i++){
                var ciccia = "";
                var verifica = "";
                var destinatario = "";
                
                if(risposta[i].category.substring(0,8) == "Colletta"){
                    risposta[i].datetime = risposta[i].datetime.substring(0,10) + " " + risposta[i].datetime.substring(11,19);
                }

                if(risposta[i].category == "RECHARGE"){
                    verifica = "Ricarica";
                } else {
                    var isPresent = false;
                    for(var j=0; j<listaAmici.length; j++){
                        // se la transazione è avvenuta con un amico sarà presente il suo nominativo altrimenti verrà visualizzato l'id
                        if(risposta[i].category.substring(risposta[i].category.length-28, risposta[i].category.length) == listaAmici[j].id){
                            destinatario = risposta[i].category.substring(0,risposta[i].category.length-28);
                            destinatario += " " +  listaAmici[j].name + " " + listaAmici[j].surname;
                            isPresent = true;
                            break;
                        }
                    }
                    if(!isPresent)
                    destinatario = risposta[i].category;
                    
                    if(risposta[i].amount < 0){
                        verifica = "Invia";
                    }
                    else{
                        verifica = "Ricevi";
                    }
                }
                
                ciccia += "<tr>";
                ciccia += "<td>" + risposta[i].datetime + "</td>";
                ciccia += "<td>" + risposta[i].amount + "</td>";
                ciccia += "<td>" + destinatario + "</td>";
                ciccia += "<td>" + verifica + "</td>";
                ciccia += "</tr>";
                $("#corpoTabella").append(ciccia);
            }
        },
        error: function (err) {
        }
    });   
}


function precedente(){
    var idUser = getCookie("uid");
    var data = {
        id: idUser
    }    
    if(paginaCorrente > 0){
        paginaCorrente--; 
        popolaStorico(paginaCorrente, data);
    }
}

function prossima(){
    var idUser = getCookie("uid");
    var data = {
        id: idUser
    }
    if(paginaCorrente < numPagine)
        paginaCorrente++;
        popolaStorico(paginaCorrente, data);
}

function popolaGestioneAccount(){
    var idUser = getCookie("uid");
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
let localHost="http://localHost:9090";

if (!isLogged)	{
	window.location.replace(localHost+"/login");
}
