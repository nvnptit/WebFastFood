<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<!-- Required meta tags-->
<%-- <base href="${root}/"> --%>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title Page-->
<title>Thêm sản phẩm mới</title>

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
	<%@include file="/WEB-INF/views/include/admin/cookie.jsp"%>
	
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
						<div class="row" id="PRODUCT">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<strong>Mở rộng</strong> Sản phẩm
									</div>
									<c:if test="${not empty message}">
										<div class="alert alert-danger" role="alert">
											<h3>${message}</h3>
										</div>
									</c:if>
									<div class="card-body card-block">
										<form:form action="${root}/admin/form_product/insert.htm"
											method="POST" modelAttribute="product"
											enctype="multipart/form-data">
											<div class="form-group">
												<form:input path="id" type="hidden" class="form-control" />
											</div>
											<div class="form-group">
												<label class=" form-control-label">Tên sản phẩm</label>
												<form:input path="name" type="text"
													placeholder="Tên sản phẩm" class="form-control"
													oninvalid="this.setCustomValidity('Hãy nhập tên sản phẩm')"
													oninput="setCustomValidity('')" required="required" />
											</div>
											<div class="form-group">
												<label class="form-control-label">Loại sản phẩm</label>
												<form:select path="type" type="text" class="form-control"
													items="${typeProducts}"
													oninvalid="this.setCustomValidity('Hãy chọn loại sản phẩm')"
													oninput="setCustomValidity('')" required="required" />
											</div>
											<div class="form-group">
												<label class=" form-control-label">Giá trị</label>
												<form:input path="price" type="number" placeholder="Giá trị"
													class="form-control"
													oninvalid="this.setCustomValidity('Hãy nhập giá')"
													oninput="setCustomValidity('')" required="required" min="0" />
											</div>

											<div class="form-group">
												<label class=" form-control-label">Giảm giá</label>
												<form:input path="discount" type="number"
													placeholder=" % Giảm giá" class="form-control" min="0"
													oninvalid="this.setCustomValidity('Hãy nhập % giảm giá')"
													oninput="setCustomValidity('')" required="required" />
											</div>

											<div class="form-group">
												<label class=" form-control-label">Số lượng</label>
												<form:input path="quantity" type="number"
													placeholder="Số lượng" class="form-control" min="0"
													oninvalid="this.setCustomValidity('Hãy nhập số lượng')"
													oninput="setCustomValidity('')" required="required" />
											</div>
											<div class="form-group">
												<label class=" form-control-label">Thông tin</label>
												<form:textarea path="description" rows="5" cols="20"
													placeholder="Thông tin" class="form-control"
													oninvalid="this.setCustomValidity('Hãy nhập thông tin')"
													oninput="setCustomValidity('')" required="required" />
											</div>
											<div class="form-group">
												<label class=" form-control-label">Hình ảnh</label> <br>
												<input name="file" type="file" accept="image/*" id="imgInp"
													oninvalid="this.setCustomValidity('Hãy thêm hình ảnh')"
													oninput="setCustomValidity('')" required="required" />
												<div>
													<img width="200" height="150" id="blah" src="#"
														alt="your image" />
												</div>
											</div>
											<div class="card-footer">
												<button type="submit" class="btn btn-primary btn-sm">
													<i class="fa fa-dot-circle-o"></i> Thêm
												</button>
												<button type="button" class="btn btn-danger btn-sm"
													onclick="location.href='${root}/admin/product.htm'">
													<i class="fa fa-dot-circle-o"></i> Quay trở lại
												</button>
											</div>
										</form:form>
									</div>

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
	
	<!-- Hiển thị hình ảnh trước khi upload -->
	<script type="text/javascript">
	imgInp.onchange = evt => {
		  const [file] = imgInp.files
		  if (file) {
		    blah.src = URL.createObjectURL(file)
		  }
		}
	</script>

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
