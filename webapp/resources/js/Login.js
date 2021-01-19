var debug=false;

let toggleSignupButton=document.getElementById("toggle-signup");
let loginButton=document.getElementById("login-button");
let signupButton=document.getElementById("register-button");

var provider = new firebase.auth.GoogleAuthProvider();

var googleUser = {};
var auth2;
var startApp = function() {
	gapi.load('auth2', function(){
		// Retrieve the singleton for the GoogleAuth library and set up the client.
		auth2 = gapi.auth2.init({
			client_id: 'YOUR_CLIENT_ID.apps.googleusercontent.com',
			cookiepolicy: 'single_host_origin',
			// Request scopes in addition to 'profile' and 'email'
			//scope: 'additional_scope'
		});
		attachSignin(document.getElementById('customBtn'));
	});
};

	function attachSignin(element) {
		auth2.attachClickHandler(element, {},
		function(googleUser) {
			// Success
			document.getElementById('name').innerText = "Signed in: " +
			googleUser.getBasicProfile().getName();
		}, function(error) {
		// Error logging in
		alert(JSON.stringify(error, undefined, 2));
	});
}

loginButton.addEventListener('click', ()	=>	{
	let email=document.getElementById("mail-login-input").value;
	let password=document.getElementById("password-login-input").value;

	if (checkLoginInputs())	{
		firebase.auth().signInWithEmailAndPassword(email, password)
		.then((user) => {
			// Signed in
			let c=getCookie('uid');
			if (c)	{
				// TODO: handle with existing cookie
				// TODO: handle redirecting without the needs to do a login
			}
			else	{
				// TODO: handle with no cookie
				// Setting a cookie for the user with expiration date by a week
				setCookie('uid', user.uid, 7);
			}
			// TODO: redirect to main page
		})
		.catch((error) => {
			var errorCode = error.code;
			var errorMessage = error.message;
			window.alert("Error "+errorCode+"\n"+errorMessage); 
		});
	}
});

let toggleResetPasswordForm=document.getElementById("password-reset-button");
toggleResetPasswordForm.addEventListener('click', () =>	{
	document.getElementById("mail-login-input").required=false;
	document.getElementById("password-login-input").required=false;
	
	document.getElementById("password-input").required=false;
	document.getElementById("name-input").required=false;
	document.getElementById("surname-input").required=false;
	document.getElementById("mail-input").required=false;
	document.getElementById("cf-input").required=false;
	document.getElementById("address-input").required=false;
	document.getElementById("dob-input").required=false;

	document.getElementById("login-div").style.display="none";
	document.getElementById("reset-password-div").style.display="block";
	document.getElementById("signup-div").style.display="none";
});

let sendRecoveryButton=document.getElementById("send-recovery-mail");
var auth = firebase.auth();
var emailAddress = document.getElementById("recovery-email");
let labelResponse=document.getElementById("recovery-response-text");

sendRecoveryButton.addEventListener('click', () =>	{
	auth.sendPasswordResetEmail(emailAddress).then(function() {
		// Email sent.
		// Let the label's borders became green and display a success message
		labelResponse.style.border="3px solid #43c23c";
		labelResponse.style.borderRadius="25px";
		labelResponse.innerHTML="Il link di reset password è stato mandato alla tua mail";
		labelResponse.style.display="block";
	}).catch(function(error) {
		// An error happened.
		// Let the label's borders became red and display an error message
		labelResponse.style.border="3px solid #c23c3c";
		labelResponse.style.borderRadius="25px";
		labelResponse.innerHTML="Si è verificato un errore, riprova";
		if (debug)	{
			labelResponse.innerHTML+="\nError Code: "+error.errorCode+"\nError message: "+error.errorMessage;
		}
		labelResponse.style.display="block";
	});
});

toggleSignupButton.addEventListener('click', ()	=>	{
	document.getElementById("mail-login-input").required=false;
	document.getElementById("password-login-input").required=false;

	document.getElementById("login-div").style.display="none";
	document.getElementById("reset-password-div").style.display="none";
	document.getElementById("signup-div").style.display="block";
});

signupButton.addEventListener('click', ()	=>	{
	let email=document.getElementById("mail-input");
	let password=document.getElementById("password-input");
	
	// TODO: register new user in db;
	
	if (checkRegisterInputs())	{
		firebase.auth().createUserWithEmailAndPassword(email,
		 password).then((user) => {
			// Signed in 
			let name=document.getElementById("name-input").value;
			let surname=document.getElementById("surname-input").value;
			let cf=document.getElementById("cf-input").value;
			let address=document.getElementById("address-input").value;
			let dob=document.getElementById("dob-input").value;
			let json={
				"email": email,
				"id": user.uid,
			      "name": name,
			      "surname": surname,
			      "cf": cf,
			      "address": address,
			      "dob": dob,
			      "balance": "0"
			}
			$.ajax({
				type: "POST",
			      contentType: "application/json",
			      url: "/account/add",
			      data: json,
			      dataType: 'json',
			      cache: false,
			      timeout: 600000,
				success: function (data) {
					var json = "<h4>Ajax Response</h4>&lt;pre&gt;"
						+ JSON.stringify(data, null, 4) + "&lt;/pre&gt;";
					$('#feedback').html(json);
					console.log("SUCCESS : ", data);
					$("#btn-search").prop("disabled", false);
			        },
			      error: function (e) {
					var json = "<h4>Ajax Response</h4>&lt;pre&gt;"
						+ e.responseText + "&lt;/pre&gt;";
					$('#feedback').html(json);
					console.log("ERROR : ", e);
					$("#btn-search").prop("disabled", false);
			        }
			});
			
			// Set a cookie for the new user
			setCookie('uid', user.uid, 7);
			
			// TODO: redirect to main page
		})
		.catch((error) => {
			var errorCode = error.code;
			var errorMessage = error.message;
			window.alert("Error "+errorCode+"\n"+errorMessage);    
		});
	}
});

function checkLoginInputs()	{
	document.getElementById("password-input").required=false;
	document.getElementById("name-input").required=false;
	document.getElementById("surname-input").required=false;
	document.getElementById("mail-input").required=false;
	document.getElementById("cf-input").required=false;
	document.getElementById("address-input").required=false;
	document.getElementById("dob-input").required=false;

	let passwordField=document.getElementById("password-login-input");
	let mailField=document.getElementById("mail-login-input");

	passwordField.required=true;
	mailField.required=true;
	
	// TODO: check with database
	if (false)	{
		return false;
	}
	return true;
}

function checkRegisterInputs()	{
	let returnValue=true;
	
	let passwordField=document.getElementById("password-input");
	let password=passwordField.value;

	let nameField=document.getElementById("name-input");
	let surnameField=document.getElementById("surname-input");
	let mailField=document.getElementById("mail-input");
	let cfField=document.getElementById("cf-input");
	let addressField=document.getElementById("address-input");
	let dobField=document.getElementById("dob-input");

	passwordField.required=true;
	nameField.required=true;
	surnameField.required=true;
	mailField.required=true;
	cfField.required=true;
	addressField.required=true;
	dobField.required=true;

	if (nameField.value.length==0)	{
		nameField.style.borderColor="red";
		returnValue=false;
	}
	if (surnameField.value.length==0)	{
		surnameField.style.borderColor="red";
		returnValue=false;
	}
	if (mailField.value.length==0) {
		mailField.style.borderColor="red";
		returnValue=false;
	}
	if(!passwordFormatCheck(password))	{
		document.getElementById("password-hint").style.display="block";
		passwordField.style.borderColor="red";
		returnValue=false;
	}
	// TODO: cf validation
	if (cfField.value.length==0) {
		cfField.style.borderColor="red";
		returnValue=false;
	}
	if (addressField.value.length==0) {
		addressField.style.borderColor="red";
		returnValue=false;
	}
	if (!validDateOfBirth(dobField.value) || dobField.value.length==0) {
		dobField.style.borderColor="red";
		returnValue=false;
	}
	return returnValue;
}

function passwordFormatCheck(password)	{
	let patternMaius="[A-Z]+";

	let regexMaius=new RegExp(patternMaius);

	let result=true;
	if (regexMaius.exec(password)==null)	{
		result=false;
	}
	if (password.length<8)	{
		result=false;
	}
	return result;
}

function validDateOfBirth(dob)	{
	let birth=new Date(dob);
	let today=new Date();
	if (today.getFullYear()-birth.getFullYear()<18)	{
		return false;
	}
	else if (today.getFullYear()-birth.getFullYear()==18 && today.getMonth()<birth.getMonth())	{
		return false;
	}
	else if (today.getFullYear()-birth.getFullYear()==18 && today.getMonth()<birth.getMonth() && today.getDay()<birth.getDay())	{
		return false;
	}
	return true;
}
// Non l'ho copiato da SO, giuro
function setCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
function eraseCookie(name) {   
    document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}