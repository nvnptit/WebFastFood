<%@page import="java.util.HashMap" %>
	<%@page import="java.util.Map" %>
		<%@page import="ptithcm.entity.Product" %>
			<%@ page pageEncoding="utf-8" %>
				<%@page import="java.util.ArrayList" %>
					<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
						<!DOCTYPE html>
						<html lang="en">
						<c:set var="root" value="${pageContext.servletContext.contextPath}" />
						<link rel="shortcut icon" type="image/x-icon" href="${root}/resources/images/hamburger.png" />

						<head>
							<title>Thông tin chi tiết</title>
							<meta charset="utf-8">
							<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

							<link
								href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
								rel="stylesheet">
							<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
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

							<%@include file="/WEB-INF/views/include/header.jsp"%>

							<div class="hero-wrap hero-bread" style="background-image: url('${root}/resources/images/bg_1.jpg');">
								<div class="container">
									<div class="row no-gutters slider-text align-items-center justify-content-center">
										<div class="col-md-9 ftco-animate text-center">
											<h1 class="mb-0 bread"><s:message code="single.Header"/></h1>
										</div>
									</div>
								</div>
							</div>

							<section class="ftco-section">
								<div class="container">
									<div class="row">
										<div class="col-lg-6 mb-5 ftco-animate">
											<a href="${root}/resources/images/products/${product.img}"
												class="image-popup"><img
													src="${root}/resources/images/products/${product.img}"
													class="img-fluid" alt="Colorlib Template"></a>
										</div>
										<div class="col-lg-6 product-details pl-md-5 ftco-animate">
											<h3>${product.name}</h3>
											<div class="rating d-flex">
												<p class="text-left mr-4">
													<a href="" class="mr-2">5.0</a>
													<a href=""><span class="ion-ios-star-outline"></span></a>
													<a href=""><span class="ion-ios-star-outline"></span></a>
													<a href=""><span class="ion-ios-star-outline"></span></a>
													<a href=""><span class="ion-ios-star-outline"></span></a>
													<a href=""><span class="ion-ios-star-outline"></span></a>
												</p>
												<p class="text-left mr-4">
													<a href="#" class="mr-2" style="color: #000;">100 <span
															style="color: rgb(175, 104, 104);"><s:message code="single.Rate"/></span></a>
												</p>
												<p class="text-left">
													<a href="#" class="mr-2" style="color: #000;">500 <span
															style="color: rgb(163, 61, 61);"><s:message code="single.Sold"/></span></a>
												</p>
											</div>
											<p class="price"><span>${product.price} VNĐ</span></p>
											<p>${product.description}</p>
											<div class="row mt-4">

												<div class="w-100"></div>
												<div class="col-md-12">
													<p style="color: rgb(90, 56, 243);"><s:message code="single.Remain"/> ${product.quantity} <s:message code="single.Product"/></p>
												</div>
											</div>
											<form method="post" action="${root}/home/addCart.htm">
												<s:message code="general.AddToCart" var="addToCart"/>
												<input type="hidden" value="${product.id}" name="id" />
												<input type="submit" value="${addToCart}" name="btnOK"
													class="btn btn-black py-3 px-5" />
											</form>
										</div>
									</div>
								</div>
							</section>

							<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
								<div class="container py-4">
									<div class="row d-flex justify-content-center py-5">
										<div class="col-md-6">
											<h2 style="font-size: 22px;" class="mb-0">Đăng ký nhận thông tin mới nhất
											</h2>
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
							
							<%@include file="/WEB-INF/views/include/footer.jsp"%>

							<script>
								$(document).ready(function () {

									var quantitiy = 0;
									$('.quantity-right-plus').click(function (e) {

										// Stop acting like a button
										e.preventDefault();
										// Get the field name
										var quantity = parseInt($('#quantity').val());

										// If is not undefined

										$('#quantity').val(quantity + 1);


										// Increment

									});

									$('.quantity-left-minus').click(function (e) {
										// Stop acting like a button
										e.preventDefault();
										// Get the field name
										var quantity = parseInt($('#quantity').val());

										// If is not undefined

										// Increment
										if (quantity > 0) {
											$('#quantity').val(quantity - 1);
										}
									});

								});
							</script>


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
							
						</body>

						</html>