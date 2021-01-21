var paginaCorrente = 0
var numPagine = 0
$(document).ready(function () {
    initStorico()
});


function initStorico() {

    var idUser = 1 //getCookie("uid");
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
    var idUser = 1 //getCookie("uid");
    var data = {
        id: idUser
    }    
    if(paginaCorrente > 0){
        paginaCorrente-- 
        popolaStorico(paginaCorrente, data);
    }
}

function prossima(){
    var idUser = 1 //getCookie("uid");
    var data = {
        id: idUser
    }
    if(paginaCorrente < numPagine)
        paginaCorrente++
        popolaStorico(paginaCorrente, data);
}

