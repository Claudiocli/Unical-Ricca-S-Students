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
    document.getElementById("bottoneAnnullaColletta").addEventListener("click", clearDropBox);
    document.getElementById("submitColletta").addEventListener("click", checkBeneficiarioNellaFriendList);
    document.getElementById("bottoneEliminaAccount").addEventListener("click", eliminaAccount);
    document.getElementById("btn-logout").addEventListener("click", logout);
    // L.Russo - listeners creazione JSON per tracciare le operazioni
    var operationTracked = {};
    operationTracked["operation"] = "Home";
    setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);

    document.getElementById("idBeneficiario").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["idBeneficiario"] = document.getElementById("idBeneficiario").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["idBeneficiario"] = document.getElementById("idBeneficiario").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });

    document.getElementById("idQuota").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["idQuota"] = document.getElementById("idQuota").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["idQuota"] = document.getElementById("idQuota").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });

    document.getElementById("idContribuente").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["idContribuente"] = document.getElementById("idContribuente").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["idContribuente"] = document.getElementById("idContribuente").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });

    document.getElementById("ImportoInputLabel").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["ImportoInputLabel"] = document.getElementById("ImportoInputLabel").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["ImportoInputLabel"] = document.getElementById("ImportoInputLabel").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });

    document.getElementById("TagInputLabelTransaction").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["TagInputLabelTransaction"] = document.getElementById("TagInputLabelTransaction").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["TagInputLabelTransaction"] = document.getElementById("TagInputLabelTransaction").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });

    document.getElementById("ImportoInputLabel2").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["ImportoInputLabel2"] = document.getElementById("ImportoInputLabel2").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["ImportoInputLabel2"] = document.getElementById("ImportoInputLabel2").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });

    document.getElementById("panInputLabel").addEventListener("input", () => {
        var operationTracked = JSON.parse(getCookie("lastOperationData"));
        if (operationTracked != null) {
            operationTracked["panInputLabel"] = document.getElementById("panInputLabel").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        } else {
            var operationTracked = {};
            operationTracked["panInputLabel"] = document.getElementById("panInputLabel").value;
            setCookie("lastOperationData", JSON.stringify(operationTracked), 1000 * 60, true);
        }
    });
});

function initSaldo() {

    var idUser = getCookie("uid");

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
                if (new Date().getHours() <= 16 && new Date().getHours() >= 4) {
                    document.getElementById("buongiornissimo").innerHTML = "BUONGIORNO " + risposta.name;
                } else {
                    document.getElementById("buongiornissimo").innerHTML = "BUONASERA " + risposta.name;
                }
                $("#saldo").text(saldo.toFixed(2) + " Euro");
            },
            error: function (err) {
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
    }
}

function inviaTransizione() {
    var idUser = getCookie("uid");
    var importo = document.getElementById("ImportoInputLabel");
    var tag = document.getElementById("TagInputLabelTransaction");
    //importo.required=true;    non riesco a farlo funzionare @RinoPolacchini cerca di aggiustare questi bottoni
    // NON devono poter chiudere la modale se non c'è nessun input
    //tag.required=true;
    var datetime = getDateTime();
    if (idUser && checkInputSendTransaction()) {
        var data = {
            amount: importo.value,
            datetime: datetime,
            category: "Normal",
            sender: idUser,
            recipient: tag.value
        }
        $.ajax({
            url: 'http://localhost:9090/storico/send',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                initSaldo();
            },
            error: function (err) {
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
    } else {
        window.alert("L'operazione non \u00E8 andata a buon fine verifica di aver compilato correttamente i campi.")
    }

    eraseCookie("lastOperationData");
    //importo.required=false;
    //tag.required=false;
}

function checkInputSendTransaction() {
    let returnValue = true;

    let amount = document.getElementById("ImportoInputLabel");
    let tagReciever = document.getElementById("TagInputLabelTransaction");

    if (amount.value <= 0 || amount.value == null) {
        amount.value = "";
        let oldBorder = amount.style.border;
        amount.style.border = "2px solid red";
        amount.placeholder = "Importo non valido";
        setTimeout(() => {
            amount.style.border = oldBorder;
            amount.placeholder = "0.00";
        }, 2500);
        returnValue = false;
    }
    if (tagReciever = "") {
        let oldBorder = tagReciever.style.border;
        tagReciever.style.border = "2px solid red";
        tagReciever.placeholder = "Nessun tag inserito";
        setTimeout(() => {
            tagReciever.style.border = oldBorder;
            tagReciever.placeholder = "";
        }, 2500);
        returnValue = false;
    }
    return returnValue;
}

function ricaricaSaldo() {
    var idUser = getCookie("uid");
    var importo = document.getElementById("ImportoInputLabel2").value;
    var pan = document.getElementById("panInputLabel").value;
    //  @RinoPolacchini stessa cosa qui, come per l'invia denaro
    var datetime = getDateTime();

    if (idUser && checkInputRecharge()) {
        var data = {
            datetime: datetime,
            card: pan,
            account: idUser,
            amount: importo,
        }
        $.ajax({
            url: 'http://localhost:9090/recharge/add',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                initSaldo();
            },
            error: function (err) {
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
    } else {
        window.alert("L'operazione non \u00E8 andata a buon fine verifica di aver compilato correttamente i campi.")
    }
    eraseCookie("lastOperationData");
}

function checkInputRecharge() {
    let returnValue = true;

    let amount = document.getElementById("ImportoInputLabel2");
    let pan = document.getElementById("panInputLabel");

    if (amount.value <= 0 || amount.value == null) {
        amount.value = "";
        let oldBorder = amount.style.border;
        amount.style.border = "2px solid red";
        amount.placeholder = "Importo non valido";
        setTimeout(() => {
            amount.style.border = oldBorder;
            amount.placeholder = "0.00";
        }, 2500);
        returnValue = false;
    } 

    if (pan = "") {
        let oldBorder = pan.style.border;
        let oldPlaceholder = pan.style.placeholder;
        pan.style.border = "2px solid red";
        pan.placeholder = "Nessun PAN inserito";
        setTimeout(() => {
            pan.style.border = oldBorder;
            pan.placeholder = oldPlaceholder;
        }, 2500);
        returnValue = false;
    } 

    return returnValue;
}

function updatePassword() {
    var user = firebase.auth().currentUser;
    
    var newPassword = getASecureRandomPassword();

    user.updatePassword(newPassword).then(function () {
        // Update successful.
    }).catch(function (error) {
        // An error happened.
    });
}

function popolaGestioneAccount() {
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
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
    }
}

function getIdAccount() {
    var idUser = getCookie("uid");
    var img = document.createElement("img");
    img.src = "resources/img/output.jpg";
    img.width = 100;
    img.height = 100;
    img.alt = "QrCode";

    if (idUser) {
        var data = {
            id: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/QrCode',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                $("#corpoGestioneId_Account").html("");
                var ciccia = "";
                ciccia += "<tr>";
                ciccia += "<td>" + "ID" + "</td>";
                ciccia += "<td>" + idUser + "</td>";
                ciccia += "</tr>";
                ciccia += "<tr>";
                ciccia += "<td>" + "QrCode" + "</td>";
                ciccia += "<td>";

                $("#corpoGestioneId_Account").append(ciccia);
                // This next line will just add it to the <body> tag
                $("#corpoGestioneId_Account").append(img);
                ciccia = "";
                ciccia += "</td>";
                ciccia += "</tr>";
            },
            error: function (err) {
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
    }
}

function popolaListaAmici() {
    var idUser = getCookie("uid");
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
                setCookie("friendList", JSON.stringify(risposta), 1, false);
                $("#corpoListaAmici").html("");
                for (var i = 0; i < risposta.length; i++) {
                    var ciccia = "";
                    ciccia += "<tr class=\"row-amico\" id=\"friend-row-" + i + "\">";
                    let name = risposta[i].name + " " + risposta[i].surname;
                    ciccia += "<td class=\"row-info-amico\">" + name + "</td>";
                    ciccia += "</tr>";
                    $("#corpoListaAmici").append(ciccia);
                }
                // Add onClick listener to every row, to be able to display the friend's info
                // Couldn't set'em in the for, because the elements weren't fully loaded into the DOM.
                // Info @Claudiocli
                addListenerToFriendListsRows(risposta);
            },
            error: function (err) {
                window.alert("Abbiamo riscontrato un problema nel caricare la lista degli amici, riporva");
            }
        });
    }
}

function addListenerToFriendListsRows(response) {
    for (let i = 0; i < response.length; i++) {
        document.getElementById("friend-row-" + i).addEventListener("click", () => {
            let name = response[i].name + " " + response[i].surname;
            modalFriendPopup.style.display = "block";
            document.getElementById("friend-id-info").innerHTML = "ID: " + response[i].id;
            document.getElementById("friend-name-info").innerHTML = "Nome: " + name;
        });
    }
}

function aggiungiAmico() {
    var idUser = getCookie("uid");
    var idInputLabel = document.getElementById("tagInputLabelFriendlist");

    if (idUser) {
        var data = {
            datetime: getDateTime(),
            account1: idUser,
            account2: idInputLabel.value,
        }
        $.ajax({
            url: 'http://localhost:9090/friendship/add',
            method: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                idInputLabel.value = "";
                popolaListaAmici()
            },
            error: function (err) {
                // Same method used in various functions. Info @Claudiocli
                // Keep old border settings
                let oldBorder = idInputLabel.style.border;
                // Setting the border settings to resemble an error
                idInputLabel.style.border = "2px solid red";
                // Same thing with the placeholder, to give to the user an error message
                let oldPlaceholder = idInputLabel.placeholder;
                idInputLabel.value = "";
                idInputLabel.placeholder = "ID invalido";
                // After some time (2500ms =>2,5s) return the border and placeholder settings to their originals
                setTimeout(() => {
                    idInputLabel.style.border = oldBorder;
                    idInputLabel.placeholder = oldPlaceholder;
                }, 2500);
            }
        });
    }
}

function cercaAmico() {
    var idUser = getCookie("uid");
    var idInputLabel = document.getElementById("tagInputLabelFriendlist");
    idInputLabel.value = idInputLabel.value.toUpperCase();

    if (idUser) {

        if (idInputLabel.value == "") {
            let oldBorder = idInputLabel.style.border;
            idInputLabel.style.border = "2px solid red";
            let oldPlaceholder = idInputLabel.placeholder;
            idInputLabel.value = "";
            idInputLabel.placeholder = "ID/Nome mancante";
            setTimeout(() => {
                idInputLabel.style.border = oldBorder;
                idInputLabel.placeholder = oldPlaceholder;
            }, 2500);
            popolaListaAmici();
        } else {
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
                        if (idInputLabel.value == risposta[i].name) {
                            $("#corpoListaAmici").html("");
                            var ciccia = "";
                            ciccia += "<tr class=\"row-amico\" id=\"friend-row-" + i + "\">";
                            let name = risposta[i].name + " " + risposta[i].surname;
                            ciccia += "<td class=\"row-info-amico\">" + name + "</td>";
                            ciccia += "</tr>";
                            $("#corpoListaAmici").append(ciccia);
                        }
                    }
                },
                error: function (err) {
                    window.alert("Abbiamo riscontrato un errore, riprova");
                }
            });
        }
    }


}

function logout() {
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
    document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function setCookie(name, value, days, daysIsMillisecond) {
    var expires = "";
    if (daysIsMillisecond) {
        var date = new Date();
        date.setTime(date.getTime() + (days));
        expires = "; expires=" + date.toUTCString();
    }
    else if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// L.Russo - funzione per creare colletta -- datetime dovrebbe essere la data di scadenza della colletta e non la data di creazione --> chiedere info
function createColletta() {
    var idUser = getCookie("uid");
    var datetime = getDateTime();
    var quote = document.getElementById("idQuota").value;
    var beneficiary = document.getElementById("idBeneficiario").value;
    // recupero la lista dei partecipanti alla colletta dal cookie
    var list_id = JSON.parse(getCookie("list_id"));
    // aggiungiamo l'utente che crea la colletta nella lista dei partecipanti
    list_id.push(idUser);

    if (idUser && checkInputColletta()) {
        var data = {
            colletta: {
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
                //Svuota la dropbox dei partecipanti
                $("#dropDownPartecipanti").html("");

                // TODO: success message
            },
            error: function (err) {
                // TODO: error message
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
        eraseCookie("list_id");
    } else {
        window.alert("L'operazione non \u00E8 andata a buon fine verifica di aver compilato correttamente i campi.")
    }
    eraseCookie("lastOperationData");
}

function checkBeneficiarioNellaFriendList() {
    var idUser = getCookie("uid");
    var beneficiario = document.getElementById("idBeneficiario").value;
    var verifica = false;
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
                    if (risposta[i].id == beneficiario)
                        verifica = true
                }

                if (verifica == false)
                    window.alert("Impossibile creare la colletta se non si ha l'amicizia con il beneficiario.");

            },
            error: function (err) {
                window.alert("");
            }
        });
    }
}

function checkInputColletta() {
    let returnValue = true;

    let quote = document.getElementById("idQuota");
    let beneficiary = document.getElementById("idBeneficiario");

    if (quote.value <= 0 || quote.value == null) {
        quote.value = "";
        let oldBorder = quote.style.border;
        quote.style.border = "2px solid red";
        quote.placeholder = "Importo non valido";
        setTimeout(() => {
            quote.style.border = oldBorder;
            quote.placeholder = "0.00";
        }, 2500);
        returnValue = false;
    }
    if (beneficiary = "") {
        let oldBorder = beneficiary.style.border;
        let oldPlaceholder = beneficiary.style.placeholder;
        beneficiary.style.border = "2px solid red";
        beneficiary.placeholder = "Nessun PAN inserito";
        setTimeout(() => {
            beneficiary.style.border = oldBorder;
            beneficiary.placeholder = oldPlaceholder;
        }, 2500);
        returnValue = false;
    }
    return returnValue;
}

// L.Russo - funzione che ad ogni mungiuta del bottone Aggiungi nella modale della colletta aggiunge l'id nel cookie
function addContributor() {
    var list = JSON.parse(getCookie("list_id"));
    if (list != null) {
        list.push(document.getElementById("idContribuente").value);
        addToDropbox(document.getElementById("idContribuente").value);
        setCookie("list_id", JSON.stringify(list), 1, false);
    }
    else {
        var list = [];
        list.push(document.getElementById("idContribuente").value);
        addToDropbox(document.getElementById("idContribuente").value);
        setCookie("list_id", JSON.stringify(list), 1, false);
    }
    document.getElementById("idContribuente").value = "";
}

function clearDropBox() {
    $("#dropDownPartecipanti").html("");
}

function addToDropbox(contribuente) {
    var idUser = contribuente;
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
                var ciccio = risposta.name + "-" + risposta.surname;
                var tizio = "";
                tizio += "<li><a class=\"dropdown-item\" >" + ciccio + "</a></li>";
                console.log(ciccio);
                $("#dropDownPartecipanti").append(tizio);
            },
            error: function (err) {
                window.alert("Abbiamo riscontrato un problema, riporva");
            }
        });
    }
}

function eliminaAccount() {
    var idUser = getCookie("uid")
    if (idUser) {
        var data = {
            id: idUser
        }
        $.ajax({
            url: 'http://localhost:9090/account/delete',
            method: 'DELETE',
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (risposta) {
                alert("Account eliminato con successo.");
                logout();
            },
            error: function (err) {
                alert("ERRORE: Eliminazione non riuscita! Riprovare.");
            }
        });
    }
}

// L.Russo - funzione per calcolare datatime
function getDateTime() {
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
let isLogged = getCookie("uid");
let localHost = "http://localHost:9090";

if (!isLogged) {
    window.location.replace(localHost + "/login");
}

// Friend popup handling
let modalFriendPopup = document.getElementById("friend-info-popup");
let spanCloseFriendPopup = document.getElementsByClassName("friend-popup-close")[0];
spanCloseFriendPopup.onclick = function () {
    modalFriendPopup.style.display = "none";
}
// When the user clicks anywhere outside of the modal, it close itself
window.onclick = function (event) {
    if (event.target == modalFriendPopup) {
        modalFriendPopup.style.display = "none";
    }
    if (event.target == document.getElementById("notification-popup")) {
        document.getElementById("notification-popup").style.display = "none";
    }
}
document.getElementById("delete-friend-button").addEventListener('click', () => {
    if (confirm("Sei sicuro di voler eliminare il tuo amico?")) {
        let idFriend = document.getElementById('friend-id-info').innerHTML;
        idFriend = idFriend.substring(4);
        let data = {
            account1: getCookie('uid'),
            account2: idFriend,
        };
        $.ajax({
            url: "http://localhost:9090/friendship/delete",
            method: 'DELETE',
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function (response) {
                window.alert("Amico eliminato correttamente");
                modalFriendPopup.style.display = "none";
                popolaListaAmici();
            },
            error: function (error) {
                window.alert("Abbiamo riscontrato un errore, riprova");
            }
        });
    }
});
document.getElementById("notifications").addEventListener('click', () => {
    document.getElementById("notification-popup").style.display = "block";
});
document.getElementsByClassName("notification-popup-close")[0].onclick = function () {
    document.getElementById("notification-popup").style.display = "none";
};
document.getElementById("contribuite-to-colletta").addEventListener('click', () => {
    // /contribute/pay expect a String id_payer and a Long id_colletta
    let id_payer = getCookie('uid');
    let id_colletta = document.getElementById("colletta-label-info").value;

    let data = {
        contributor: id_payer,
        colletta: id_colletta,
    };

    if (id_payer && id_colletta) {
        $.ajax({
            url: localHost + "/contribute/pay",
            method: "DELETE",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.alert("Contributo versato correttamente");
                // Button set to "no notification" color
                document.getElementById("notifications").style.backgroundColor = "lightgreen";
            },
            error: function (error) {
                window.alert("Si è verificato un errore");
            }
        });
    }
});
document.getElementById("refuse-colletta-button").addEventListener('click', () => {
    // /contribute/decline expect a String id_payer and a Long id_colletta
    let id_payer = getCookie('uid');
    let id_colletta = document.getElementById("colletta-label-info").value;

    let data = {
        contributor: id_payer,
        colletta: id_colletta,
    };

    if (id_payer && id_colletta) {
        $.ajax({
            url: localHost + "/contribute/decline",
            method: "DELETE",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.alert("L'invito alla colletta è stato declinato");
                // Button set to "no notification" color
                document.getElementById("notifications").style.backgroundColor = "lightgreen";
            },
            error: function (error) {
                window.alert("Si è verificato un errore");
            }
        });
    }
});
document.getElementById("colletta-label-info").addEventListener('change', () => {
    // Button set to "you have notifications" color
    document.getElementById("notifications").style.backgroundColor = "green";
});

function onKeyNumeric(e) {
    // Accetto solo numeri e backspace <- tranne per un e uno solo . 
    if (((e.keyCode >= 48) && (e.keyCode <= 57)) || (e.keyCode == 8)) {
        return true;
    } else {
        return false;
    }
}