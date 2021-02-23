<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" lang="it">
	<!-- Favicon -->
	<link rel="icon" type="image/png" href="http://localhost:9090/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="http://localhost:9090/favicon-16x16.png" sizes="16x16" />
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<!-- Font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,400;0,700;1,600&display=swap" rel="stylesheet"> 

	<title>PayBall8 Login</title>
	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-app.js"></script>

	<!-- Firebase products -->
	<script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-analytics.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-auth.js"></script>
	
	<!-- Google platform library -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<!-- JQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Css & Js -->
	<link href="<c:url value="/resources/css/Login.css" />" rel="stylesheet">
	<script defer src="<c:url value="/resources/js/Login.js" />"></script>
<%/**--
	<!-- Google button -->
	<meta name="google-signin-client_id" content="39509751218-l96smn1hqqc6glk1gsae4u7ucqpnefo8.apps.googleusercontent.com">
	<script src="https://apis.google.com/js/platform.js" async defer>
--**/%>
</head>
<body>
	<main>
		<h1>Accedi o Registrati a PayBall8</h1>
		<div id="login-div">
			<div id="login-hint">
				<small>Email o Password errati</small>
			</div>
			<form class="form-group" id="login-form">
				<input class="form-control" type="email" id="mail-login-input" placeholder="Email" required>
				<br/>
				<input class="form-control" type="password" id="password-login-input" placeholder="Password" required>
			</form>
			<button type="submit" id="login-button">Accedi</button>
			<p>oppure</p>
			<button type="button" id="toggle-signup">Registrati</button>
			<br/>
			<div id="google-signin">
				<div id="google-button" class="custom-google-button">
					<span class="icon">
						<img src="http://localhost:9090/google_signin_buttons/web/vector/btn_google_dark_normal_ios.svg"  />
					</span>
					<span class="buttonText">Accedi con Google</span>
				</div>
			</div>
			<br/>
			<div class="password-reset">
				<p id="password-reset-button">Hai dimenticato la password?</p>
			</div>
		</div>
		<div id="reset-password-div">
			<form>
				<label class="recovery-response-text" for="recovery-email">Inserisci la mail dell'account di cui vuoi resettare la password</label>
				<br/>
				<div id="email-div">
					<input type="email" class="form-control" id="recovery-email" placeholder="Email">
				</div>
				<div id="recovery-response">
					<label class="recovery-response-text"></label>
				</div>
				<div id="send-recovery-div">
					<button type="submit" id="send-recovery-mail">Invia</button>
				</div>
			</form>
		</div>
		<div id="signup-div">
			<form class="form-group" id="signup-form">
				<label for="name-input">Nome:</label>
				<input class="form-control" type="text" id="name-input" placeholder="Nome" required>
				<label for="surname-input">Cognome:</label>
				<input class="form-control" type="text" id="surname-input" placeholder="Cognome" required>
				<label for="mail-input">Email:</label>
				<input class="form-control" type="email" id="mail-input" placeholder="Email" required>
				<label for="password-input">Password:</label>
				<div id="password-hint">
					<small>La password deve contenere almeno 8 caratteri alfanumerici e almeno una lettera maiuscola</small>
				</div>
				<input class="form-control" type="password" id="password-input" placeholder="Password" required>
				<label for="cf-input">Codice Fiscale:</label>
				<input class="form-control" type="text" id="cf-input" placeholder="Codice Fiscale" required>
				<label for="address-input">Indirizzo:</label>
				<input class="form-control" type="text" id="address-input" placeholder="Indirizzo" required>
				<label for="dob-input">Data di nascita:</label>
				<input class="form-control" type="date" id="dob-input" placeholder="Data di nascita" required>
			</form>
			<button type="submit" id="register-button">Registrati</button>
		</div>
	</main>
	<div id="cookie-pop-up">
		<div id="pop-up-content">
			<h2>Il nostro sito usa alcuni cookie essenziali per fornirti una corretta e sicura esperienza.</h2>
			<p>Nota che non potrai proseguire nell'uso del sito non accettandoli. Per favore, accettane l'utilizzo</p>
			<button type="submit" id="accept-cookies">Accetta</button>
			<button type="button" id="refuse-cookies">Rifiuta</button>
		</div>
	</div>
</body>
</html>