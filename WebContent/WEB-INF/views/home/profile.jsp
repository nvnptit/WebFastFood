<%@page import="java.util.HashMap" %>
	<%@page import="java.util.Map" %>
		<%@page import="org.hibernate.SessionFactory" %>
			<%@page import="org.hibernate.Session" %>
				<%@page import="ptithcm.entity.Product" %>
					<%@page import="java.util.ArrayList" %>
						<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
							<%@ page pageEncoding="utf-8" %>
								<!DOCTYPE html>
								<html lang="en">
								<c:set var="root" value="${pageContext.servletContext.contextPath}" />

								<head>
									<title>Thông tin</title>
									<meta charset="utf-8">
									<meta name="viewport"
										content="width=device-width, initial-scale=1, shrink-to-fit=no">

									<link
										href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
										rel="stylesheet">
									<link
										href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
										rel="stylesheet">
									<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
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
															<span class="text">Nhóm 16 with ♥</span>
														</div>
														<div
															class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
															<span class="text">3-5 Giao hàng trong ngày làm việc & Trả
																hàng miễn phí</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
										id="ftco-navbar">
										<div class="container">
											<a class="navbar-brand" href="index.htm"><img
													src="../resources/images/logo.png" alt=""></a>
											<button class="navbar-toggler" type="button" data-toggle="collapse"
												data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false"
												aria-label="Toggle navigation">
												<span class="oi oi-menu"></span> Menu
											</button>

											<div class="collapse navbar-collapse" id="ftco-nav">
												<ul class="navbar-nav ml-auto">
													<li class="nav-item"><a href="index.htm" class="nav-link">Trang
															chủ</a></li>
													<li class="nav-item"><a href="food.htm" class="nav-link">Thức ăn</a>
													</li>
													<li class="nav-item"><a href="drink.htm" class="nav-link">Thức
															uống</a></li>
													<li class="nav-item"><a href="about.htm" class="nav-link">Thông tin
															thêm</a></li>
													<li class="nav-item"><a href="blog.htm" class="nav-link">Blog</a>
													</li>
													<li class="nav-item cta cta-colored active"><a href="cart.htm"
															class="nav-link">
															<span class="icon-shopping_cart">Giỏ hàng</span>[
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
														data-toggle="dropdown" data-sidebar="true"
														aria-expanded="false">
														<!--  <img class="mr-2" src="${root}/resources/images/icon/avt.png" width="40" height="40" alt="avatar"> -->
														<div class="media-body">
															<h5>
																<span
																	class="badge badge-pill badge-success nav-item">${sessionScope['user'].fullname}</span>
															</h5>

														</div>
													</a>
													<ul class="dropdown-menu dropdown-menu-right" role="menu">
														<a class="dropdown-item" href="profile.htm">Thay đổi mật
															khẩu</a>
														<a class="dropdown-item" href="logout.htm">Đăng xuất</a>
													</ul>
												</div>
											</div>
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
													</p>
													<h1 class="mb-0 bread">Thông tin cá nhân</h1>
												</div>
											</div>
										</div>
									</div>

									<section class="ftco-section">
										<div class="container">
											<div class="row justify-content-center">
												<div class="col-xl-7 ftco-animate">
													<form action="profile.htm" method="POST" class="billing-form">
														<h3 class="mb-4 billing-heading">Thay đổi mật khẩu</h3>
														<c:if test="${not empty message}">
															<div class="alert alert-danger" role="alert">
																${message}
															</div>
														</c:if>
														<div class="form-group">
															<label>Mật khẩu cũ</label> <input class="form-control"
																type="password" name="oldpass" required>
														</div>
														<div class="form-group">
															<label>Nhập mật khẩu mới</label>
															<input class="form-control" id="newpass" type="password"
																name="newpass" required>
															<div class="invalid-feedback">Vui lòng nhập mật khẩu!</div>
														</div>
														<div class="form-group">
															<label>Nhập lại mật khẩu</label>
															<input class="form-control" id="confirmpass" type="password"
																name="confirmpass" oninput="check(this)" required />
															<script language='javascript' type='text/javascript'>
																function check(input) {
																	if (input.value != document.getElementById('newpass').value) {
																		input.setCustomValidity('Mật khẩu không trùng khớp');
																	} else {
																		input.setCustomValidity('');
																	}
																}
															</script>
														</div>
														<button class="btn btn-info" type="submit">Đổi mật khẩu</button>
													</form>
													<!-- END -->
												</div>
											</div>
										</div>
									</section>
									<!-- .section -->

									<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
										<div class="container py-4">
											<div class="row d-flex justify-content-center py-5">
												<div class="col-md-6">
													<h2 style="font-size: 22px;" class="mb-0">Đăng ký nhận thông tin mới
														nhất</h2>
													<span>Đăng ký ngay để nhận được nhiều món ngon và ưu đãi!!!</span>
												</div>
												<div class="col-md-6 d-flex align-items-center">
													<form action="#" class="subscribe-form">
														<div class="form-group d-flex">
															<input type="text" class="form-control"
																placeholder="Điền email tại đây">
															<input type="submit" value="Subscribe" class="submit px-3">
														</div>
													</form>
												</div>
											</div>
										</div>
									</section>
									<footer class="ftco-footer ftco-section">
										<div class="container">
											<div class="row">
												<div class="mouse">
													<a href="#" class="mouse-icon">
														<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span>
														</div>
													</a>
												</div>
											</div>
											<div class="row mb-5">
												<div class="col-md">
													<div class="ftco-footer-widget mb-4">
														<h2 class="ftco-heading-2">FAST FOOD</h2>
														<p>Thế giới đồ ăn nhanh</p>
														<ul
															class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
															<li class="ftco-animate"><a href="#"><span
																		class="icon-twitter"></span></a>
															</li>
															<li class="ftco-animate"><a href="#"><span
																		class="icon-facebook"></span></a>
															</li>
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
																<li><a href="#" class="py-2 d-block">Privacy Policy</a>
																</li>
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
																<li><span class="icon icon-map-marker"></span>
																	<span class="text">97 Man Thiện, Phường Hiệp Phú,
																		Quận 9, TP Thủ
																		Đức</span>
																</li>
																<li><a href="#"><span
																			class="icon icon-phone"></span><span
																			class="text">+84 979 888 999</span></a></li>
																<li><a href="#"><span
																			class="icon icon-envelope"></span><span
																			class="text">fastfood@codevn.tk</span></a>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12 text-center">
													<p> Copyright &copy;
														<script>document.write(new Date().getFullYear());</script>
													</p>
												</div>
											</div>
										</div>
									</footer>



									<!-- loader -->
									<div id="ftco-loader" class="show fullscreen">
										<svg class="circular" width="48px" height="48px">
											<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
												stroke="#eeeeee" />
											<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4"
												stroke-miterlimit="10" stroke="#F96D00" />
										</svg>
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
									<!-- <script
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
									<!-- <script src="${root}/resources/js/google-map.js"></script> -->
									<script src="${root}/resources/js/main.js"></script>
									<script type="text/javascript">
										$("#btnLogin").click(function (event) {

											//Fetch form to apply custom Bootstrap validation
											var form = $("#formLogin")

											if (form[0].checkValidity() === false) {
												event.preventDefault()
												event.stopPropagation()
											}

											form.addClass('was-validated');
										});

										$("#btnSignup").click(function (event) {

											//Fetch form to apply custom Bootstrap validation
											var form = $("#formSignup")

											if (form[0].checkValidity() === false) {
												event.preventDefault()
												event.stopPropagation()
											}

											form.addClass('was-validated');
										});
									</script>
								</body>

								</html>