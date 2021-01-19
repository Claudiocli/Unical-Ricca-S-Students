<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" lang="it">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<!-- Font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,400;0,700;1,600&display=swap" rel="stylesheet"> 

	<title>PayBall8 Login</title>
	<!-- Css & Js -->
	<link href="<c:url value="/resources/css/Login.css" />" rel="stylesheet">
	<script defer src="<c:url value="/resources/js/Login.js" />"></script>
	<!-- Google platform library -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
	<main>
		<h1>Accedi o Registrati a PayBall8</h1>
		<div id="login-div">
			<form class="form-group" id="login-form">
				<input class="form-control" type="email" id="mail-login-input" placeholder="Email" required>
				<br/>
				<input class="form-control" type="password" id="password-login-input" placeholder="Password" required>
			</form>
			<button type="submit" id="login-button">Accedi</button>
			<p>oppure</p>
			<button type="button" id="toggle-signup">Registrati</button>

			<p>oppure</p>
			<div id="google-signin">
				<div id="google-button" class="custom-google-button">
					<span class="icon"></span>
					<span class="buttonText">Accedi con Google</span>
				</div>
			</div>
			<br/>
			<div class="password-reset">
				<button type="button" id="password-reset-button">Hai dimenticato la password?</button>
			</div>
		</div>
		<div id="reset-password-div">
			<form>
				<label for="recovery-email">Inserisci la mail dell'account di cui vuoi resettare la password</label>
				<input type="email" id="recovery-email" placeholder="Email">
				<div id="recovery-response">
					<label id="recovery-response-text"></label>
				</div>
				<button type="submit" id="send-recovery-mail">Invia</button>
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
  <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
  <script src="/__/firebase/8.2.1/firebase-app.js"></script>
  
  <script src="/__/firebase/8.2.1/firebase-analytics.js"></script>
  <script src="/__/firebase/8.2.1/firebase-auth.js"></script>

</body>
</html>