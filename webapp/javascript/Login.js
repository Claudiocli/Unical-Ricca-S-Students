let toggleSignupButton=document.getElementById("toggle-signup");
let loginButton=document.getElementById("login-button");
let signupButton=document.getElementById("register-button");

loginButton.addEventListener('click', ()	=>	{
	let email=document.getElementById("mail-login-input").value;
	let password=document.getElementById("password-login-input").value;

	if (checkLoginInputs())	{
		firebase.auth().signInWithEmailAndPassword(email, password)
		.then((user) => {
			// Signed in 
			// TODO: redirect to main page
		})
		.catch((error) => {
			var errorCode = error.code;
			var errorMessage = error.message;
			window.alert("Error "+errorCode+"\n"+errorMessage); 
		});
	}
});

toggleSignupButton.addEventListener('click', ()	=>	{
	document.getElementById("mail-login-input").innerHTML
	document.getElementById("login-div").style.display="none";
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
	let passwordField=document.getElementById("password-login-input");
	let mailField=document.getElementById("mail-login-input");
	
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
	if (!validDateOfBirth(dobField.value)) {
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