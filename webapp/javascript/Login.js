let toggleSignupButton=document.getElementById("toggle-signup");
let loginButton=document.getElementById("login-button");
let signupButton=document.getElementById("register-button");

toggleSignupButton.addEventListener('click', ()	=>	{
	document.getElementById("mail-login-input").innerHTML
	document.getElementById("login-div").style.display="none";
	document.getElementById("signup-div").style.display="block";
});

signupButton.addEventListener('click', ()	=>	{
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
	}
	if (surnameField.value.length==0)	{
		surnameField.style.borderColor="red";
	}
	if (mailField.value.length==0) {
		mailField.style.borderColor="red";
	}
	if(!passwordFormatCheck(password))	{
		document.getElementById("password-hint").style.display="block";
		passwordField.style.borderColor="red";
	}
	// TODO: cf validation
	if (cfField.value.length==0) {
		cfField.style.borderColor="red";
	}
	if (addressField.value.length==0) {
		addressField.style.borderColor="red";
	}
	if (!validDateOfBirth(dobField.value)) {
		dobField.style.borderColor="red";
	}
});

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