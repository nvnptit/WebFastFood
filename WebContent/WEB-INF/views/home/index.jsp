<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<link rel="shortcut icon" type="image/x-icon"
	href="${root}/resources/images/hamburger.png" />
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

<link rel="stylesheet"
	href="${root}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/css/animate.css">

<link rel="stylesheet" href="${root}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${root}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${root}/resources/css/magnific-popup.css">

<link rel="stylesheet" href="${root}/resources/css/aos.css">

<link rel="stylesheet" href="${root}/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="${root}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${root}/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="${root}/resources/css/flaticon.css">
<link rel="stylesheet" href="${root}/resources/css/icomoon.css">
<link rel="stylesheet" href="${root}/resources/css/style.css">
</head>

<body class="goto-here">
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<c:if test="${not empty message}">
		<div class="alert alert-success" role="alert">${message}</div>
	</c:if>

	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<c:forEach var="item" items="${slides}">
				<div class="slider-item"
					style="background-image: url(${root}/resources/images/slides/${item.img});">
					<div class="overlay"></div>
					<div class="container">
						<div
							class="row slider-text justify-content-center align-items-center"
							data-scrollax-parent="true">

							<div class="col-md-12 ftco-animate text-center">
								<h1 class="mb-2">${item.caption}</h1>
								<h2 class="subheading mb-4">${item.content}</h2>
								<p>
									<a href="#" class="btn btn-primary"><s:message
											code="home.SeeMoreHere" /></a>
								</p>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>

	<%@include file="/WEB-INF/views/include/service.jsp"%>

	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6 order-md-last align-items-stretch d-flex">
							<div
								class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
								style="background-image: url(${root}/resources/images/category.jpg);">
								<div class="text text-center">
									<h2>
										<s:message code="home.Head5" />
									</h2>
									<p>
										<s:message code="home.Body5" />
									</p>
									<p>
										<a href="food.htm" class="btn btn-primary"><s:message
												code="home.BuyNow" /></a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div
								class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
								style="background-image: url(${root}/resources/images/cacLoaiBanh.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="food.htm"><s:message code="home.Cake" /></a>
									</h2>
								</div>
							</div>
							<div
								class="category-wrap ftco-animate img d-flex align-items-end"
								style="background-image: url(${root}/resources/images/cacLoaiNuoc.jpg);">
								<div class="text px-3 py-1">
									<h2 class="mb-0">
										<a href="drink.htm"><s:message code="home.Drink" /></a>
									</h2>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div
						class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
						style="background-image: url(${root}/resources/images/doAnVat.jpg);">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a href="food.htm"><s:message code="home.Snacks" /></a>
							</h2>
						</div>
					</div>
					<div class="category-wrap ftco-animate img d-flex align-items-end"
						style="background-image: url(${root}/resources/images/image_6.jpg);">
						<div class="text px-3 py-1">
							<h2 class="mb-0">
								<a href="#"><s:message code="home.Fruit" /></a>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-6 heading-section text-center ftco-animate">
					<h1 class="mb-4">
						<s:message code="home.Featured" />
					</h1>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var="p" items="${products}" begin="0" end="7">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="#" class="img-prod"><img class="img-fluid"
								src="${root}/resources/images/products/${p.img}" alt="Image">
								<span class="status" id="disc">${p.discount}%</span>
								<div class="overlay"></div> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="${root}/home/single/${p.id}.htm">${p.name}</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="text text-center" id="price_org">${p.price}
												VNĐ</span><br> <span class="price-sale" id="price_dis"></span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-2">
									<div class="m-auto d-flex">
										<form method="post" action="${root}/home/addCart.htm">
											<s:message code="general.AddToCart" var="addToCart" />
											<input type="hidden" value="${p.id}" name="id" /> <input
												type="submit" value="${addToCart}" name="btnOK"
												class="btn btn-black py-1 px-1" />
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="ftco-section img"
		style="background-image: url(${root}/resources/images/sale1.jpg);">
		<div class="container">
			<div class="row justify-content-start">
				<div
					class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
					<span class="subheading">Ưu đãi cho bạn!!!!</span>
					<h2 class="mb-4">Giảm giá ngay trong hôm nay!</h2>
					<h3>
						<a href="#">Khoai tây chiên</a>
					</h3>
					<span class="price" style="color: red;">Giảm giá 10%</span>
					<div id="timer" class="d-flex mt-5">
						<div class="time" id="days"></div>
						<div class="time pl-3" id="hours"></div>
						<div class="time pl-3" id="minutes"></div>
						<div class="time pl-3" id="seconds"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/WEB-INF/views/include/feedback.jsp"%>

	<hr>

	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Đăng ký nhận thông
						tin mới nhất</h2>
					<span>Đăng ký ngay để nhận được nhiều món ngon và ưu đãi!!!</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control"
								placeholder="Điền email tại đây"> <input type="submit"
								value="Subscribe" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>

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

	<script src="${root}/resources/js/main.js"></script>


</body>

</html>