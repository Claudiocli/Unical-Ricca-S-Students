var debug=false;
// Util variables
let toggleSignupButton=document.getElementById("toggle-signup");
let loginButton=document.getElementById("login-button");
let signupButton=document.getElementById("register-button");
// Google sign up 
var provider = new firebase.auth.GoogleAuthProvider();

firebase.auth()
  .signInWithPopup(provider)
  .then((result) => {
    /** @type {firebase.auth.OAuthCredential} */
    var credential = result.credential;

    // This gives you a Google Access Token. You can use it to access the Google API.
    var token = credential.accessToken;
    // The signed-in user info.
    var user = result.user;
    // ...
  }).catch((error) => {
    // Handle Errors here.
    var errorCode = error.code;
    var errorMessage = error.message;
    // The email of the user's account used.
    var email = error.email;
    // The firebase.auth.AuthCredential type that was used.
    var credential = error.credential;
    // ...
  });
// Login function
loginButton.addEventListener('click', ()	=>	{
	let email=document.getElementById("mail-login-input").value;
	let password=document.getElementById("password-login-input").value;
	// Check if inputs are valid
	if (checkLoginInputs())	{
		// Sign in with Firebase
		firebase.auth().signInWithEmailAndPassword(email, password)
		.then((user) => {
			// Signed in
			// Cookie handling
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
// Toggle div for reset password
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
// Variables used for sendig a recovery password mail to the email inserted by user
let sendRecoveryButton=document.getElementById("send-recovery-mail");
var auth = firebase.auth();
var emailAddress = document.getElementById("recovery-email");
let labelResponse=document.getElementById("recovery-response-text");
// Actually function to send email
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
// Toggle div for the creation of a new account
toggleSignupButton.addEventListener('click', ()	=>	{
	// Setting the required attribute for the login input to false
	document.getElementById("mail-login-input").required=false;
	document.getElementById("password-login-input").required=false;
	// Changing wich div is displayed
	document.getElementById("login-div").style.display="none";
	document.getElementById("reset-password-div").style.display="none";
	document.getElementById("signup-div").style.display="block";
});
// Signup button listener
signupButton.addEventListener('click', ()	=>	{
	let email=document.getElementById("mail-input");
	let password=document.getElementById("password-input");
	
	// TODO: register new user in db;
	
	if (checkRegisterInputs())	{
		// Function to create a new account with Firebase
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
			// Sending data to db
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
			// Cookie handling
			// Set a cookie for the new user
			setCookie('uid', user.uid, 7);
			
			// TODO: redirect to main page
		})
		.catch((error) => {
			// Error handling
			var errorCode = error.code;
			var errorMessage = error.message;
			window.alert("Error "+errorCode+"\n"+errorMessage);    
		});
	}
});
// Funcion to check inputs for login
function checkLoginInputs()	{
	// Setting the required attribute for each input that is not an input for the login to false
	document.getElementById("password-input").required=false;
	document.getElementById("name-input").required=false;
	document.getElementById("surname-input").required=false;
	document.getElementById("mail-input").required=false;
	document.getElementById("cf-input").required=false;
	document.getElementById("address-input").required=false;
	document.getElementById("dob-input").required=false;

	let passwordField=document.getElementById("password-login-input");
	let mailField=document.getElementById("mail-login-input");
	// Marking the login's fields as required
	passwordField.required=true;
	mailField.required=true;
	
	// TODO: check with database

	if (false)	{
		return false;
	}
	return true;
}
// Function to check inputs for registration
function checkRegisterInputs()	{
	let returnValue=true;
	// Util variables
	let passwordField=document.getElementById("password-input");
	let password=passwordField.value;

	let nameField=document.getElementById("name-input");
	let surnameField=document.getElementById("surname-input");
	let mailField=document.getElementById("mail-input");
	let cfField=document.getElementById("cf-input");
	let addressField=document.getElementById("address-input");
	let dobField=document.getElementById("dob-input");
	// Setting the required attribute for the signup input to true
	passwordField.required=true;
	nameField.required=true;
	surnameField.required=true;
	mailField.required=true;
	cfField.required=true;
	addressField.required=true;
	dobField.required=true;
	// Check
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
// A function to check if the inserted password is a valid one
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
// A function to check if the inserted date of birth is a valid one
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
// Cookie handling functions
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