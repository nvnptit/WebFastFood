<%@ page pageEncoding="utf-8"%>
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
<title>Trang quản trị</title>

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
							<div class="form-header">
								<input class="au-input au-input--xl" type="text" name="search"
									placeholder="Tìm kiếm dữ liệu và báo cáo" />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
							
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
								<div class="overview-wrap">
									<h2 class="title-1">Báo cáo tổng quan</h2>
									<button class="au-btn au-btn-icon au-btn--blue">
										<i class="zmdi zmdi-plus"></i>Thêm báo cáo
									</button>
								</div>
							</div>
						</div>
						<div class="row m-t-25">
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c1">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-account-o"></i>
											</div>
											<div class="text">
												<h2>${sUsers}</h2>
												<span>thành viên đang hoạt động</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart1"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c2">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-shopping-cart"></i>
											</div>
											<div class="text">
												<h2>${sProducts}</h2>
												<span>Sản phẩm</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart2"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c3">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-calendar-note"></i>
											</div>
											<div class="text">
												<h2>${sOrders}</h2>
												<span>Hoá đơn</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart3"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 col-lg-3">
								<div class="overview-item overview-item--c4">
									<div class="overview__inner">
										<div class="overview-box clearfix">
											<div class="icon">
												<i class="zmdi zmdi-money"></i>
											</div>
											<div class="text">
												<h2>${money}<br>VNĐ</h2>
												<span>Tổng thu nhập</span>
											</div>
										</div>
										<div class="overview-chart">
											<canvas id="widgetChart4"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="au-card recent-report">
									<div class="au-card-inner">
										<h3 class="title-2">Báo cáo hiện tại</h3>
										<div class="chart-info">
											<div class="chart-info__left">
												<div class="chart-note">
													<span class="dot dot--blue"></span> <span>Sản phẩm</span>
												</div>
												<div class="chart-note mr-0">
													<span class="dot dot--green"></span> <span>Dịch vụ</span>
												</div>
											</div>
											<div class="chart-info__right">
												<div class="chart-statis">
													<span class="index incre"> <i
														class="zmdi zmdi-long-arrow-up"></i>25%
													</span> <span class="label">Sản phẩm</span>
												</div>
												<div class="chart-statis mr-0">
													<span class="index decre"> <i
														class="zmdi zmdi-long-arrow-down"></i>10%
													</span> <span class="label">Dịch vụ</span>
												</div>
											</div>
										</div>
										<div class="recent-report__chart">
											<canvas id="recent-rep-chart"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="au-card chart-percent-card">
									<div class="au-card-inner">
										<h3 class="title-2 tm-b-5">Biểu đồ %</h3>
										<div class="row no-gutters">
											<div class="col-xl-6">
												<div class="chart-note-wrap">
													<div class="chart-note mr-0 d-block">
														<span class="dot dot--blue"></span> <span>Sản phẩm</span>
													</div>
													<div class="chart-note mr-0 d-block">
														<span class="dot dot--red"></span> <span>Dịch vụ</span>
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="percent-chart">
													<canvas id="percent-chart"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%-- <div class="row">
							<div class="col-lg-14">
								<h2 class="title-1 m-b-25">Thu nhập theo mặt hàng</h2>
								<div class="table-responsive table--no-card m-b-40">
									<table
										class="table table-borderless table-striped table-earning">
										<thead>
											<tr>
												<th>Ngày tháng</th>
												<th>ID hoá đơn</th>
												<th>Người mua</th>
												<th>Tên sản phẩm</th>
												<th>Số lượng</th>
												<th class="text-right">Tổng tiền</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="o" items="${orders}">
												<tr>
													<td>${o.date}</td>
													<td>${o.id}</td>
													<td>${o.usernameid.fullname}</td>
													<td>${o.id_product.name}</td>
													<td>${o.amount}</td>
													<td class="text-right">${o.total}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div> --%>
						<div class="row">
							<div class="col-lg-14">
								<h2 class="title-1 m-b-25">Thu nhập theo mặt hàng</h2>
								<div class="table-responsive table--no-card m-b-40">
									<table
										class="table table-borderless table-striped table-earning">
										<thead>
											<tr>
												<th>ID</th>
												<th>Tên sản phẩm</th>
												<th>Loại sản phẩm</th>
												<th>Số lượng còn lại</th>
												<th>Số lượng đã bán</th>
												<th class="text-right">Tổng doanh thu</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="l" items="${product_orders}">
												<tr>
													<td>${l[0]}</td>
													<td>${l[1]}</td>
													<td>${l[2]}</td>
													<td>${l[3]}</td>
													<td>${l[5]}</td>
													<td class="text-right">${l[6]}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
									<div class="au-card-title"
										style="
                        background-image: url('${root}/resources/images/bg-title-01.jpg');
                      ">
										<div class="bg-overlay bg-overlay--blue"></div>
										<h3>
											<i class="zmdi zmdi-account-calendar"></i>26 April, 2021
										</h3>
										<button class="au-btn-plus">
											<i class="zmdi zmdi-plus"></i>
										</button>
									</div>
									<div class="au-task js-list-load">
										<div class="au-task__title">
											<p>Tasks for John Doe</p>
										</div>
										<div class="au-task-list js-scrollbar3">
											<div class="au-task__item au-task__item--danger">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Meeting about plan for Admin Template 2021</a>
													</h5>
													<span class="time">10:00 AM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--warning">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Create new task for Dashboard</a>
													</h5>
													<span class="time">11:00 AM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--primary">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Meeting about plan for Admin Template 2021</a>
													</h5>
													<span class="time">02:00 PM</span>
												</div>
											</div>
											<div class="au-task__item au-task__item--success">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Create new task for Dashboard</a>
													</h5>
													<span class="time">03:30 PM</span>
												</div>
											</div>
											<div
												class="
                            au-task__item au-task__item--danger
                            js-load-item
                          ">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Meeting about plan for Admin Template 2021</a>
													</h5>
													<span class="time">10:00 AM</span>
												</div>
											</div>
											<div
												class="
                            au-task__item au-task__item--warning
                            js-load-item
                          ">
												<div class="au-task__item-inner">
													<h5 class="task">
														<a href="#">Tạo nhiệm vụ mới cho trang bảng biểu</a>
													</h5>
													<span class="time">11:00 AM</span>
												</div>
											</div>
										</div>
										<div class="au-task__footer">
											<button class="au-btn au-btn-load js-load-btn">Xem
												nhiều hơn</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
									<div class="au-card-title"
										style="
                        background-image: url('${root}/resources/images/bg-title-02.jpg');
                      ">
										<div class="bg-overlay bg-overlay--blue"></div>
										<h3>
											<i class="zmdi zmdi-comment-text"></i>Tin nhắn mới
										</h3>
										<button class="au-btn-plus">
											<i class="zmdi zmdi-plus"></i>
										</button>
									</div>
									<div class="au-inbox-wrap js-inbox-wrap">
										<div class="au-message js-list-load">
											<div class="au-message__noti">
												<p>
													Bạn có <span>2</span> tin nhắn mới
												</p>
											</div>
											<div class="au-message-list">
												<div class="au-message__item unread">
													<div class="au-message__item-inner">
														<div class="au-message__item-text">
															<div class="avatar-wrap">
																<div class="avatar">
																	<img src="${root}/resources/images/icon/avatar-02.jpg"
																		alt="John Smith" />
																</div>
															</div>
															<div class="text">
																<h5 class="name">John Smith</h5>
																<p>Đã gửi cho bạn một ảnh</p>
															</div>
														</div>
														<div class="au-message__item-time">
															<span>12 phút trước</span>
														</div>
													</div>
												</div>
												<div class="au-message__item unread">
													<div class="au-message__item-inner">
														<div class="au-message__item-text">
															<div class="avatar-wrap online">
																<div class="avatar">
																	<img src="${root}/resources/images/icon/avatar-03.jpg"
																		alt="Nicholas Martinez" />
																</div>
															</div>
															<div class="text">
																<h5 class="name">Nicholas Martinez</h5>
																<p>Bạn có một tin nhắn</p>
															</div>
														</div>
														<div class="au-message__item-time">
															<span>11:00 PM</span>
														</div>
													</div>
												</div>
												<div class="au-message__item">
													<div class="au-message__item-inner">
														<div class="au-message__item-text">
															<div class="avatar-wrap online">
																<div class="avatar">
																	<img src="${root}/resources/images/icon/avatar-04.jpg"
																		alt="Michelle Sims" />
																</div>
															</div>
															<div class="text">
																<h5 class="name">Michelle Sims</h5>
																<p>Lorem ipsum dolor sit amet</p>
															</div>
														</div>
														<div class="au-message__item-time">
															<span> Ngày hôm qua</span>
														</div>
													</div>
												</div>
												<div class="au-message__item">
													<div class="au-message__item-inner">
														<div class="au-message__item-text">
															<div class="avatar-wrap">
																<div class="avatar">
																	<img src="${root}/resources/images/icon/avatar-05.jpg"
																		alt="Michelle Sims" />
																</div>
															</div>
															<div class="text">
																<h5 class="name">Michelle Sims</h5>
																<p>Purus feugiat finibus</p>
															</div>
														</div>
														<div class="au-message__item-time">
															<span>Chủ nhật</span>
														</div>
													</div>
												</div>
												<div class="au-message__item js-load-item">
													<div class="au-message__item-inner">
														<div class="au-message__item-text">
															<div class="avatar-wrap online">
																<div class="avatar">
																	<img src="${root}/resources/images/icon/avatar-04.jpg"
																		alt="Michelle Sims" />
																</div>
															</div>
															<div class="text">
																<h5 class="name">Michelle Sims</h5>
																<p>Lorem ipsum dolor sit amet</p>
															</div>
														</div>
														<div class="au-message__item-time">
															<span>Ngày hôm qua</span>
														</div>
													</div>
												</div>
												<div class="au-message__item js-load-item">
													<div class="au-message__item-inner">
														<div class="au-message__item-text">
															<div class="avatar-wrap">
																<div class="avatar">
																	<img src="${root}/resources/images/icon/avatar-05.jpg"
																		alt="Michelle Sims" />
																</div>
															</div>
															<div class="text">
																<h5 class="name">Michelle Sims</h5>
																<p>Purus feugiat finibus</p>
															</div>
														</div>
														<div class="au-message__item-time">
															<span>Chủ nhật</span>
														</div>
													</div>
												</div>
											</div>
											<div class="au-message__footer">
												<button class="au-btn au-btn-load js-load-btn">Xem
													nhiều hơn</button>
											</div>
										</div>
										<div class="au-chat">
											<div class="au-chat__title">
												<div class="au-chat-info">
													<div class="avatar-wrap online">
														<div class="avatar avatar--small">
															<img src="${root}/resources/images/icon/avatar-02.jpg"
																alt="John Smith" />
														</div>
													</div>
													<span class="nick"> <a href="#">John Smith</a>
													</span>
												</div>
											</div>
											<div class="au-chat__content">
												<div class="recei-mess-wrap">
													<span class="mess-time">12 phút trước</span>
													<div class="recei-mess__inner">
														<div class="avatar avatar--tiny">
															<img src="${root}/resources/images/icon/avatar-02.jpg"
																alt="John Smith" />
														</div>
														<div class="recei-mess-list">
															<div class="recei-mess">Lorem ipsum dolor sit amet,
																consectetur adipiscing elit non iaculis</div>
															<div class="recei-mess">Donec tempor, sapien ac
																viverra</div>
														</div>
													</div>
												</div>
												<div class="send-mess-wrap">
													<span class="mess-time">30 Sec ago</span>
													<div class="send-mess__inner">
														<div class="send-mess-list">
															<div class="send-mess">Lorem ipsum dolor sit amet,
																consectetur adipiscing elit non iaculis</div>
														</div>
													</div>
												</div>
											</div>
											<div class="au-chat-textfield">
												<form class="au-form-icon">
													<input class="au-input au-input--full au-input--h65"
														type="text" placeholder="lời nhắn" />
													<button class="au-input-icon">
														<i class="zmdi zmdi-camera"></i>
													</button>
												</form>
											</div>
										</div>
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