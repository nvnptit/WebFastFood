<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<link rel="shortcut icon" type="image/x-icon"
	href="${root}/resources/images/hamburger.png" />
<title>Thức uống</title>

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

<!-- Fontfaces CSS-->
<link href="${root}/resources/css/font-face.css" rel="stylesheet"
	media="all" />
<link
	href="${root}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all" />
<link
	href="${root}/resources/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all" />
<link
	href="${root}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all" />

<link rel="stylesheet" href="${root}/resources/css/flaticon.css">
<link rel="stylesheet" href="${root}/resources/css/icomoon.css">
<link rel="stylesheet" href="${root}/resources/css/style.css">
</head>

<body class="goto-here">
	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<c:if test="${not empty message}">
		<div class="alert alert-success" role="alert">${message}</div>
	</c:if>
	<!-- phân trang -->
	<!-- khai bao -->

	<div>
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="drink.htm" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
	</div>

	<div class="hero-wrap hero-bread"
		style="background-image: url('${root}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="text-center" style="color: whitesmoke;">
						<s:message code="drink.List" />
					</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<s:message code="general.SearchHere" var="searchHere" />
						<form action="${root}/home/drink.htm" method="post">
							<input id="myInput" name="searchInput" type="text" placeholder="${searchHere}"
								style="width: 1000px; height: 50px">
							<button class="fa fa-search" name="btnSearch" type="submit"
								style="width: 100px; height: 10px; background-color: #82ae46;"></button>
						</form>
						<br>
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th><s:message code="general.ProductName" /></th>
									<th><s:message code="general.Image" /></th>
									<th><s:message code="general.Details" /></th>
									<th><s:message code="general.Price" /></th>
									<th><s:message code="general.Inventory" /></th>
									<th><s:message code="general.Category" /></th>
								</tr>
							</thead>
							<tbody id="myTable">
								<c:forEach var="p" items="${pagedListHolder.pageList}">
									<tr class="text-center">

										<td class="product-name">
											<h3>${p.name}</h3>
										</td>

										<td class="image-prod">
											<div class="img"
												style="background-image:url(${root}/resources/images/products/${p.img});">
											</div>
										</td>


										<td><a href="${root}/home/single/${p.id}.htm"> <span>
													<s:message code="general.SeeMore" /> ${p.name}
											</span></a> <c:set var="des" value="${p.description}" /> <c:set
												var="str" value="${fn:substring(des, 0, 75)}" />
											<p>${str}...</p></td>

										<td class="price">${p.price}</td>

										<td class="price">[${p.quantity}]</td>
										<td class="total">${p.type }</td>
									</tr>
									<!-- END TR-->
								</c:forEach>
							</tbody>

						</table>
						<div>
							<tg:paging pagedListHolder="${pagedListHolder}"
								pagedLink="${pagedLink}" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
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

	<!-- SEARCH -->
	<%-- <script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script> --%>
</body>

</html>