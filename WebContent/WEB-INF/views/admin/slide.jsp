<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Trình chiếu</title>

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
<link rel="stylesheet" href="${root}/resources/css/style.css">
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
							<div class="form-header">
								<input class="au-input au-input--xl" type="text" id="myInput"
									name="search" placeholder="Tìm kiếm sản phẩm..." />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
							
							<%@include file="/WEB-INF/views/include/admin/account.jsp"%>
							
						</div>
					</div>
				</div>
			</header>
			<!-- END HEADER DESKTOP-->

			<!-- Phân trang -->
			<div class="bg-light p-5 rounded">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="slide.htm" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
			</div>

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
					
						<c:if test="${not empty message}">
							<div class="alert alert-danger" role="alert">
								<h3>${message}</h3>
							</div>
						</c:if>
						
						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<h3 class="title-3 m-b-30">
									<i class="zmdi zmdi-account-calendar"></i>Danh sách trình chiếu
								</h3>
								<div class="table-responsive m-b-15">
									<table class="table table-borderless table-data3">
										<thead>
											<tr>
												<th>ID</th>
												<th>Hình ảnh</th>
												<th>Tiêu đề</th>
												<th>Nội dung</th>
												<th>Trạng thái</th>
												<th/>
												<th/>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="p" items="${pagedListHolder.pageList}">
												<tr>
													<td>${p.id}</td>
													<td><img src="../resources/images/slides/${p.img}"
														border="3" height="150" width="150"></td>
													<td>${p.caption}</td>
													<td>${p.content}</td>
													<td>
														<c:if test="${p.active = true}">Hiển thị</c:if>
														<c:if test="${p.active = false}">Tạm ẩn</c:if>
													</td>
													<td>
														<div>
															<button class="btn btn-primary"
																onclick="javascript: window.location.href='${root}/admin/slide_update/${p.id}.htm'">
																Cập nhật</button>
														</div>
													</td>
													<td>
														<div>
															<button onclick="openModalForSlide('${p.id}')"
																class="btn btn-danger">Xoá</button>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- Phân trang -->
									<div>
										<tg:paging pagedListHolder="${pagedListHolder}"
											pagedLink="${pagedLink}" />
									</div>

									<div class="user-data__footer">
										<button
											onclick="location.href='${root}/admin/form_slide.htm'"
											class="au-btn au-btn-load">Thêm trình chiếu</button>
									</div>
								</div>
							</div>
					</div>

					<!-- END DATA TABLE-->
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

	<!-- modal XOÁ SLIDE -->
	<div class="modal fade" id="staticModal2" tabindex="-1" role="dialog"
		aria-labelledby="staticModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticModalLabel">Confirm</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Bạn có chắc chắn muốn xoá trình chiếu này không?.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Thoát</button>
					<button id="buttonDeleteConfirm2" type="button"
						class="btn btn-primary">Xác nhận</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal static -->
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

	<script type="text/javascript">
		function openModalForSlide(slide) {
			$("#staticModal2").modal("show");
			$("#buttonDeleteConfirm2").click(function() {
				window.location.href = "delete/slide/" + slide + ".htm";
			});
		}
	</script>
	<script>
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
	</script>
</body>

</html>
<!-- end document-->