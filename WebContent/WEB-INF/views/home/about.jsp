<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>FAST FOOD</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${root}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/css/animate.css">

<link rel="stylesheet" href="${root}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${root}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${root}/resources/css/magnific-popup.css">

<link rel="stylesheet" href="${root}/resources/css/aos.css">

<link rel="stylesheet" href="${root}/resources/css/ionicons.min.css">

<link rel="stylesheet" href="${root}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="${root}/resources/css/flaticon.css">
<link rel="stylesheet" href="${root}/resources/css/icomoon.css">
<link rel="stylesheet" href="${root}/resources/css/style.css">
</head>

<body class="goto-here">
	<div class="py-1 bg-primary">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">(+84) 979 888 999</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">Group 16 with ♥</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">3-5 Business days delivery &amp; Free
								Returns</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.htm">Vegefoods</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.htm" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="shop.htm" class="nav-link">Products</a></li>
					<li class="nav-item active"><a href="#" class="nav-link">About</a></li>
					<li class="nav-item"><a href="blog.htm" class="nav-link">Blog</a></li>
					<li class="nav-item cta cta-colored"><a href="cart.htm"
						class="nav-link"><span class="icon-shopping_cart"></span>[
							${sessionScope['Orders_list'].size()} ]</a></li>

				</ul>
			</div>
		</div>
		
		<c:if test="${sessionScope['user'] != null}">

			<div class="collapse navbar-collapse pmd-navbar-sidebar"
				id="navbarSupportedContent" style="justify-content: flex-end">
				<div class="dropdown pmd-dropdown pmd-user-info">
					<a href="javascript:void(0);"
						class="btn-user dropdown-toggle media align-items-center nav-link"
						data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
						<!--  <img class="mr-2" src="${root}/resources/images/icon/avt.png" width="40" height="40" alt="avatar"> -->
						<div class="media-body">
							<h5>
								<span class="badge badge-pill badge-success nav-item">${sessionScope['user'].fullname}</span>
							</h5>

						</div>
					</a>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<a class="dropdown-item" href="profile.htm">Change Password</a>
						<a class="dropdown-item" href="logout.htm">Logout</a>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope['user'] == null}">

			<div id="loginModal" class="modal fade" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3>Login</h3>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<form class="form needs-validation" role="form"
								autocomplete="off" id="formLogin" action="index.htm"
								method="POST">
								<div class="form-group">
									<a href="#SignupModal" class="float-right" data-toggle="modal">New
										user?</a> <label for="uname1">Username</label> <input type="text"
										class="form-control form-control-lg" name="username_lg"
										id="uname1" required>
									<div class="invalid-feedback">Oops, you missed this one.</div>
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control form-control-lg" id="pwd1"
										name="password_lg" required>
									<div class="invalid-feedback">Enter your password too!</div>
								</div>
								<div class="custom-control custom-checkbox">
									<label> <a href="forgot.htm">Forgotten Password?</a>
									</label>
								</div>
								<div class="form-group py-4">
									<button class="btn btn-outline-secondary btn-lg"
										data-dismiss="modal" aria-hidden="true">Cancel</button>
									<button type="submit"
										class="btn btn-success btn-lg float-right" id="btnLogin">Login</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="SignupModal" class="modal fade" tabindex="-1" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3>SignUp</h3>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<form class="form" role="form" autocomplete="off" id="formSignup"
								action="login.htm" method="POST">
								<div class="form-group">
									<label for="uname1">Username</label> <input type="text"
										class="form-control form-control-lg" name="username"
										id="username" required="">
									<div class="invalid-feedback">Oops, you missed this one.</div>
								</div>
								<div class="form-group">
									<label for="uname1">Fullname</label> <input type="text"
										class="form-control form-control-lg" name="fullname"
										id="fullname" required="">
									<div class="invalid-feedback">Oops, you missed this one.</div>
								</div>
								<div class="form-group">
									<label for="uname1">Email</label> <input type="email"
										class="form-control form-control-lg" name="email" id="email"
										required="">
									<div class="invalid-feedback">Oops, you missed this one.</div>
								</div>
								<div class="form-group">
									<label for="uname1">PhoneNumber</label> <input type="number"
										class="form-control form-control-lg" name="phone" id="phone"
										required="">
									<div class="invalid-feedback">Oops, you missed this one.</div>
								</div>
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control form-control-lg" name="password"
										required="" autocomplete="new-password">
									<div class="invalid-feedback">Enter your password too!</div>
								</div>
								<div class="form-group">
									<label>Confirm Password</label> <input type="password"
										class="form-control form-control-lg" name="confirmPassword"
										required="" autocomplete="new-password">
									<div class="invalid-feedback">Enter your password too!</div>
								</div>
								<input type="hidden" class="form-control form-control-lg"
									name="role" value="user">
								<div class="form-group py-4">
									<button class="btn btn-outline-secondary btn-lg"
										data-dismiss="modal" aria-hidden="true">Cancel</button>
									<button type="submit"
										class="btn btn-success btn-lg float-right" id="btnSignup">Sign
										Up</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<a href="#loginModal" role="button" class="btn btn-primary btn-lg "
				data-toggle="modal">Login</a>
			<a href="#SignupModal" role="button" class="btn btn-primary btn-lg "
				data-toggle="modal">SignUp</a>
		</c:if>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('${root}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>About
							us</span>
					</p>
					<h1 class="mb-0 bread">About us</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
		<div class="container">
			<div class="row">
				<div
					class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(${root}/resources/images/about.jpg);">
					<a href="https://vimeo.com/45830194"
						class="icon popup-vimeo d-flex justify-content-center align-items-center">
						<span class="icon-play"></span>
					</a>
				</div>
				<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
					<div class="heading-section-bold mb-4 mt-md-5">
						<div class="ml-md-0">
							<h2 class="mb-4">Welcome to Vegefoods an eCommerce website</h2>
						</div>
					</div>
					<div class="pb-md-5">
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in Bookmarksgrove right at the coast of the
							Semantics, a large language ocean.</p>
						<p>But nothing the copy said could convince her and so it
							didn’t take long until a few insidious Copy Writers ambushed her,
							made her drunk with Longe and Parole and dragged her into their
							agency, where they abused her for their.</p>
						<p>
							<a href="#" class="btn btn-primary">Shop now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subcribe to our
						Newsletter</h2>
					<span>Get e-mail updates about our latest shops and special
						offers</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control"
								placeholder="Enter email address"> <input type="submit"
								value="Subscribe" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-counter img" id="section-counter"
		style="background-image: url(${root}/resources/images/bg_3.jpg);">
		<div class="container">
			<div class="row justify-content-center py-5">
				<div class="col-md-10">
					<div class="row">
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="10000">0</strong> <span>Happy
										Customers</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="100">0</strong> <span>Branches</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="1000">0</strong> <span>Partner</span>
								</div>
							</div>
						</div>
						<div
							class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="100">0</strong> <span>Awards</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading">Testimony</span>
					<h2 class="mb-4">Our satisfied customer says</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in</p>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel">
						<div class="item">
							<div class="testimony-wrap p-4 pb-5">
								<div class="user-img mb-5"
									style="background-image: url(${root}/resources/images/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text text-center">
									<p class="mb-5 pl-4 line">Far far away, behind the word
										mountains, far from the countries Vokalia and Consonantia,
										there live the blind texts.</p>
									<p class="name">Garreth Smith</p>
									<span class="position">Marketing Manager</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap p-4 pb-5">
								<div class="user-img mb-5"
									style="background-image: url(${root}/resources/images/person_2.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text text-center">
									<p class="mb-5 pl-4 line">Far far away, behind the word
										mountains, far from the countries Vokalia and Consonantia,
										there live the blind texts.</p>
									<p class="name">Garreth Smith</p>
									<span class="position">Interface Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap p-4 pb-5">
								<div class="user-img mb-5"
									style="background-image: url(${root}/resources/images/person_3.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text text-center">
									<p class="mb-5 pl-4 line">Far far away, behind the word
										mountains, far from the countries Vokalia and Consonantia,
										there live the blind texts.</p>
									<p class="name">Garreth Smith</p>
									<span class="position">UI Designer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap p-4 pb-5">
								<div class="user-img mb-5"
									style="background-image: url(${root}/resources/images/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text text-center">
									<p class="mb-5 pl-4 line">Far far away, behind the word
										mountains, far from the countries Vokalia and Consonantia,
										there live the blind texts.</p>
									<p class="name">Garreth Smith</p>
									<span class="position">Web Developer</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap p-4 pb-5">
								<div class="user-img mb-5"
									style="background-image: url(${root}/resources/images/person_1.jpg)">
									<span
										class="quote d-flex align-items-center justify-content-center">
										<i class="icon-quote-left"></i>
									</span>
								</div>
								<div class="text text-center">
									<p class="mb-5 pl-4 line">Far far away, behind the word
										mountains, far from the countries Vokalia and Consonantia,
										there live the blind texts.</p>
									<p class="name">Garreth Smith</p>
									<span class="position">System Analyst</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div
					class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-shipped"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Free Shipping</h3>
							<span>On order over $100</span>
						</div>
					</div>
				</div>
				<div
					class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Always Fresh</h3>
							<span>Product well package</span>
						</div>
					</div>
				</div>
				<div
					class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-award"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Superior Quality</h3>
							<span>Quality Products</span>
						</div>
					</div>
				</div>
				<div
					class="col-lg-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div
							class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-customer-service"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">Support</h3>
							<span>24/7 Support</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Vegefoods</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Menu</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Shop</a></li>
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Journal</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Help</h2>
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">Shipping
										Information</a></li>
								<li><a href="#" class="py-2 d-block">Returns &amp;
										Exchange</a></li>
								<li><a href="#" class="py-2 d-block">Terms &amp;
										Conditions</a></li>
								<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">FAQs</a></li>
								<li><a href="#" class="py-2 d-block">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="${root}/resources/js/jquery.min.js"></script>
	<script src="${root}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${root}/resources/js/popper.min.js"></script>
	<script src="${root}/resources/js/bootstrap.min.js"></script>
	<script src="${root}/resources/js/jquery.easing.1.3.js"></script>
	<script src="${root}/resources/js/jquery.waypoints.min.js"></script>
	<script src="${root}/resources/js/jquery.stellar.min.js"></script>
	<script src="${root}/resources/js/owl.carousel.min.js"></script>
	<script src="${root}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${root}/resources/js/aos.js"></script>
	<script src="${root}/resources/js/jquery.animateNumber.min.js"></script>
	<script src="${root}/resources/js/bootstrap-datepicker.js"></script>
	<script src="${root}/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${root}/resources/js/google-map.js"></script>
	<script src="${root}/resources/js/main.js"></script>
	<script type="text/javascript">
		$("#btnLogin").click(function(event) {
  
			  //Fetch form to apply custom Bootstrap validation
			  var form = $("#formLogin")
  
			  if (form[0].checkValidity() === false) {
				event.preventDefault()
				event.stopPropagation()
			  }
			  
			//   form.addClass('was-validated');
			});
		
		$("#btnSignup").click(function(event) {
  
			  //Fetch form to apply custom Bootstrap validation
			  var form = $("#formSignup")
  
			  if (form[0].checkValidity() === false) {
				event.preventDefault()
				event.stopPropagation()
			  }
			  
			//   form.addClass('was-validated');
			});
	  </script>
</body>

</html>