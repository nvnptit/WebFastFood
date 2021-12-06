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
<link rel="shortcut icon" type="image/x-icon" href="${root}/resources/images/hamburger.png" />

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

	<div class="hero-wrap hero-bread"
		style="background-image: url('${root}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs"></p>
					<h1 class="mb-0 bread"><s:message code="profile.Header"/></h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form action="profile.htm" method="POST" class="billing-form">
						<h3 class="mb-4 billing-heading"><s:message code="profile.ChangePassword"/></h3>
						<c:if test="${not empty message}">
							<div class="alert alert-danger" role="alert">${message}</div>
						</c:if>
						<div class="form-group">
							<label><s:message code="profile.OldPass"/></label>
							<s:message code="profile.OldPass.Check" var="checkOldPass"/>
							<input class="form-control"
								type="password" name="oldpass"
								oninvalid="this.setCustomValidity('${checkOldPass }')"
								oninput="setCustomValidity('')" required>
						</div>
						<div class="form-group">
							<label><s:message code="profile.NewPass"/></label> 
							<s:message code="profile.NewPass.Check" var="checkNewPass"/>
							<input class="form-control"
								id="newpass" type="password" name="newpass" 
								 oninvalid="this.setCustomValidity('${checkNewPass }')"
 							oninput="setCustomValidity('')"
								required>
						</div>
						<div class="form-group">
						<label><s:message code="profile.ConfirmNewPass"/></label>
							<s:message code="profile.ConfirmNewPass.Check" var="checkConfirmNewPass"/>
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
						<button class="btn btn-info" type="submit"><s:message code="profile.ChangePassword"/></button>
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
	<!-- <script
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- <script src="${root}/resources/js/google-map.js"></script> -->
	<script src="${root}/resources/js/main.js"></script>

</body>

</html>