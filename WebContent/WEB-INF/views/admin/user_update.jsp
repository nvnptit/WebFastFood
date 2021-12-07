<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<!-- Required meta tags-->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Title Page-->
<title>Cập nhật người dùng</title>

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

<!-- Bootstrap CSS-->
<link href="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all" />

<!-- Vendor CSS-->
<link href="${root}/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all" />
<link
	href="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all" />
<link href="${root}/resources/vendor/wow/animate.css" rel="stylesheet"
	media="all" />
<link href="${root}/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all" />
<link href="${root}/resources/vendor/slick/slick.css" rel="stylesheet"
	media="all" />
<link href="${root}/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all" />
<link
	href="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all" />

<!-- Main CSS-->
<link href="${root}/resources/css/theme.css" rel="stylesheet"
	media="all" />
</head>

<body class="animsition">
	<%
	Cookie[] cks = request.getCookies();
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			String name = cks[i].getName();
			String value = cks[i].getValue();
			if (name.equals("authadmin")) {
		break; // exit the loop and continue the page
			}
			if (i == (cks.length - 1)) // if all cookie are not valid redirect to error page
			{
		response.sendRedirect("login.htm");
		return; // to stop further execution
			}
		}
	} else {
		response.sendRedirect("login.htm");
		return; // to stop further execution
	}
	%>
	<div class="page-wrapper">
		<%@include file="/WEB-INF/views/include/admin/menu.jsp"%>

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap">
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="text" name="search"
									placeholder="Tìm kiếm dữ liệu và báo cáo" />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
							
							<%@include file="/WEB-INF/views/include/admin/account.jsp"%>
							
						</div>
					</div>
				</div>
			</header>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong>Mở rộng</strong> Người dùng
									</div>
									<c:if test="${not empty message}">
										<div class="alert alert-danger" role="alert">
											<h3>${message}</h3>
										</div>
									</c:if>

									<form class="needs-validation"
										action="${root}/admin/form_user/update.htm" method="post"
										modelAttribute="user">
										<div class="card-body card-block">
											<div class="form-group">
												<label>Tên đăng nhập</label> <input
													class="au-input au-input--full form-control" type="text"
													name="username" placeholder="Tên đăng nhập"
													value="${user.username }" readonly>
											</div>
											<div class="form-group">
												<label>Họ và tên</label> <input
													class="au-input au-input--full form-control" type="text"
													name="fullname" placeholder="Họ và tên"
													value="${user.fullname }"
													oninvalid="this.setCustomValidity('Hãy nhập họ tên')"
													oninput="setCustomValidity('')" required>
											</div>
											<div class="form-group">
												<label>Email</label> <input
													class="au-input au-input--full form-control" type="email"
													name="email" placeholder="Email" value="${user.email }"
													oninvalid="this.setCustomValidity('Hãy nhập Email')"
													oninput="setCustomValidity('')" required>
											</div>
											<div class="form-group">
												<label>Số điện thoại</label> <input
													class="au-input au-input--full form-control" type="text"
													name="phone" placeholder="Số điện thoại" maxlength="10"
													value="${user.phone }"
													oninvalid="this.setCustomValidity('Hãy nhập số điện thoại')"
													oninput="setCustomValidity('')" required>
											</div>
											<div class="form-group">
												<label>Vai trò</label><br> <select id="role"
													name="role"">
													<option value="${user.role}" selected hidden>${user.role}</option>
													<option value="ADMIN"
														class="au-input au-input--full form-control">Quản
														trị</option>
													<option value="USER"
														class="au-input au-input--full form-control">Người
														dùng</option>
												</select> <br> <label>Trạng thái</label><br> <select
													id="status" name="status">
													<option value="${user.status}" selected hidden>${user.status}</option>
													<option value="true"
														class="au-input au-input--full form-control">Hoạt
														động</option>
													<option value="false"
														class="au-input au-input--full form-control">Ngừng
														hoạt động</option>
												</select>
											</div>
											<button class="btn btn-primary btn-sm" type="submit">Thay
												đổi</button>

											<button type="button" class="btn btn-danger btn-sm"
												onclick="location.href='${root}/admin/user.htm'">
												<i class="fa fa-dot-circle-o"></i> Quay trở lại
											</button>
									</form>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="copyright">
									<p>
										Copyright © 2021 Colorlib. All rights reserved. Template by <a
											href="https://colorlib.com">Colorlib</a>.
									</p>
								</div>
							</div>
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
	<script src="${root}/resources/vendor/slick/slick.min.js"></script>
	<script src="${root}/resources/vendor/wow/wow.min.js"></script>
	<script src="${root}/resources/vendor/animsition/animsition.min.js"></script>
	<script
		src="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script
		src="${root}/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="${root}/resources/vendor/counter-up/jquery.counterup.min.js"></script>
	<script
		src="${root}/resources/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="${root}/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script src="${root}/resources/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script src="${root}/resources/js/main_admin.js"></script>
</body>
</html>
<!-- end document-->
