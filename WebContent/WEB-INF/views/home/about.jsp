<%@ page pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<!DOCTYPE html>
		<html lang="en">
		<c:set var="root" value="${pageContext.servletContext.contextPath}" />

		<head>
			<title>Thông tin thêm</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
				rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

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
					<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
						<div class="col-lg-12 d-block">
							<div class="row d-flex">
								<div class="col-md pr-4 d-flex topper align-items-center">
									<div class="icon mr-2 d-flex justify-content-center align-items-center">
										<span class="icon-phone2"></span>
									</div>
									<span class="text">(+84) 979 888 999</span>
								</div>
								<div class="col-md pr-4 d-flex topper align-items-center">
									<div class="icon mr-2 d-flex justify-content-center align-items-center">
										<span class="icon-paper-plane"></span>
									</div>
									<span class="text">Nhóm 16 with ♥</span>
								</div>
								<div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
									<span class="text">3-5 Giao hàng trong ngày làm việc & Trả hàng miễn phí</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
				<div class="container">
					<a class="navbar-brand" href="index.htm"><img src="../resources/images/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
						aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="oi oi-menu"></span> Menu
					</button>

					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="index.htm" class="nav-link">Trang chủ</a></li>
							<li class="nav-item"><a href="food.htm" class="nav-link">Thức ăn</a></li>
							<li class="nav-item"><a href="drink.htm" class="nav-link">Thức uống</a></li>
							<li class="nav-item active"><a href="#" class="nav-link">Thông tin thêm</a></li>
							<li class="nav-item"><a href="blog.htm" class="nav-link">Blog</a></li>
							<li class="nav-item cta cta-colored"><a href="cart.htm" class="nav-link"><span
										class="icon-shopping_cart">Giỏ hàng</span>[
									${sessionScope['Orders_list'].size()} ]</a></li>

						</ul>
					</div>
				</div>

				<c:if test="${sessionScope['user'] != null}">

					<div class="collapse navbar-collapse pmd-navbar-sidebar" id="navbarSupportedContent"
						style="justify-content: flex-end">
						<div class="dropdown pmd-dropdown pmd-user-info">
							<a href="javascript:void(0);"
								class="btn-user dropdown-toggle media align-items-center nav-link"
								data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
								<div class="media-body">
									<h5>
										<span
											class="badge badge-pill badge-success nav-item">${sessionScope['user'].fullname}</span>
									</h5>

								</div>
							</a>
							<ul class="dropdown-menu dropdown-menu-right" role="menu">
								<a class="dropdown-item" href="${root}/home/profile.htm">Thay đổi mật khẩu</a>
								<a class="dropdown-item"
							href="${root}/home/changeinfo/${sessionScope['user'].username}.htm">Thay
							đổi thông tin cá nhân</a>
								<a class="dropdown-item" href="${root}/home/logout.htm">Đăng xuất</a>
							</ul>
						</div>
					</div>
				</c:if>
				
				<c:if test="${sessionScope['user'] == null}">
				<!-- Login  & Signup -->
				<a href="${root}/home/login.htm" role="button" class="btn btn-primary btn-sm" data-toggle="modal"
					style="margin:5px;" ">Đăng nhập</a> 
				<a href=" ${root}/home/signup.htm" role="button" class="btn btn-primary btn-sm" data-toggle="modal">Đăng ký</a>
				</c:if>

			</nav>
			<!-- END nav -->

			<div class="hero-wrap hero-bread" style="background-image: url('${root}/resources/images/bg_1.jpg');">
				<div class="container">
					<div class="row no-gutters slider-text align-items-center justify-content-center">
						<div class="col-md-9 ftco-animate text-center">
							<p class="breadcrumbs">
								<span class="mr-2"><a href="index.html">Trang chủ</a></span>
								 <span>Thông tin thêm</span>
							</p>
							<h1 class="mb-0 bread">Thông tin thêm</h1>
						</div>
					</div>
				</div>
			</div>

			<section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
				<div class="container">
					<div class="row">
						<div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(${root}/resources/images/about.jpg);">
							<a href="https://vimeo.com/45830194"
								class="icon popup-vimeo d-flex justify-content-center align-items-center">
								<span class="icon-play"></span>
							</a>
						</div>
						<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
							<div class="heading-section-bold mb-4 mt-md-5">
								<div class="ml-md-0">
									<h2 class="mb-4">FAST FOOD</h2>
								</div>
							</div>
							<div class="pb-md-5">
								<!-- <p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
									Separated they live in Bookmarksgrove right at the coast of the
									Semantics, a large language ocean.</p>
								<p>But nothing the copy said could convince her and so it
									didn’t take long until a few insidious Copy Writers ambushed her,
									made her drunk with Longe and Parole and dragged her into their
									agency, where they abused her for their.</p>
								<p> -->
									<a href="#" class="btn btn-primary">Mua ngay!</a>
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
							<h2 style="font-size: 22px;" class="mb-0">Đăng ký nhận tin mới</h2>
							<span>Để lại email để nhận những ưu đãi mới nhất</span>
						</div>
						<div class="col-md-6 d-flex align-items-center">
							<form action="#" class="subscribe-form">
								<div class="form-group d-flex">
									<input type="text" class="form-control" placeholder="Điền email tại đây"> <input
										type="submit" value="Subscribe" class="submit px-3">
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
								<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
									<div class="block-18 text-center">
										<div class="text">
											<strong class="number" data-number="10000">0</strong> <span>Khách hàng hài lòng</span>
										</div>
									</div>
								</div>
								<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
									<div class="block-18 text-center">
										<div class="text">
											<strong class="number" data-number="100">0</strong> <span>Sản phẩm</span>
										</div>
									</div>
								</div>
								<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
									<div class="block-18 text-center">
										<div class="text">
											<strong class="number" data-number="1000">0</strong> <span>Đối tác</span>
										</div>
									</div>
								</div>
								<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
									<div class="block-18 text-center">
										<div class="text">
											<strong class="number" data-number="100">0</strong> <span>Giải thưởng</span>
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
							<span class="subheading">FAST FOOD</span>
							<h2 class="mb-4">Phản hồi của khách hàng</h2>
							<p>Fast Food</p>
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
											<p class="mb-5 pl-4 line">Ngon quá, ngon quá, thực sự quá ngon.</p>
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
											<p class="mb-5 pl-4 line">Món nào cũng có... Chỉ thiếu tôi.</p>
											<p class="name">Garreth Smith</p>
											<span class="position">Officer</span>
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
											<p class="mb-5 pl-4 line">Không thể chê vào đâu được!.</p>
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
											<p class="mb-5 pl-4 line">Tuyệt vời ông mặt trời.</p>
											<p class="name">Garreth Smith</p>
											<span class="position">Developer</span>
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
											<p class="mb-5 pl-4 line">Siêu ngon và rẻ.</p>
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

			<section class="ftco-section">
				<div class="container">
					<div class="row no-gutters ftco-services">
						<div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
							<div class="media block-6 services mb-md-0 mb-4">
								<div
									class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
									<span class="flaticon-shipped"></span>
								</div>
								<div class="media-body">
									<h3 class="heading">Miễn phí giao hàng</h3>
									<span>Hoá đơn trên 100.000 VNĐ</span>
								</div>
							</div>
						</div>
						<div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
							<div class="media block-6 services mb-md-0 mb-4">
								<div
									class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
									<span class="flaticon-diet"></span>
								</div>
								<div class="media-body">
									<h3 class="heading">Nguyên liệu được chọn lọc</h3>
									<span>Luôn tươi ngon đảm bảo an toàn</span>
								</div>
							</div>
						</div>
						<div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
							<div class="media block-6 services mb-md-0 mb-4">
								<div
									class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
									<span class="flaticon-award"></span>
								</div>
								<div class="media-body">
									<h3 class="heading">Chất lượng sản phẩm</h3>
									<span>Siêu chất lượng!</span>
								</div>
							</div>
						</div>
						<div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
							<div class="media block-6 services mb-md-0 mb-4">
								<div
									class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
									<span class="flaticon-customer-service"></span>
								</div>
								<div class="media-body">
									<h3 class="heading">Hoạt động</h3>
									<span>24/7</span>
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
								<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
							</a>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">FAST FOOD</h2>
								<p>Thế giới đồ ăn nhanh</p>
								<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
									<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a>
									</li>
									<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a>
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
										<li><a href="#" class="py-2 d-block">Shipping Information</a></li>
										<li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
										<li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
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
										<li><span class="icon icon-map-marker"></span>
											<span class="text">97 Man Thiện, Phường Hiệp Phú, Quận 9, TP Thủ
												Đức</span>
										</li>
										<li><a href="#"><span class="icon icon-phone"></span><span
													class="text">+84 979 888 999</span></a></li>
										<li><a href="#"><span class="icon icon-envelope"></span><span
													class="text">fastfood@codevn.tk</span></a></li>
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
					<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
					<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
						stroke="#F96D00" />
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
			
		</body>

		</html>