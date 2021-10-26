<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />

<head>
<!-- Required meta tags-->

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title Page-->
<title>Đăng ký</title>

<!-- Fontfaces CSS-->
<link href="${root}/resources/css/font-face.css" rel="stylesheet"
	media="all">
<link
	href="${root}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link href="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="${root}/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="${root}/resources/vendor/wow/animate.css" rel="stylesheet"
	media="all">
<link href="${root}/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="${root}/resources/vendor/slick/slick.css" rel="stylesheet"
	media="all">
<link href="${root}/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="${root}/resources/css/theme.css" rel="stylesheet"
	media="all">

</head>

<body class="animsition">
	<div class="page-content--bge5">
		<div style="background-color: lightgray;">
			<div class="login-wrap">
				<div class="login-content">
					<div class="login-logo">
						<a href="#"> <img
							src="${root}/resources/images/icon/admin.png" alt="CoolAdmin">
						</a>
					</div>
					<c:if test="${not empty message}">
						<div class="alert alert-danger" role="alert">${message}</div>
					</c:if>

					<div class="login-form">
						<form class="needs-validation" action="signup.htm" method="post">
							<div class="form-group">
								<label>Tên đăng nhập</label> <input
									class="au-input au-input--full form-control" type="text"
									name="username" placeholder="Tên đăng nhập" required>
							</div>
							<div class="form-group">
								<label>Họ và tên</label> <input
									class="au-input au-input--full form-control" type="text"
									name="fullname" placeholder="Họ và tên" required>
							</div>
							<div class="form-group">
								<label>Email</label> <input
									class="au-input au-input--full form-control" type="email"
									name="email" placeholder="Email" required>
							</div>
							<div class="form-group">
								<label>Số điện thoại</label> <input
									class="au-input au-input--full form-control" type="text"
									name="phone" placeholder="Số điện thoại" maxlength="10"
									required>
							</div>
							<div class="form-group">
								<label>Mật khẩu</label> <input
									class="au-input au-input--full form-control" type="text"
									name="password" placeholder="Mật khẩu" required>
							</div>
							<div class="form-group">
								<label>Nhập lại mật khẩu</label> <input
									class="au-input au-input--full form-control" type="text"
									name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
							</div>
							<input type="hidden" class="form-control form-control-lg"
								name="role" value="user">
							<!-- <div><img src="${root}/captcha/">
                                            <input style="width: 200px; height: 40px;    border: 2px solid #231fe7;
                                            border-radius: 7px;" name="captcha" type="text" id="captcha" required />
                                            <label class="mb-1">
                                                <h6 class="mb-0 text-sm">${recaptcha}</h6>
                                            </label>
                                        </div><br> -->
							<button class="au-btn au-btn--block au-btn--green m-b-20"
								type="submit">Đăng ký</button>
							<div class="login-checkbox">
								<label> <a href="${root}/home/login.htm">Bạn đã có
										tài khoản?</a>
								</label>
							</div>
						</form>
						<div class="register-link">
							<a href="#">Copyright &copy; 2021 NVN</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Jquery JS-->
	<script src="${root}/resources/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script src="${root}/resources/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script src="${root}/resources/vendor/slick/slick.min.js">
		
	</script>
	<script src="${root}/resources/vendor/wow/wow.min.js"></script>
	<script src="${root}/resources/vendor/animsition/animsition.min.js"></script>
	<script
		src="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
		
	</script>
	<script
		src="${root}/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="${root}/resources/vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script
		src="${root}/resources/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="${root}/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script src="${root}/resources/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script src="${root}/resources/js/main_admin.js"></script>

</body>

</html>
<!-- end document-->