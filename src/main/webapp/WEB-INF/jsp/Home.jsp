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
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="<c:url value=" /resources/css/Home.css" />" rel="stylesheet">
<script defer src="<c:url value=" /resources/js/Home.js" />"></script>

<title>Riepilogo</title>

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
																					<label for="exampleInputPassword0"
																						class="form-label">Nuova Password</label> <input
																						type="password" class="form-control"
																						id="exampleInputPassword0">
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
	<div class="container-fluid banner banner-color">
		<div class="row h-100">
			<div class="col-lg-2 col-md-2 h-100">
				<div class="row details-list-left"></div>
			</div>
			<div class="col-lg-8 col-md-8 h-100">
				<div class="row padding-buongiorno">
					<h3 id="buongiornissimo" class="card-title text-lg-left" />
				</div>
				<div class="row">
					<div class="col-lg-5 col-md-5 h-100">
						<div class="container-md">
							<div class="card card-font-color">
								<div class="card-header">
									<ul class="nav nav-tabs card-header-tabs">
										<li class="nav-item">
											<button type="button" class="btn card-button-options-font" disabled>Saldo</button>
										</li>
									</ul>
								</div>
								<div class="card-body card-body-text-color">
									<div class="container-md">
										<span id="saldo" class="saldo-font">EUR</span>
									</div>
									<div class="container-md">
										<span class="ppvx_text--sm cw_tile-currency_primary">Disponibile</span>
									</div>
									<ul class="list-inline mb-2 list-font">
										<li class="list-inline-item padding-invia">
											<ul class="list-inline mb-2 list-font">
												<li class="list-inline-item"><svg
														xmlns="http://www.w3.org/2000/svg" width="25" height="25"
														fill="currentColor" class="bi bi-bag-dash-fill"
														viewBox="0 0 16 16">
                                                            <path
															fill-rule="evenodd"
															d="M5.5 3.5a2.5 2.5 0 0 1 5 0V4h-5v-.5zm6 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0zM6 9.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1H6z" />
                                                        </svg></li>
												<li class="list-inline-item">
													<button type="button" class="btn card-button-options-font "
														data-bs-toggle="modal" data-bs-target="#exampleModal4">Invia</button>
													<!-- Modal -->
													<div class="modal fade" id="exampleModal4" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header chiudi-gestioneAccount">
																	<h5 class="modal-title" id="exampleModalLabel">
																		Invia Denaro</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<div class="input-group mb-3">
																		<span class="input-group-text euro-label">#</span> <input
																			id="TagInputLabel" type="text" class="form-control"
																			placeholder="Tag-Utente" aria-label="Username"
																			aria-describedby="basic-addon1">
																	</div>
																	<div class="input-group">
																		<input id="ImportoInputLabel" type="text"
																			class="form-control" placeholder="0.00"> <span
																			class="input-group-text euro-label">Euro</span>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Annulla</button>
																	<a class="chiudi-gestioneAccount"
																		href="http://localhost:9090/home">
																		<button id="bottoneInviaTransizione" type="button"
																			class="btn chiudi-gestioneAccount">Invia</button>
																	</a>
																</div>
															</div>
														</div>
													</div>
													<button type="button" id="bottoneGestioneId_Account"
														class="btn card-button-options-font "
														data-bs-toggle="modal" data-bs-target="#exampleModal10">Ricevi</button>
													<div class="modal fade" id="exampleModal10" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">Ricevi</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<table
																		class="table memberListColor table-striped table-hover">
																		<tbody id="corpoGestioneId_Account">

																		</tbody>
																	</table>
																</div>
																<div class="modal-footer">
																	<button type="button"
																		class="btn chiudi-gestioneAccount"
																		data-bs-dismiss="modal">Chiudi</button>
																</div>
															</div>
														</div>
													</div>
													<button type="button" class="btn card-button-options-font "
														data-bs-toggle="modal" data-bs-target="#exampleModal11">Ricarica</button>
													<!-- Modal -->
													<div class="modal fade" id="exampleModal11" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header chiudi-gestioneAccount">
																	<h5 class="modal-title" id="exampleModalLabel">
																		Ricarica Saldo</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<div class="input-group mb-3">
																		<span class="input-group-text euro-label">#</span> <input
																			id="panInputLabel" type="text" class="form-control"
																			placeholder="Pan-Carta" aria-label="Username"
																			aria-describedby="basic-addon1">
																	</div>
																	<div class="input-group">
																		<input id="ImportoInputLabel2" type="text"
																			class="form-control" placeholder="0.00"> <span
																			class="input-group-text euro-label">Euro</span>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Annulla</button>
																	<a class="chiudi-gestioneAccount"
																		href="http://localhost:9090/home">
																		<button id="bottoneRicaricaSaldo" type="button"
																			class="btn chiudi-gestioneAccount">Ricarica
																		</button>
																	</a>
																</div>
															</div>
														</div>
													</div>

												</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-1 col-md-1 h-100"></div>
					<div class="col-lg-5 col-md-5 h-100">
						<div class="container-md ">
							<div class="card card-font-color">
								<div class="card-header">
									<ul class="nav nav-tabs card-header-tabs">
										<li class="nav-item">
											<div class="btn-group dropend">
												<button type="button" class="btn card-button-options-font" disabled>Colletta</button>
									</ul>
								</div>
								<div class="card-body card-body-text-color">
									<ul class="list-inline mb-2 list-font">
										<li id="form">
											<form class="font-form">
												<div class="mb-3">
													<label class="form-label">Beneficiario</label>
													<input type="text" class="form-control "
														id="idBeneficiario" placeholder="#Tag"
														aria-describedby="emailHelp" required>
												</div>
												<div class="mb-3">
													<label class="form-label">Quota</label>
													<ul class="list-inline mb-2">
														<li class="list-inline-item">
															<div class="input-group">
																<input type="text" class="form-control"
																	placeholder="0.00" id="idQuota" required> <span
																	class="input-group-text euro-label">Euro</span>
															</div>
														</li>
													</ul>
												</div>
												<button type="button" class="btn submit-font"
													data-bs-toggle="modal" data-bs-target="#exampleModal5">Submit</button>
												<!-- Modal -->
												<div class="modal fade" id="exampleModal5" tabindex="-1"
													aria-labelledby="exampleModalLabel5" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header chiudi-gestioneAccount">
																<h5 class="modal-title" id="exampleModalLabel5">
																	Aggiungi Contribuente</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="input-group mb-3">
																	<span class="input-group-text euro-label"
																		id="basic-addon1">#</span> <input type="text"
																		class="form-control" placeholder="Tag"
																		aria-label="Username" aria-describedby="basic-addon1"
																		id="idContribuente">
																</div>
																<div>
																	<button type="button"
																		class="btn chiudi-gestioneAccount"
																		id="bottoneAggiungiContribuente">Aggiungi</button>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Annulla</button>
																<button type="button" id="bottoneCreaColletta"
																	class="btn chiudi-gestioneAccount" data-bs-dismiss="modal">Crea</button>
															</div>
														</div>
													</div>
												</div>
											</form>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-1 col-md-1 h-100"></div>
				</div>
			</div>
			<div id="sezione-lista-amici" class="col-lg-2 col-md-2 h-100">
				<div class="row">
					<ul class="list-inline mb-2 list-font">
						<li class="list-item">
							<h4>Amici</h4>
						</li>
						<li class="list-inline-item search-input-dim">
							<form class="row row-cols-lg-auto g-3 align-items-center">
								<div class="col-12">
									<label class="visually-hidden"
										for="inlineFormInputGroupUsername">Username</label>
									<div class="input-group">
										<div class="input-group-text search-bar-font-1">#</div>
										<input type="text" class="form-control search-bar-font-2"
											id="tagInputLabel" placeholder="Tag">
									</div>
								</div>
						</li>
						<li class="list-inline-item"><a href="#">
								<button type="button" class="serch-button-font"
									id="bottoneCercaAmico">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
											d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                                            <path fill-rule="evenodd"
											d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                                        </svg>
								</button>
						</a></li>
						<li class="list-inline-item"><a href="#">
								<button type="button" class="serch-button-font"
									id="bottoneAggiungiAmico">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-person-plus"
										viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
											d="M8 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10zM13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
                                        </svg>
								</button>
						</a></li>
					</ul>
				</div>
				<div id="amici-in-lista" class="row details-list-right">
					<table class="table memberListColor table-striped table-hover">
						<tbody id="corpoListaAmici">

						</tbody>
					</table>
				</div>
			</div>
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

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
	-->
	<div id="friend-info-popup" class="friendModal">
		<div class="friend-modal-content">
			<span class="friend-popup-close">&times;</span>
			</br>
			<label class="form-label" id="friend-id-info">ID: </label>
			<label class="form-label" id="friend-name-info">Nome: </label>
			<button class="btn" id="delete-friend-button" type="button">Elimina</button>
		</div>
	</div> 
</body>

</html>
