<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="ptithcm.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<link rel="shortcut icon" type="image/x-icon"
	href="${root}/resources/images/hamburger.png" />

<head>
<title>Giỏ hàng</title>
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

	<div class="hero-wrap hero-bread"
		style="background-image: url('${root}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">
						<s:message code="cart.Header" />
					</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">

		<div class="container">
			<form method=POST action="record.htm" >
				<div class="row">
					<div class="col-md-12 ftco-animate">


						<table class="table" id="tab_logic">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th><s:message code="general.ProductName" /></th>
									<th><s:message code="general.Image" /></th>
									<th><s:message code="general.Price" /></th>
									<th><s:message code="general.Quantity" /></th>
									<th><s:message code="general.Discount" /> (%)</th>
									<th><s:message code="general.Total" /></th>
								</tr>

							</thead>
							<tbody>
								<c:forEach var="p" items="${sessionScope['Orders_list']}">
									<tr class="text-center">
										<td class="product-remove">
										<button class="btn btn-primary py-3 px-4" style="background-color: #f23939" type="submit"
												value="${p.id}" name="deleteItem">X</button> <input
											type="hidden" name="id" class="form-control" value="${p.id}">
										</td>

										<td class="product-name">
											<h3>${p.name}</h3> <input type="hidden" name="name"
											class="form-control" value="${p.name}">
										</td>
										<td class="image-prod">
											<div class="img"
												style="background-image:url(${root}/resources/images/products/${p.img});">
											</div>
										</td>
										<td>
											<div class="input-group mb-3">
												<input type="number" name="price"
													class="form-control input-number price" value="${p.price}"
													readonly>
											</div>
										</td>

										<td>
											<div class="input-group mb-3">
												<input type="number" name="quantity" id="${p.id}"
													class="form-control input-number quantity" value="1"
													min="1"
													oninput="var qty = document.getElementById(${p.id}).value; 
				if (qty > ${p.quantity}) document.getElementById(id).value=${p.quantity}; if (qty < 1) document.getElementById(id).value=1;">
											</div>
										</td>
										<td>
											<div class="input-group mb-3">
												<input type="number" name="discount"
													class="form-control input-number discount"
													value="${p.discount}" readonly />
											</div>
										</td>
										<td>
											<div class="input-group mb-3">
												<input type="number" name="total"
													class="form-control input-number total" value="${p.price}"
													readonly />
											</div>
										</td>
									</tr>
									<!-- END TR-->
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
					<c:if test="${sessionScope['user'] != null}">
				<div class="col-lg-4 mt-5 cart-wrap ftco-animate  ">
						<h2>
							<s:message code="cart.Receiver" />
						</h2>
						<div class="form-group">
							<br> <label class="form-control-label"><s:message
									code="general.FullName" /></label> <input type="text"
								class="form-control is-valid" name="receiver" id="receiver" >
						</div>
						<div class="form-group">
							<label for="uname1"><s:message code="general.Address" /></label>
							<input type="text" class="form-control is-valid" name="address"
								id="address">
						</div>
						<div class="form-group">
							<label for="uname1"><s:message code="general.Phone" /></label> <input
								type="text" class="form-control is-valid" name="sdt" id="sdt"
								maxlength="10">
						</div>

					<div class="cart-total mb-3">
						<h3>
							<s:message code="cart.Head" />
						</h3>

						<p class="d-flex total-price">
							<span><s:message code="cart.Body" /></span> <input type="number"
								name='total_amount' id="total_amount" placeholder='0.00'
								class="form-control" readonly />
						</p>
					</div>
					
						<p>
							<button  class="btn btn-primary py-3 px-4"
								id="btnCart" name="payCart" >
								<s:message code="cart.Pay" />
							</button>
						</p>

				</div>
					</c:if>
			</form>
			
					<c:if test="${sessionScope['user'] == null}">
						<p>
							<a href="${root }/home/login.htm" role="button"
								class="btn btn-primary py-3 px-4"><s:message code="cart.Pay" /></a>
					</c:if>
		</div>

	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Đăng ký nhận thông
						tin mới nhất</h2>
					<span>Get e-mail updates about our latest shops and special
						offers</span>
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
	<!-- <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- <script src="${root}/resources/js/google-map.js"></script> -->
	<script src="${root}/resources/js/main.js"></script>

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

			$('#tab_logic tbody').on('keyup change', function() {
				calc();
			});
			$('#tax').on('keyup change', function() {
				calc_total();
			});
			calc();
		});

		function calc() {
			$('#tab_logic tbody tr').each(
					function(i, element) {
						var html = $(this).html();
						if (html != '') {
							var qty = $(this).find('.quantity').val();
							var price = $(this).find('.price').val();
							var discount = $(this).find('.discount').val();
							$(this).find('.total').val(
									qty * price * (100 - discount) / 100);

							calc_total();
						}
					});
		}

		function calc_total() {
			total = 0;
			$('.total').each(function() {
				total += parseInt($(this).val());
			});
			$('#total_amount').val(total);
		}
	</script>


</body>

</html>