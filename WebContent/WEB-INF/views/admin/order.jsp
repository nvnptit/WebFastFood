<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />

<head>
<!-- Required meta tags-->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Title Page-->
<title>Hóa đơn</title>

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
							<form action="${root}/admin/order.htm" method="post">
								<div class="form-header">
									<input class="au-input au-input--xl" type="text"
										name="searchInput" placeholder="Tìm kiếm hoá đơn..." />
									<button class="au-btn--submit" type="submit" name="btnSearch">
										<i class="zmdi zmdi-search"></i>
									</button>
								</div>
							</form>

							<%@include file="/WEB-INF/views/include/admin/account.jsp"%>

						</div>
					</div>
				</div>
			</header>
			<!-- HEADER DESKTOP-->

			<!-- Phân trang -->
			<div class="bg-light p-5 rounded">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="order.htm" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
			</div>

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-14">
								<h2 class="title-1 m-b-25">
									<i class="fa fa-sticky-note" aria-hidden="true"></i> Danh sách
									hóa đơn
								</h2>
								<div class="table-responsive table--no-card m-b-40">
									<table
										class="table table-borderless table-striped table-earning">
										<thead>
											<tr>
												<th>Ngày tháng</th>
												<th>ID hoá đơn</th>
												<th>Người mua</th>
												<th>Tên sản phẩm</th>
												<th>Số lượng mua</th>
												<th class="text-right">Tổng tiền</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="o" items="${pagedListHolder.pageList}">
												<tr>
													<td><fmt:formatDate value="${o.date}"
															pattern="dd-MM-yyyy" /></td>
													<td>${o.id}</td>
													<td>${o.usernameid.fullname}</td>
													<td>${o.id_product.name}</td>
													<td class="text-right">${o.amount}</td>
													<td class="text-right"><fmt:formatNumber
															value="${o.total}" pattern="###,### đ" type="currency" />
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>



								</div>
							</div>
						</div>
					</div>
					<!-- Phân trang -->
					<div>
						<tg:paging pagedListHolder="${pagedListHolder}"
							pagedLink="${pagedLink}" />
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
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