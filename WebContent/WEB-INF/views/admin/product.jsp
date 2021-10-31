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
<title>Dữ liệu sản phẩm</title>

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
			i++;
		}
	} else {
		response.sendRedirect("login.htm");
		return; // to stop further execution
	}
	%>
	<div class="page-wrapper">
		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
			<div class="logo">
				<a href="#"> <img src="${root}/resources/images/logo.png"
					alt="Cool Admin" />
				</a>
			</div>
			<div class="menu-sidebar__content js-scrollbar1">
				<nav class="navbar-sidebar">
					<ul class="list-unstyled navbar__list">
						<li><a class="js-arrow" href="index.htm"> <i
								class="fas fa-tachometer-alt"></i>Biểu đồ
						</a></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt active"></i>Dữ liệu
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a href="user.htm">Dữ liệu người dùng</a></li>
								<li><a href="product.htm">Dữ liệu sản phẩm</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>Mở rộng
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a href="form_user.htm">Người dùng</a></li>
								<li><a href="form_product.htm">Sản phẩm</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</aside>
		<!-- END MENU SIDEBAR-->

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
							<div class="header-button">
								<div class="noti-wrap">
									<div class="noti__item js-item-menu">
										<i class="zmdi zmdi-comment-more"></i> <span class="quantity">1</span>
										<div class="mess-dropdown js-dropdown">
											<div class="mess__title">
												<p>Bạn có 2 thông báo mới</p>
											</div>
											<div class="mess__item">
												<div class="image img-cir img-40">
													<img src="${root }/resources/images/icon/avatar-06.jpg" alt="Michelle Moreno" />
												</div>
												<div class="content">
													<h6>Michelle Moreno</h6>
													<p>Đã gửi cho bạn một ảnh</p>
													<span class="time">3 phút trước</span>
												</div>
											</div>
											<div class="mess__item">
												<div class="image img-cir img-40">
													<img src="${root }/resources/images/icon/avatar-04.jpg" alt="Diane Myers" />
												</div>
												<div class="content">
													<h6>Diane Myers</h6>
													<p>Bạn có một tin nhắn</p>
													<span class="time">Yesterday</span>
												</div>
											</div>
											<div class="mess__footer">
												<a href="#">Xem tất cả tin nhắn</a>
											</div>
										</div>
									</div>
									<div class="noti__item js-item-menu">
										<i class="zmdi zmdi-email"></i> <span class="quantity">1</span>
										<div class="email-dropdown js-dropdown">
											<div class="email__title">
												<p>Bạn có 3 Emails mới</p>
											</div>
											<div class="email__item">
												<div class="image img-cir img-40">
													<img src="${root }/resources/images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
												</div>
												<div class="content">
													<p>Về đề xuất mới.</p>
													<span>Cynthia Harvey, 3 phút trước</span>
												</div>
											</div>
											<div class="email__item">
												<div class="image img-cir img-40">
													<img src="${root }/resources/images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
												</div>
												<div class="content">
													<p>Về đề xuất mới.</p>
													<span>Cynthia Harvey, Yesterday</span>
												</div>
											</div>
											<div class="email__item">
												<div class="image img-cir img-40">
													<img src="${root }/resources/images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
												</div>
												<div class="content">
													<p>Về đề xuất mới.</p>
													<span>Cynthia Harvey, April 12,,2018</span>
												</div>
											</div>
											<div class="email__footer">
												<a href="#">See all emails</a>
											</div>
										</div>
									</div>
									<div class="noti__item js-item-menu">
										<i class="zmdi zmdi-notifications"></i> <span class="quantity">3</span>
										<div class="notifi-dropdown js-dropdown">
											<div class="notifi__title">
												<p>Bạn có 3 thông báo mới</p>
											</div>
											<div class="notifi__item">
												<div class="bg-c1 img-cir img-40">
													<i class="zmdi zmdi-email-open"></i>
												</div>
												<div class="content">
													<p>bạn có thông báo Email</p>
													<span class="date">October 12, 2021 06:50</span>
												</div>
											</div>
											<div class="notifi__item">
												<div class="bg-c2 img-cir img-40">
													<i class="zmdi zmdi-account-box"></i>
												</div>
												<div class="content">
													<p>Tài khoản của bạn đã bị khoá</p>
													<span class="date">October 12, 2021 06:50</span>
												</div>
											</div>
											<div class="notifi__item">
												<div class="bg-c3 img-cir img-40">
													<i class="zmdi zmdi-file-text"></i>
												</div>
												<div class="content">
													<p>Bạn có dữ liệu mới</p>
													<span class="date">October 12, 2021 06:50</span>
												</div>
											</div>
											<div class="notifi__footer">
												<a href="#">Tất cả thông báo</a>
											</div>
										</div>
									</div>
								</div>
								<div class="account-wrap">
									<div class="account-item clearfix js-item-menu">
										<div class="image">
											<img src="${root}/resources/images/icon/avt.png"
												alt="John Doe" />
										</div>
										<div class="content">
											<a class="js-acc-btn" href="#">${sessionScope['user1'].fullname}</a>
										</div>
										<div class="account-dropdown js-dropdown">
											<div class="info clearfix">
												<div class="image">
													<a href="#"> <img
														src="${root}/resources/images/icon/avt.png"
														alt="${username}" />
													</a>
												</div>
												<div class="content">
													<h5 class="name">
														<a href="#">${sessionScope['user1'].username}</a>
													</h5>
													<span class="email">${sessionScope['user1'].email}</span>
												</div>
											</div>
											<div class="account-dropdown__body">
												<div class="account-dropdown__item">
													<a href="#"> <i class="zmdi zmdi-account"></i>Tài khoản
													</a>
												</div>
												<div class="account-dropdown__item">
													<a href="#"> <i class="zmdi zmdi-settings"></i>Cài đặt
													</a>
												</div>
												<div class="account-dropdown__item">
													<a href="changepassword.htm"> <i
														class="zmdi zmdi-money-box"></i>Thay đổi mật khẩu
													</a>
												</div>
											</div>
											<div class="account-dropdown__footer">
												<a href="logout.htm"> <i class="zmdi zmdi-power"></i>Đăng
													xuất
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<!-- END HEADER DESKTOP-->

			<!-- Phân trang -->
			<div class="bg-light p-5 rounded">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="product.htm" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
			</div>

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="row m-t-30">
								<div class="col-md-12">
									<!-- DATA TABLE-->
									<h3 class="title-3 m-b-30">

										<i class="zmdi zmdi-account-calendar"></i>Dữ liệu sản phẩm
									</h3>
									<div class="table-responsive m-b-15">
										<table class="table table-borderless table-data3">
											<thead>
												<tr>
													<th>
														&#160;&#160;&#160;&#160;&#160;Tên&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
													</th>
													<th>Loại</th>
													<th>Số lượng</th>
													<th>Giá</th>
													<th>Thông tin</th>
													<th>Hình ảnh</th>
													<th>Mở rộng</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="myTable">
												<c:forEach var="p" items="${pagedListHolder.pageList}">
													<tr>
														<td>${p.name}</td>
														<td>${p.type}</td>
														<td>${p.quantity}</td>
														<td>${p.price}</td>
														<td>${p.description}</td>
														<td><img src="../resources/images/products/${p.img}"
															border="3" height="150" width="150"></td>
														<td>
															<div>
																<button class="btn btn-primary"
																	onclick="javascript: window.location.href='${root}/admin/product_update/${p.id}.htm'">
																	Cập nhật</button>
															</div>
														</td>
														<td>
															<div>
																<button onclick="openModalForProduct('${p.id}')"
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
												onclick="location.href='${root}/admin/form_product.htm'"
												class="au-btn au-btn-load">Thêm mới sản phẩm</button>
										</div>
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

	<!-- modal XOÁ PRODUCT -->
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
					<p>Bạn có chắc chắn muốn xoá không?.</p>
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
		function openModalForProduct(product) {
			$("#staticModal2").modal("show");
			$("#buttonDeleteConfirm2").click(function() {
				window.location.href = "delete/product/" + product + ".htm";
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