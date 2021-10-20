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
<title>Tables</title>

<!-- Fontfaces CSS-->
<link href="${root}/resources/css/font-face.css"
	rel="stylesheet" media="all">
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
<link
	href="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="${root}/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="${root}/resources/css/theme.css"
	rel="stylesheet" media="all">

</head>

<body class="animsition">
	<%
		Cookie[] cks = request.getCookies();
		if (cks != null) {
			for (int i = 0; i < cks.length; i++) {
				String name = cks[i].getName();
				String value = cks[i].getValue();
				if (name.equals("auth")) {
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
				<a href="#"> <img
					src="${root}/resources/images/icon/logo.png"
					alt="Cool Admin" />
				</a>
			</div>
			<div class="menu-sidebar__content js-scrollbar1">
				<nav class="navbar-sidebar">
					<ul class="list-unstyled navbar__list">
						<li><a class="js-arrow" href="index.htm"> <i
								class="fas fa-tachometer-alt"></i>Dashboard
						</a></li>
						<li class="active"><a href="table.htm"> <i
								class="fas fa-table"></i>Tables
						</a></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>Form
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a href="form_user.htm">Form User</a></li>
								<li><a href="form_product.htm">Form Product</a></li>
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
							<form class="form-header" action="" method="POST">
								<input class="au-input au-input--xl" type="text" name="search"
									placeholder="Search for datas &amp; reports..." />
								<button class="au-btn--submit" type="submit">
									<i class="zmdi zmdi-search"></i>
								</button>
							</form>
							<div class="header-button">
								<div class="noti-wrap">
									<div class="noti__item js-item-menu">
										<i class="zmdi zmdi-comment-more"></i> <span class="quantity">1</span>
										<div class="mess-dropdown js-dropdown">
											<div class="mess__title">
												<p>You have 2 news message</p>
											</div>
											<div class="mess__item">
												<div class="image img-cir img-40">
													<img src="images/icon/avatar-06.jpg" alt="Michelle Moreno" />
												</div>
												<div class="content">
													<h6>Michelle Moreno</h6>
													<p>Have sent a photo</p>
													<span class="time">3 min ago</span>
												</div>
											</div>
											<div class="mess__item">
												<div class="image img-cir img-40">
													<img src="images/icon/avatar-04.jpg" alt="Diane Myers" />
												</div>
												<div class="content">
													<h6>Diane Myers</h6>
													<p>You are now connected on message</p>
													<span class="time">Yesterday</span>
												</div>
											</div>
											<div class="mess__footer">
												<a href="#">View all messages</a>
											</div>
										</div>
									</div>
									<div class="noti__item js-item-menu">
										<i class="zmdi zmdi-email"></i> <span class="quantity">1</span>
										<div class="email-dropdown js-dropdown">
											<div class="email__title">
												<p>You have 3 New Emails</p>
											</div>
											<div class="email__item">
												<div class="image img-cir img-40">
													<img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
												</div>
												<div class="content">
													<p>Meeting about new dashboard...</p>
													<span>Cynthia Harvey, 3 min ago</span>
												</div>
											</div>
											<div class="email__item">
												<div class="image img-cir img-40">
													<img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
												</div>
												<div class="content">
													<p>Meeting about new dashboard...</p>
													<span>Cynthia Harvey, Yesterday</span>
												</div>
											</div>
											<div class="email__item">
												<div class="image img-cir img-40">
													<img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
												</div>
												<div class="content">
													<p>Meeting about new dashboard...</p>
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
												<p>You have 3 Notifications</p>
											</div>
											<div class="notifi__item">
												<div class="bg-c1 img-cir img-40">
													<i class="zmdi zmdi-email-open"></i>
												</div>
												<div class="content">
													<p>You got a email notification</p>
													<span class="date">April 12, 2018 06:50</span>
												</div>
											</div>
											<div class="notifi__item">
												<div class="bg-c2 img-cir img-40">
													<i class="zmdi zmdi-account-box"></i>
												</div>
												<div class="content">
													<p>Your account has been blocked</p>
													<span class="date">April 12, 2018 06:50</span>
												</div>
											</div>
											<div class="notifi__item">
												<div class="bg-c3 img-cir img-40">
													<i class="zmdi zmdi-file-text"></i>
												</div>
												<div class="content">
													<p>You got a new file</p>
													<span class="date">April 12, 2018 06:50</span>
												</div>
											</div>
											<div class="notifi__footer">
												<a href="#">All notifications</a>
											</div>
										</div>
									</div>
								</div>
								<div class="account-wrap">
									<div class="account-item clearfix js-item-menu">
										<div class="image">
											<img
												src="${root}/resources/images/icon/avt.png"
												alt="John Doe" />
										</div>
										<div class="content">
											<a class="js-acc-btn" href="#">${sessionScope['user'].fullname}</a>
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
														<a href="#">${sessionScope['user'].username}</a>
													</h5>
													<span class="email">${sessionScope['user'].email}</span>
												</div>
											</div>
											<div class="account-dropdown__body">
												<div class="account-dropdown__item">
													<a href="#"> <i class="zmdi zmdi-account"></i>Account
													</a>
												</div>
												<div class="account-dropdown__item">
													<a href="#"> <i class="zmdi zmdi-settings"></i>Setting
													</a>
												</div>
												<div class="account-dropdown__item">
													<a href="changepassword.htm"> <i
														class="zmdi zmdi-money-box"></i>Change Password
													</a>
												</div>
											</div>
											<div class="account-dropdown__footer">
												<a href="logout.htm"> <i class="zmdi zmdi-power"></i>Logout
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

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<!-- USER DATA-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>user data
									</h3>
									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<td>Username</td>
													<td>Full Name</td>
													<td>Email</td>
													<td>role</td>
													<td>Phone</td>
													<td>Update</td>
													<td>Delete</td>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="u" items="${users}">
													<tr>
														<td>${u.username}</td>
														<td>
															<div>
																<span>${u.fullname}</span>
															</div>
														</td>
														<td><span>${u.email}</span></td>
														<td><span class="role ${u.role}">${u.role}</span></td>
														<td>${u.phone}</td>
														<td>
															<div>
																<button class="btn btn-primary" onclick="javascript: window.location.href='${root}/resources/admin/form_user/${u.username}.htm'">Update</button>
															</div>
														</td>
														<td>
															<div>
																<button onclick="openModalForUser('${u.username}')" class="btn btn-danger">Delete</button>
															</div> 
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<div class="user-data__footer">
										<button onclick="location.href='form_user/insert.htm'"
											class="au-btn au-btn-load">Insert</button>
									</div>
								</div>
								<!-- END USER DATA-->
							</div>
							<div class="row m-t-30">
								<div class="col-md-12">
									<!-- DATA TABLE-->
									<div class="table-responsive m-b-40">
										<table class="table table-borderless table-data3">
											<thead>
												<tr>
													<th>&#160;&#160;&#160;&#160;&#160;NAME&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</th>
													<th>TYPE</th>
													<th>QUANTITY</th>
													<th>PRICE</th>
													<th>description</th>
													<th>image</th>
													<th>Function</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="p" items="${products}">
													<tr>
														<td>${p.name}</td>
														<td>${p.type}</td>
														<td>${p.quantity}</td>
														<td>${p.price}</td>
														<td>${p.description}</td>
														<td>${p.img}</td>
														<td>
															<div>
																<button class="btn btn-primary" onclick="javascript: window.location.href='${root}/resources/admin/product_update/${p.id}.htm'">Update</button>
															</div>
														</td>
														<td>
															<div>
																<button onclick="openModalForProduct('${p.id}')" class="btn btn-danger">Delete</button>
															</div> 
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="user-data__footer">
										<button onclick="location.href='${root}/resources/admin/form_product.htm'"
											class="au-btn au-btn-load">Insert</button>
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
								Copyright © 2018 Colorlib. All rights reserved. Template by <a
									href="https://colorlib.com">Colorlib</a>.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal XOÁ USER -->
	<div class="modal fade" id="staticModal" tabindex="-1" role="dialog"
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
						data-dismiss="modal">Cancel</button>
					<button id="buttonDeleteConfirm" type="button" class="btn btn-primary">Confirm</button>
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
						data-dismiss="modal">Cancel</button>
					<button id="buttonDeleteConfirm2" type="button" class="btn btn-primary">Confirm</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal static -->
	<!-- Jquery JS-->
	<script
		src="${root}/resources/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script
		src="${root}/resources/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script
		src="${root}/resources/vendor/slick/slick.min.js">
		
	</script>
	<script
		src="${root}/resources/vendor/wow/wow.min.js"></script>
	<script
		src="${root}/resources/vendor/animsition/animsition.min.js"></script>
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
	<script
		src="${root}/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="${root}/resources/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script
		src="${root}/resources/js/main_admin.js"></script>

<script type="text/javascript">
function openModalForUser(username){
	$('#staticModal').modal('show'); 
	$('#buttonDeleteConfirm').click(function() {
		window.location.href="delete/user/" +username+ ".htm"
	})
}

function openModalForProduct(product){
	$('#staticModal2').modal('show'); 
	$('#buttonDeleteConfirm2').click(function() {
		window.location.href="delete/product/" +product+ ".htm"
	})
}
</script>
</body>

</html>
<!-- end document-->
