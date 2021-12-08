<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<li><a class="js-arrow" href="index.htm"> <i class="fa fa-pie-chart" aria-hidden="true"></i>Tổng quan
				</a></li>
				<!-- <li class="has-sub"><a class="js-arrow" href="#"> <i
						class="fas fa-table active"></i>Dữ liệu
				</a>
					<ul class="list-unstyled navbar__sub-list js-sub-list">
						<li><a href="user.htm">Dữ liệu người dùng</a></li>
						<li><a href="product.htm">Dữ liệu sản phẩm</a></li>
					</ul></li> -->
				<li><a class="js-arrow" href="${root}/admin/user.htm"> <i class="fa fa-user" aria-hidden="true"></i>Người dùng
				</a></li>
				<li><a class="js-arrow" href="${root}/admin/product.htm"> <i class="fa fa-shopping-basket" aria-hidden="true"></i></i>Sản phẩm
				</a></li>
				<li><a class="js-arrow" href="${root}/admin/slide.htm"> <i
						class="fa fa-television" aria-hidden="true"></i>Trình chiếu
				</a></li>
			</ul>
		</nav>
	</div>
</aside>
<!-- END MENU SIDEBAR-->