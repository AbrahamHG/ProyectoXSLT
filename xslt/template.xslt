<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>

	<xsl:param name="TipoCars" select="TipoCars"></xsl:param>

	<xsl:template match="autos">
		<html>
			<head>
				<meta charset="UTF-8"></meta>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
				<style>
					/* Estilos para el mapa */
					#map {
					height: 500px;
					width: 100%;
					}
				</style>
				<!-- Agregar la API de Google Maps -->
				<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;callback=initMap"
				async="" defer=""></script>

				<title>Página de Inicio</title>
				<!-- Bootstrap CSS -->
				<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"></link>
				<style>
					body {
					font-family: 'Arial', sans-serif;
					margin: 0;
					padding: 0;
					background-color: #f4f4f9;
					}

					header {
					background-color: #333;
					color: #fff;
					padding: 20px;
					text-align: center;
					}

					nav {
					background-color: #444;
					padding: 15px;
					text-align: center;
					}

					nav a {
					color: white;
					margin: 0 15px;
					text-decoration: none;
					font-size: 18px;
					}

					nav a:hover {
					text-decoration: underline;
					}

					/* Sección Video */
					section#Video {
					background-color: #CC6666; /* Gris suave */
					padding: 40px;
					text-align: center;
					}

					/* Sección de autos */
					section#autos {
					background-color: #ffffff; /* Blanco */
					padding: 40px 20px;
					}

					section#autos h2 {
					color: #333;
					}

					/* Sección de contacto */
					section#contacto {
					background-color: #f9f9f9; /* Gris claro */
					padding: 40px 20px;
					}

					/* Sección de contenido */
					section.content {
					background-color: #fff; /* Blanco */
					padding: 40px;
					text-align: center;
					}

					section.content h2 {
					color: #333;
					}

					/* Formulario de contacto */
					.contact-form {
					background-color: #ffffff;
					padding: 40px;
					margin-top: 20px;
					border-radius: 8px;
					box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
					}

					/* Otros estilos para las tarjetas */
					.card {
					border: none;
					border-radius: 10px;
					box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
					transition: transform 0.3s ease;
					}

					.card:hover {
					transform: translateY(-5px);
					}

					.card-img-top {
					border-top-left-radius: 10px;
					border-top-right-radius: 10px;
					}

					.card-body {
					background-color: #f9f9f9;
					padding: 20px;
					border-bottom-left-radius: 10px;
					border-bottom-right-radius: 10px;
					}

					.card-title {
					font-size: 1.2em;
					font-weight: bold;
					}

					.btn-primary {
					background-color: #007bff;
					border-color: #007bff;
					transition: background-color 0.3s ease;
					}

					.btn-primary:hover {
					background-color: #0056b3;
					border-color: #0056b3;
					}

					.form-group label {
					font-weight: bold;
					}

					.card-img-top {
					width: 100%;
					height: 300px;
					object-fit: cover;
					}

					.container33 {
					display: flex;
					gap: 20px;
					margin-top: 50px;
					}
					.box33 {
					width: 200px;
					height: 200px;
					border: 2px dashed #aaa;
					display: flex;
					justify-content: center;
					align-items: center;
					}
					.box33 img {
					max-width: 100%;
					max-height: 100%;
					cursor: grab;
					}


				</style>

			</head>
			<body>
				<header>
					<h1>Bienvenido a Nuestra Página de Autos</h1>
				</header>

				<nav>
					<a href="#home">Inicio</a>
					<a href="#autos">Autos</a>
					<a href="#conctant">Contacto</a>
					<a href="#DragandDrop">Drag and Drop</a>
				</nav>
				<section class="tm-section-row p-6">
					<!--<h2>Video</h2>-->
					<div id="Video" style="width:100%">
						<video autoplay="autoplay" muted="muted" loop="true" controls="true" width="100%" poster="assets/img/galeriautos.jpg">
							<source src="assets/video/presentation.webm" type="video/webm"></source>
						</video>
						<audio autoplay="autoplay" loop="true" controls="true">
							<source src="assets/music/electro.mp3" type="audio/mp3"></source>
						</audio>
					</div>
					<br></br>
				</section>

				<section class="content">
					<h2>Conoce nuestros autos</h2>
					<p>Aquí encontrarás una variedad de vehículos para todos los gustos y necesidades.</p>
					<img src="assets/img/galeriautos.jpg" alt="Vehículos"></img>
					<p>Explora más sobre los modelos disponibles.</p>
				</section>

				<!-- Autos Section -->
				<section id="autos" class="container mt-5">
					<h2>Conoce nuestros autos</h2>
					<xsl:for-each select="categoria">
						<h3>
							<xsl:value-of select="@nombre"/>
						</h3>
						<div class="row">
							<xsl:for-each select="auto">
								<div class="col-md-6 mb-4">
									<div class="card">
										<xsl:if test="imagen">
											<img class="card-img-top" src="{imagen}" alt="Imagen del auto"/>
										</xsl:if>
										<div class="card-body">
											<h5 class="card-title">
												<xsl:value-of select="marca"/> <xsl:value-of select="modelo"/> - <xsl:value-of select="anio"/>
											</h5>
											<p class="card-text">
												<strong>Precio:</strong> $USD:<xsl:value-of select="precio"/><br/>
												<strong>Color:</strong> <xsl:value-of select="color"/><br/>
												<xsl:value-of select="descripcion"/>
											</p>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>
					</xsl:for-each>
				</section>

				<!-- Contact Section -->
				<section id="conctant" clas="contact">

					<!--Datos y Formulario-->
					<div class="container" data-aos="fade-up">
						<div class="row mt-5">
							<!--Datos de Conctactp-->
							<!--FORMULARIO 2-->
							<!-- Contact Section -->
							<section id="contacto" class="container mt-5">
								<!--CONTACTO-->
								<!-- Contact Start -->
								<div class="container-fluid contact py-5">
									<div class="container py-5">
										<div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800px;">
											<h1 class="display-5 text-capitalize text-primary mb-3">Contactanos</h1>
											<p class="mb-0">Si tienes alguna pregunta, no dudes en enviarnos un mensaje a través del siguiente formulario:</p>
										</div>
										<div class="row g-5">
											<div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
												<div class="row g-5">
													<div class="col-md-6 col-lg-6 col-xl-3">
														<div class="contact-add-item p-4">
															<div class="contact-icon mb-4">
																<i class="fas fa-map-marker-alt fa-2x"></i>
															</div>
															<div>
																<h4>Direccion</h4>
																<p class="mb-0">123 Street New York.USA</p>
															</div>
														</div>
													</div>
													<div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.3s">
														<div class="contact-add-item p-4">
															<div class="contact-icon mb-4">
																<i class="fas fa-envelope fa-2x"></i>
															</div>
															<div>
																<h4>Email</h4>
																<p class="mb-0">info@example.com</p>
															</div>
														</div>
													</div>
													<div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.5s">
														<div class="contact-add-item p-4">
															<div class="contact-icon mb-4">
																<i class="fa fa-phone-alt fa-2x"></i>
															</div>
															<div>
																<h4>Telefono</h4>
																<p class="mb-0">(+012) 3456 7890</p>
															</div>
														</div>
													</div>
													<div class="col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-delay="0.7s">
														<div class="contact-add-item p-4">
															<div class="contact-icon mb-4">
																<i class="fab fa-firefox-browser fa-2x"></i>
															</div>
															<div>
																<h4>Yoursite@ex.com</h4>
																<p class="mb-0">(+012) 3456 7890</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-6 wow fadeInUp" data-wow-delay="0.1s">
												<div class="bg-secondary p-5 rounded">
													<h4 class="text-primary mb-4">Mensaje</h4>
													<form role="form" id="formulario" class="php-email-form">
														<div class="row g-4">
															<div class="col-lg-12 col-xl-6">
																<div class="form-floating">
																	<input type="text" class="form-control" id="contac_name" placeholder="Nombre"></input>
																	<label for="name">Nombre</label>
																</div>
															</div>
															<div class="col-lg-12 col-xl-6">
																<div class="form-floating">
																	<input type="email" class="form-control"  id="contac_email"  placeholder="Correo"></input>
																	<label for="email"> Email</label>
																</div>
															</div>
															<div class="col-lg-12 col-xl-6">
																<div class="form-floating">
																	<input type="phone" class="form-control" id="phone" placeholder="Telefono"></input>
																	<label for="phone">Telefono</label>
																</div>
															</div>
															<div class="col-lg-12 col-xl-6">
																<div class="form-floating">
																	<input type="text" class="form-control" id="address" placeholder="Auto de Interes"></input>
																	<label for="project">Auto</label>
																</div>
															</div>
															<div class="col-12">
																<div class="form-floating">
																	<textarea class="form-control" placeholder="Tu Mensaje" id="message" style="height: 160px"></textarea>
																	<label for="message">Mensaje</label>
																</div>

															</div>
															<div class="col-12">
																<a class="btn btn-primary" href="javascript:void(0);" id="miBton">Enviar</a>
															</div>
														</div>
													</form>
												</div>
											</div>
											<div class="col-12 col-xl-1 wow fadeInUp" data-wow-delay="0.3s">
												<div class="d-flex flex-xl-column align-items-center justify-content-center">
													<a class="btn btn-xl-square btn-light rounded-circle mb-0 mb-xl-4 me-4 me-xl-0" href="">
														<i class="fab fa-facebook-f"></i>
													</a>
													<a class="btn btn-xl-square btn-light rounded-circle mb-0 mb-xl-4 me-4 me-xl-0" href="">
														<i class="fab fa-twitter"></i>
													</a>
													<a class="btn btn-xl-square btn-light rounded-circle mb-0 mb-xl-4 me-4 me-xl-0" href="">
														<i class="fab fa-instagram"></i>
													</a>
													<a class="btn btn-xl-square btn-light rounded-circle mb-0 mb-xl-0 me-0 me-xl-0" href="">
														<i class="fab fa-linkedin-in"></i>
													</a>
												</div>
											</div>
											<div class="col-12 col-xl-5 wow fadeInUp" data-wow-delay="0.1s">
												<div class="p-5 bg-light rounded">
													<div class="bg-white rounded p-4 mb-4">
														<h4 class="mb-3">Our Branch 01</h4>
														<div class="d-flex align-items-center flex-shrink-0 mb-3">
															<p class="mb-0 text-dark me-2">Direcccion:</p>
															<i class="fas fa-map-marker-alt text-primary me-2"></i>
															<p class="mb-0">123 Street New York.USA</p>
														</div>
														<div class="d-flex align-items-center">
															<p class="mb-0 text-dark me-2">Telephone:</p>
															<i class="fa fa-phone-alt text-primary me-2"></i>
															<p class="mb-0">(+012) 3456 7890</p>
														</div>
													</div>
													<div class="bg-white rounded p-4 mb-4">
														<h4 class="mb-3">Our Branch 02</h4>
														<div class="d-flex align-items-center mb-3">
															<p class="mb-0 text-dark me-2">Direccion:</p>
															<i class="fas fa-map-marker-alt text-primary me-2"></i>
															<p class="mb-0">123 Street New York.USA</p>
														</div>
														<div class="d-flex align-items-center">
															<p class="mb-0 text-dark me-2">Telephone:</p>
															<i class="fa fa-phone-alt text-primary me-2"></i>
															<p class="mb-0">(+012) 3456 7890</p>
														</div>
													</div>
													<div class="bg-white rounded p-4 mb-0">
														<h4 class="mb-3">Our Branch 03</h4>
														<div class="d-flex align-items-center mb-3">
															<p class="mb-0 text-dark me-2">Direccion:</p>
															<i class="fas fa-map-marker-alt text-primary me-2"></i>
															<p class="mb-0">123 Street New York.USA</p>
														</div>
														<div class="d-flex align-items-center">
															<p class="mb-0 text-dark me-2">Telephone:</p>
															<i class="fa fa-phone-alt text-primary me-2"></i>
															<p class="mb-0">(+012) 3456 7890</p>
														</div>
													</div>
												</div>
											</div>
											<div class="col-12">
												<div class="rounded">
													<iframe class="rounded w-100"
													style="height: 400px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387191.33750346623!2d-73.97968099999999!3d40.6974881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1694259649153!5m2!1sen!2sbd"
													loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- Contact End -->
							</section>

							<!--FIN FORMULARIO-->
							<!--Formulario-->
							<div class="col-lg-8 mt-5 mt-lg-0">
								<!--Action => se refiere a la acion que se ejecutara al enviarle el formulario, generalmente usamos una url o bien un controlador-->
								<!--method => hace referencia al como se enviara la peticion del formulario, este caso y en su mayoria lo enviamos bajo una peticion  post que significa enviar los datos en 2do plano dentro del cuerpo de la peticion-->
							</div>
						</div>
					</div>

					<section id="DragandDrop" class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800px;">
						<h1 class="display-5 text-capitalize text-primary mb-3">Drag and Drop de Imagen</h1>
						<div class="container33">
							<div id="box1" class="box33" ondrop="drop(event)" ondragover="allowDrop(event)">
								<img src="assets/img/Porsche911_2023.jpg" alt="Imagen arrastrable" draggable="true" ondragstart="drag(event)" id="dragImage"></img>
							</div>
							<div id="box2" class="box33" ondrop="drop(event)" ondragover="allowDrop(event)">
								<!-- Segundo cuadro vacío -->
							</div>
						</div>
					</section>

					<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.0/sweetalert2.all.js"></script>

					<script>
						// Permitir el drop sobre el cuadro
						function allowDrop(event) {
						event.preventDefault();
						}

						// Obtener el id del elemento arrastrado
						function drag(event) {
						event.dataTransfer.setData("text", event.target.id);
						}

						// Soltar la imagen en el cuadro
						function drop(event) {
						event.preventDefault();
						const data = event.dataTransfer.getData("text");
						const image = document.getElementById(data);
						event.target.appendChild(image);
						}
					</script>

					<script type="text/javascript" src="assets/js/Validador1.js"></script>
					<!--SCRIPT-->



				</section>

				<!-- Bootstrap JS and dependencies -->
				<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
