<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">

<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="<c:url value=" /resources/css/Carte.css" />"
	rel="stylesheet">
<script src="<c:url value=" /resources/js/Carte.js" />"></script>
<title>Carte</title>

</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<div class="row w-100">
				<div class="col-lg-11 col-md-11">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><svg xmlns="http://www.w3.org/2000/svg"
									width="30" height="30" fill="currentColor"
									class="bi bi-wallet2 icons-navbar-color" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
										d="M12.136.326A1.5 1.5 0 0 1 14 1.78V3h.5A1.5 1.5 0 0 1 16 4.5v9a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 13.5v-9a1.5 1.5 0 0 1 1.432-1.499L12.136.326zM5.562 3H13V1.78a.5.5 0 0 0-.621-.484L5.562 3zM1.5 4a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-13z" />
                                    </svg></li>
							<li class="nav-item"><a id="riepilogo"
								class="nav-link nav-link-color"
								href="http://localhost:9090/home">Riepilogo</a></li>
							<li class="nav-item"><a id="carte"
								class="nav-link nav-link-color"
								href="http://localhost:9090/card">Carte</a></li>
							<li class="nav-item"><a id="storico"
								class="nav-link nav-link-color"
								href="http://localhost:9090/storico">Storico</a></li>
							<li class="nav-item"><a id="aiuto"
								class="nav-link nav-link-color"
								href="http://localhost:9090/aiuto">Aiuto</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-1 col-md-1">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item">
								<button type="button" class="btn esci-font"
									id="bottoneGestioneAccount" data-bs-toggle="modal"
									data-bs-target="#exampleModal2">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-gear icons-navbar-color"
										viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
											d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
                                            <path fill-rule="evenodd"
											d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
                                        </svg>
								</button>
								<div class="modal fade" id="exampleModal2" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Gestione
													Account</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<table
													class="table memberListColor table-striped table-hover">
													<tbody id="corpoGestioneAccount">
														<tr>
															<div class="modal fade" id="exampleModal3" tabindex="-1"
																aria-labelledby="exampleModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">
																				Password</h5>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close"></button>
																		</div>
																		<div class="modal-body">
																			<form>
																				<div class="mb-3">
																					<label for="exampleInputEmail1" class="form-label">Vecchia
																						Password</label> <input type="email" class="form-control"
																						id="exampleInputEmail1"
																						aria-describedby="emailHelp">
																					<div id="emailHelp" class="form-text">Noi non
																						condividiamo i tuoi dati sensibili con nessuno.</div>
																				</div>
																				<div class="mb-3">
																					<label for="exampleInputPassword1"
																						class="form-label">Nuova Password</label> <input
																						type="password" class="form-control"
																						id="exampleInputPassword1">
																				</div>
																				<div class="mb-3">
																					<label for="exampleInputPassword1"
																						class="form-label">Conferma Password</label> <input
																						type="password" class="form-control"
																						id="exampleInputPassword1">
																				</div>
																			</form>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-bs-dismiss="modal">Chiudi</button>
																			<button type="button"
																				class="btn chiudi-gestioneAccount">Applica</button>
																		</div>
																	</div>
																</div>
															</div>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn chiudi-gestioneAccount"
													data-bs-dismiss="modal">Chiudi</button>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="nav-item">
								<button type="button" class="btn esci-font"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									Esci</button>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Esci</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">Stai uscendo dal tuo account,
												continuare ?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Chiudi</button>
												<button type="button" id="btn-logout" class="btn esci-font">Si</button>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Center section -->
	<div class="banner banner-color">
		<div class="row h-100">
			<div class="col-lg-2 col-md-2 h-100"></div>
			<div class="col-lg-8 col-md-8 h-100">
				<div class="row h-100">
					<div class="col-lg-4 col-md-4 h-100">
						<h3 class="margin-top-elenco-carte">Elenco Carte</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Scadenza</th>
									<th>Numero</th>
								</tr>
							</thead>
							<tbody id="corpoTabellaCarte">

							</tbody>
						</table>
					</div>
					<div class="col-lg-8 col-md-8 h-100 elenco-carte-font text-center">
						<div>
							<ul class="list-inline mb-2 list-font">
								<li class="list-inline-item">
									<h3>Aggiungi Carta</h3>
								</li>
								<li>
									<div id="aggiungiCarta">
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
											fill="currentColor" class="bi bi-plus-circle-dotted"
											viewBox="0 0 16 16">
                                                <path
												d="M8 0c-.176 0-.35.006-.523.017l.064.998a7.117 7.117 0 0 1 .918 0l.064-.998A8.113 8.113 0 0 0 8 0zM6.44.152c-.346.069-.684.16-1.012.27l.321.948c.287-.098.582-.177.884-.237L6.44.153zm4.132.271a7.946 7.946 0 0 0-1.011-.27l-.194.98c.302.06.597.14.884.237l.321-.947zm1.873.925a8 8 0 0 0-.906-.524l-.443.896c.275.136.54.29.793.459l.556-.831zM4.46.824c-.314.155-.616.33-.905.524l.556.83a7.07 7.07 0 0 1 .793-.458L4.46.824zM2.725 1.985c-.262.23-.51.478-.74.74l.752.66c.202-.23.418-.446.648-.648l-.66-.752zm11.29.74a8.058 8.058 0 0 0-.74-.74l-.66.752c.23.202.447.418.648.648l.752-.66zm1.161 1.735a7.98 7.98 0 0 0-.524-.905l-.83.556c.169.253.322.518.458.793l.896-.443zM1.348 3.555c-.194.289-.37.591-.524.906l.896.443c.136-.275.29-.54.459-.793l-.831-.556zM.423 5.428a7.945 7.945 0 0 0-.27 1.011l.98.194c.06-.302.14-.597.237-.884l-.947-.321zM15.848 6.44a7.943 7.943 0 0 0-.27-1.012l-.948.321c.098.287.177.582.237.884l.98-.194zM.017 7.477a8.113 8.113 0 0 0 0 1.046l.998-.064a7.117 7.117 0 0 1 0-.918l-.998-.064zM16 8a8.1 8.1 0 0 0-.017-.523l-.998.064a7.11 7.11 0 0 1 0 .918l.998.064A8.1 8.1 0 0 0 16 8zM.152 9.56c.069.346.16.684.27 1.012l.948-.321a6.944 6.944 0 0 1-.237-.884l-.98.194zm15.425 1.012c.112-.328.202-.666.27-1.011l-.98-.194c-.06.302-.14.597-.237.884l.947.321zM.824 11.54a8 8 0 0 0 .524.905l.83-.556a6.999 6.999 0 0 1-.458-.793l-.896.443zm13.828.905c.194-.289.37-.591.524-.906l-.896-.443c-.136.275-.29.54-.459.793l.831.556zm-12.667.83c.23.262.478.51.74.74l.66-.752a7.047 7.047 0 0 1-.648-.648l-.752.66zm11.29.74c.262-.23.51-.478.74-.74l-.752-.66c-.201.23-.418.447-.648.648l.66.752zm-1.735 1.161c.314-.155.616-.33.905-.524l-.556-.83a7.07 7.07 0 0 1-.793.458l.443.896zm-7.985-.524c.289.194.591.37.906.524l.443-.896a6.998 6.998 0 0 1-.793-.459l-.556.831zm1.873.925c.328.112.666.202 1.011.27l.194-.98a6.953 6.953 0 0 1-.884-.237l-.321.947zm4.132.271a7.944 7.944 0 0 0 1.012-.27l-.321-.948a6.954 6.954 0 0 1-.884.237l.194.98zm-2.083.135a8.1 8.1 0 0 0 1.046 0l-.064-.998a7.11 7.11 0 0 1-.918 0l-.064.998zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                                            </svg>
									</div>
								</li>
								<li id="form" hidden>
									<form class="font-form">
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Intestatario
												della carta</label> <input type="text" class="form-control "
												id="idIntestatario" placeholder="Mario Rossi"
												aria-describedby="emailHelp" required>
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Numero
												Carta</label> <input type="text" class="form-control "
												id="idNumeroCarta"
												placeholder="XXXXX-XXXXX-XXXXX-XXXXX"
												aria-describedby="emailHelp" required>
											<div id="emailHelp" class="form-text">Noi non
												condividiamo con nessuno la tua mail...</div>
										</div>
										<ul class="list-inline-item scadenza-cvc-padding">
											<li class="list-inline-item">
												<div class="mb-3">
													<label for="exampleInputPassword1" class="form-label">Scadenza</label>
													<ul class="list-inline mb-2">
														<li class="list-inline-item scadenza-width"><input
															type="number" class="form-control" placeholder="mm"
															id="mese" required></li>
														<li class="list-inline-item scadenza-width"><input
															type="number" class="form-control" placeholder="aa"
															id="anno" required></li>
													</ul>
												</div>
											</li>
											<li class="list-inline-item cvc-padding">
												<div class="mb-3">
													<label for="exampleInputPassword1" class="form-label">CVC</label>
													<ul class="list-inline mb-2">
														<li class="list-inline-item cvc-width"><input
															type="password" class="form-control" placeholder="***"
															id="cvc" required></li>
													</ul>
												</div>
											</li>
										</ul>
										<div class="mb-3 form-check">
											<input type="checkbox" class="form-check-input"
												id="exampleCheck1" required> <label class="form-check-label"
												for="exampleCheck1">Accetto i termini d'uso</label>
										</div>
										<button type="submit" class="btn submit-font" id="bottoneAggiungiCarta">Submit</button>
									</form>
								</li>
								<hr class="vx_hr-alt fiDetails-hr">
								<li class="list-inline-item">
									<p class="vx_text-body-sm">Usa il tuo saldo per fare
										acquisti e inviare denaro.</p>
								</li>
								<li class="list-inline-item">
									<div class="fiChoice-container">
										<hr class="vx_hr-alt fiDetails-hr">
										<div class="vx_text-6 fiChoice-info">
											Il saldo disponibile verra' usato quando fai acquisti online
											o invii denaro.
											<div>Se non hai denaro sufficiente sul tuo saldo, ti
												chiederemo di scegliere un altro metodo di pagamento al
												momento del pagamento.</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 h-100"></div>
		</div>
	</div>
	<!-- Bottom section -->
	<section class="advertise-section text-center text-white">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-emoji-wink-fill"
							viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
								d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zM4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zm5.152-3.31a.5.5 0 0 0-.874.486c.33.595.958 1.007 1.687 1.007.73 0 1.356-.412 1.687-1.007a.5.5 0 0 0-.874-.486.934.934 0 0 1-.813.493.934.934 0 0 1-.813-.493z" />
                            </svg>
						<h3>Facile</h3>
						<p class="lead mb-0 text-bold">Per utonti provetti che
							vogliono entrare nel mondo smart.</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-bar-chart-line-fill"
							viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
								d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2z" />
                            </svg>
						<h3>Veloce</h3>
						<p class="lead mb-0 text-bold">Certificato come conto virtuale
							piu' rapido in Europa.</p>
					</div>
				</div>
				<div class="col-lg-4 ">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-award-fill" viewBox="0 0 16 16">
                                <path
								d="M8 0l1.669.864 1.858.282.842 1.68 1.337 1.32L13.4 6l.306 1.854-1.337 1.32-.842 1.68-1.858.282L8 12l-1.669-.864-1.858-.282-.842-1.68-1.337-1.32L2.6 6l-.306-1.854 1.337-1.32.842-1.68L6.331.864 8 0z" />
                                <path
								d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
                            </svg>
						<h3>Sicuro</h3>
						<p class="lead mb-0 text-bold">Eccetto noi della PayBall8
							S.P.A. nessuno puo' accedere ai vostri dati sensibili ;-) .</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer section -->
	<footer class="footer text-white">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a class="text-white" href="#">About</a></li>
						<li class="list-inline-item"><a class="text-white" href="#">Contact</a></li>
						<li class="list-inline-item"><a class="text-white" href="#">Term
								of Use</a></li>
						<li class="list-inline-item"><a class="text-white" href="#">Privacy
								Policy</a></li>
					</ul>
					<p class="text-white small mb-4 mb-lg-0">
						@ Your Website
						<script>
							document.write(new Date().getFullYear());
						</script>
						. All Rights Reserved.
					</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor"
									class="bi bi-credit-card-2-back-fill icons-navbar-color"
									viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
										d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5H0V4zm11.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2z" />
                                        <path
										d="M0 11v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1H0z" />
                                    </svg>
						</a></li>
						<li class="list-inline-item mr-3"><a href="#"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-building icons-navbar-color"
									viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
										d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                                        <path
										d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                                    </svg>
						</a></li>
						<li class="list-inline-item"><a href="#"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor"
									class="bi bi-briefcase-fill icons-navbar-color"
									viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
										d="M0 12.5A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5V6.85L8.129 8.947a.5.5 0 0 1-.258 0L0 6.85v5.65z" />
                                        <path fill-rule="evenodd"
										d="M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5v1.384l-7.614 2.03a1.5 1.5 0 0 1-.772 0L0 5.884V4.5zm5-2A1.5 1.5 0 0 1 6.5 1h3A1.5 1.5 0 0 1 11 2.5V3h-1v-.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5V3H5v-.5z" />
                                    </svg>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
-->
</body>

</html>
