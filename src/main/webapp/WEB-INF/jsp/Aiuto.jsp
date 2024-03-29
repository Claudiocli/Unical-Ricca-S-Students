<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="it">

    <head>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="http://localhost:9090/favicon-32x32.png" sizes="32x32" />
        <link rel="icon" type="image/png" href="http://localhost:9090/favicon-16x16.png" sizes="16x16" />

        <!-- The core Firebase JS SDK is always required and must be listed first -->
        <script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-app.js"></script>

        <!-- Firebase products -->
        <script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-analytics.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.2.3/firebase-auth.js"></script>
        
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="<c:url value=" /resources/css/Aiuto.css" />" rel="stylesheet">
        <script src="<c:url value=" /resources/js/Aiuto.js" />"></script>

        <title>Aiuto</title>
    </head>

    <body>
        <!--Navbar-->
        <nav class="navbar navbar-expand-lg">
			<div class="container">
				<div class="row w-100">
					<div class="col-lg-11 col-md-11">
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><img class="logo-font"
										src="../../resources/img/LOGO PAY8BALL_LOGO ORIZZONTALE.png" alt="logo"></li>
								<li class="nav-item"><a id="riepilogo" class="nav-link nav-link-color"
										href="http://localhost:9090/home">Riepilogo</a></li>
								<li class="nav-item"><a id="carte" class="nav-link nav-link-color"
										href="http://localhost:9090/card">Carte</a></li>
								<li class="nav-item"><a id="storico" class="nav-link nav-link-color"
										href="http://localhost:9090/storico">Storico</a></li>
								<li class="nav-item"><a id="aiuto" class="nav-link nav-link-color"
										href="http://localhost:9090/aiuto">Aiuto</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-1 col-md-1">
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item">
									<button type="button" class="btn esci-font" id="bottoneGestioneAccount"
										data-bs-toggle="modal" data-bs-target="#settings">
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
											fill="currentColor" class="bi bi-gear icons-navbar-color"
											viewBox="0 0 16 16">
											<path fill-rule="evenodd"
												d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
											<path fill-rule="evenodd"
												d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
										</svg>
									</button>
									<div class="modal fade" id="settings" tabindex="-1"
										aria-labelledby="settingsModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="settingsModalLabel">Gestione
														Account</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<table class="table memberListColor table-striped table-hover">
														<thead>
															<tr>
																<td>Password</td>
																<td>********</td>
																<td>
																	<button id="rigaPassword" data-bs-toggle="modal"
																		data-bs-target="#changePassword" type="button"
																		class="btn chiudi-gestioneAccount">Modifica</button>
																</td>
															</tr>
															<div class="modal fade" id="changePassword" tabindex="-1"
																aria-labelledby="changePasswordModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title"
																				id="changePasswordModalLabel">
																				Cambia Password</h5>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal"
																				aria-label="Close"></button>
																		</div>
																		<div class="modal-body">
																			<form>
																				<div class="mb-3">
																					<label for="inputEmail1"
																						class="form-label">Vecchia
																						Password</label> <input
																						type="email"
																						class="form-control"
																						id="inputEmail1"
																						aria-describedby="emailHelp">
																					<div id="emailHelp"
																						class="form-text">Noi non
																						condividiamo i tuoi dati
																						sensibili con nessuno.</div>
																				</div>
																				<div class="mb-3">
																					<label for="inputPassword0"
																						class="form-label">Nuova
																						Password</label> <input
																						type="password"
																						class="form-control"
																						id="inputPassword0">
																				</div>
																				<div class="mb-3">
																					<label for="inputConfirmPassword"
																						class="form-label">Conferma
																						Password</label> <input
																						type="password"
																						class="form-control"
																						id="inputConfirmPassword">
																				</div>
																			</form>
																		</div>
																		<div class="modal-footer">
																			<button type="button"
																				class="btn btn-secondary"
																				data-bs-dismiss="modal">Chiudi</button>
																			<button type="button"
																				class="btn chiudi-gestioneAccount">Applica</button>
																		</div>
																	</div>
																</div>
															</div>
														</thead>
														<tbody id="corpoGestioneAccount">
															<tr>

															</tr>
														</tbody>
													</table>
												</div>
												<div class="modal-footer">
													<ul class="list-inline mb-2 list-font">
														<li class="list-inline-item">
															<button type="button" class="btn chiudi-gestioneAccount"
																data-bs-dismiss="modal">Chiudi</button>
														</li>
														<li class="list-inline-item">
															<button id="bottoneEliminaAccount" type="button"
																class="btn chiudi-gestioneAccount">Elimina
																Account</button>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</li>
								<li class="nav-item">
									<button type="button" class="btn esci-font" data-bs-toggle="modal"
										data-bs-target="#logoutModal">
										Esci</button>
									<div class="modal fade" id="logoutModal" tabindex="-1"
										aria-labelledby="logoutModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="logoutModalLabel">Esci</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">Stai uscendo dal tuo account,
													continuare ?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Chiudi</button>
													<button type="button" id="btn-logout"
														class="btn esci-font">S&igrave;</button>
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

        <!--Center Section-->
        <div class="container-fluid banner banner-color">
            <div class="row h-100">
                <div class="col-lg-2 col-md-2 col-sm-2 h-100"></div>
                <div class="col-lg-8 col-md-8 col-sm-8 h-100">
                    <h2 class="faq-padding">Domande Frequenti.</h2>
                    <div class="accordion-padding" id="accordion">
                        <div class="card">
                            <div class="card-header collapse-font" id="headingTwo">
                                <h5 class="mb-0">
                                    <a href="#collapseOne" data-toggle="collapse" id="collapseOneButton"
                                        class="btn btn-link collapsed collapse-button-font" aria-expanded="true"
                                        aria-controls="collapseOne">
                                        Come faccio a ricaricare il mio conto PayBall8 dal mio conto bancario?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                                data-parent="#accordion">
                                <div class="card-body collapse-button-font collapse-body-font">
                                    Puoi ricaricare il tuo saldo PayBall8 tramite un conto corrente di cui sei titolare,
                                    registrato nello stesso Paese del conto PayBall8. Verifica di averlo collegato al
                                    tuo
                                    conto PayBall8.<br>

                                    Ecco come puoi fare per ricaricare il tuo conto PayPal dal tuo conto bancario:<br>

                                    1) Accedi alle tue "Carte" e clicca "Trasferisci denaro".<br>
                                    2) Clicca "Ricarica il tuo saldo" e segui le istruzioni.<br>
                                    3) Verr&agrave; generato un codice IBAN virtuale, che userai per effettuare il
                                    bonifico
                                    bancario.
                                    Tale IBAN identifica in modo univoco il tuo trasferimento a PayBall8.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header collapse-font" id="headingTwo">
                                <h5 class="mb-0">
                                    <a href="#collapseTwo" data-toggle="collapse" id="collapseTwoButton"
                                        class="btn btn-link collapsed collapse-button-font" aria-expanded="true"
                                        aria-controls="collapseTwo">
                                        Cosa devo fare se ho un problema con il mio acquisto PayBall8?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                data-parent="#accordion">
                                <div class="card-body collapse-button-font collapse-body-font">
                                    In caso di dubbi sul tuo acquisto, ti consigliamo innanzitutto di contattare
                                    direttamente il venditore. Spesso questo &eacute; il modo pi&ugrave; semplice e
                                    rapido per
                                    chiarire un
                                    equivoco e risolvere un piccolo problema.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header collapse-font" id="headingTwo">
                                <h5 class="mb-0">
                                    <a href="#collapseThree" data-toggle="collapse" id="collapseThreeButton"
                                        class="btn btn-link collapsed collapse-button-font" aria-expanded="true"
                                        aria-controls="collapseThree">
                                        Perch&eacute; il mio pagamento &egrave; bloccato e quando sar&agrave;
                                        disponibile?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                data-parent="#accordion">
                                <div class="card-body collapse-button-font collapse-body-font">
                                    Ecco alcuni dei motivi pi&ugrave; comuni per cui un pagamento potrebbe essere
                                    temporaneamente
                                    non disponibile:<br>

                                    1) &Eacute; necessario del tempo per creare una valida cronologia di transazioni.
                                    Non hai svolto attivit&agrave; di vendita di recente. I conti precedentemente
                                    inattivi
                                    possono
                                    essere soggetti a blocchi dei pagamenti mentre viene ricreata una cronologia di
                                    vendita
                                    positiva.<br>

                                    2) Ricevi un numero elevato di rimborsi, contestazioni o chargeback. Ti consigliamo
                                    di
                                    comunicare spesso con i clienti e di collaborare con loro per risolvere eventuali
                                    problemi. Se il cliente ha presentato una contestazione o una richiesta di
                                    chargeback
                                    perch&eacute; qualcun altro ha usato illecitamente il suo conto PayBall8 per
                                    effettuare una
                                    transazione, non spedire nessun articolo.<br>

                                    3) L'andamento delle vendite &eacute; cambiato. Ad esempio, potrebbe essersi
                                    verificato un
                                    aumento
                                    insolito delle transazioni, un cambiamento del prezzo medio di vendita, il ricorso a
                                    una
                                    nuova piattaforma commerciale.<br>

                                    4) La transazione include articoli a rischio elevato, tra cui biglietti, carte
                                    regalo,
                                    elettronica di consumo, computer e pacchetti di viaggio.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header collapse-font" id="headingThree">
                                <h5 class="mb-0">
                                    <a href="#collapseFour" data-toggle="collapse" id="collapseFourButton"
                                        class="btn btn-link collapsed collapse-button-font" aria-expanded="true"
                                        aria-controls="collapseFour">
                                        Posso annullare un pagamento?
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour"
                                data-parent="#accordion">
                                <div class="card-body collapse-button-font collapse-body-font">
                                    Puoi annullare solo i pagamenti non riscossi accanto ai quali &eacute; presente il
                                    link
                                    "Annulla".<br>

                                    Per annullare un pagamento non riscosso dall'app PayBall8, tocca il pagamento che
                                    desideri
                                    annullare e seleziona "Annulla pagamento".<br>

                                    Per annullare un pagamento non riscosso dal computer:
                                    <br>
                                    1) Vai nello Storico e individua il pagamento.<br>
                                    2) Clicca "Annulla" accanto alla transazione.<br>
                                    3) Conferma la richiesta.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 h-100"></div>
            </div>
        </div>

        <!-- Bottom section -->
        <section class="advertise-section text-center text-white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                class="bi bi-emoji-wink-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zM4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zm5.152-3.31a.5.5 0 0 0-.874.486c.33.595.958 1.007 1.687 1.007.73 0 1.356-.412 1.687-1.007a.5.5 0 0 0-.874-.486.934.934 0 0 1-.813.493.934.934 0 0 1-.813-.493z" />
                            </svg>
                            <h3>Facile</h3>
                            <p class="lead mb-0 text-bold"> Per utonti provetti che vogliono entrare nel mondo
                                smart.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                class="bi bi-bar-chart-line-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2z" />
                            </svg>
                            <h3>Veloce</h3>
                            <p class="lead mb-0 text-bold"> Certificato come conto virtuale pi&ugrave; rapido in Europa.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 ">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                class="bi bi-award-fill" viewBox="0 0 16 16">
                                <path
                                    d="M8 0l1.669.864 1.858.282.842 1.68 1.337 1.32L13.4 6l.306 1.854-1.337 1.32-.842 1.68-1.858.282L8 12l-1.669-.864-1.858-.282-.842-1.68-1.337-1.32L2.6 6l-.306-1.854 1.337-1.32.842-1.68L6.331.864 8 0z" />
                                <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
                            </svg>
                            <h3>Sicuro</h3>
                            <p class="lead mb-0 text-bold"> Eccetto noi della PayBall8 S.P.A. nessuno pu&ograve;
                                accedere
                                ai vostri
                                dati sensibili ;-) .</p>
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
                            <li class="list-inline-item"><a class="text-white" href="#">Term of Use</a></li>
                            <li class="list-inline-item"><a class="text-white" href="#">Privacy Policy</a></li>
                        </ul>
                        <p class="text-white small mb-4 mb-lg-0">@ Your Website
                            <script> document.write(new Date().getFullYear()); </script>. All Rights Reserved.
                        </p>
                    </div>
                    <div class="col-lg-6 h-100 text-center text-lg-right">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item mr-3"><a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-credit-card-2-back-fill icons-navbar-color" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                            d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5H0V4zm11.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2z" />
                                        <path d="M0 11v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1H0z" />
                                    </svg>
                                </a></li>
                            <li class="list-inline-item mr-3"><a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-building icons-navbar-color" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                            d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                                        <path
                                            d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                                    </svg>
                                </a></li>
                            <li class="list-inline-item"><a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-briefcase-fill icons-navbar-color" viewBox="0 0 16 16">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
            crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
    </body>

    </html>