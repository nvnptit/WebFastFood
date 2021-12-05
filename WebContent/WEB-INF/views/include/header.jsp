<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="py-1 bg-primary">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">(+84) 979 888 999</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">Nhóm 16 with ♥</span>
						</div>
						<div
							class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
							<span class="text">3-5 Giao hàng trong ngày làm việc & Trả
								hàng miễn phí</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.htm"><img
				src="../resources/images/logo.png" alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li id="home-page" class="nav-item active"><a href="${root}/home/index.htm"
						class="nav-link">Trang chủ</a></li>
					<li id="food-page" class="nav-item"><a href="${root}/home/food.htm"
						class="nav-link">Thức ăn</a></li>
					<li id="drink-page" class="nav-item"><a href="${root}/home/drink.htm"
						class="nav-link">Thức uống</a></li>
					<li id="about-page" class="nav-item"><a href="${root}/home/about.htm"
						class="nav-link">Thông tin thêm</a></li>
					<li id="blog-page" class="nav-item"><a href="${root}/home/blog.htm"
						class="nav-link">Blog</a></li>
					<li id="cart-page" class="nav-item cta cta-colored"><a
						href="${root}/home/cart.htm" class="nav-link"> <span
							class="icon-shopping_cart">Giỏ hàng </span>[${sessionScope['Orders_list'].size()}]
					</a></li>

				</ul>
			</div>
		</div>

		<c:if test="${sessionScope['user'] != null}">

			<div class="collapse navbar-collapse pmd-navbar-sidebar"
				id="navbarSupportedContent" style="justify-content: flex-end">
				<div class="dropdown pmd-dropdown pmd-user-info">
					<a href="javascript:void(0);"
						class="btn-user dropdown-toggle media align-items-center nav-link"
						data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
						<div class="media-body">
							<h5>
								<span class="badge badge-pill badge-success nav-item">${sessionScope['user'].fullname}</span>
							</h5>

						</div>
					</a>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<a class="dropdown-item" href="${root}/home/profile.htm">Thay
							đổi mật khẩu</a>
						<a class="dropdown-item"
							href="${root}/home/changeinfo/${sessionScope['user'].username}.htm">Thay
							đổi thông tin cá nhân</a>
						<a class="dropdown-item" href="${root}/home/logout.htm">Đăng
							xuất</a>
					</ul>
				</div>
			</div>
		</c:if>

		<c:if test="${sessionScope['user'] == null}">
			<!-- Login  & Signup -->
			<a href="${root}/home/login.htm" role="button"
				class="btn btn-primary btn-sm" data-toggle="modal"
				style="margin: 5px;"">Đăng nhập</a>
			<a href=" ${root}/home/signup.htm" role="button"
				class="btn btn-primary btn-sm" data-toggle="modal">Đăng ký</a>
		</c:if>

	</nav>