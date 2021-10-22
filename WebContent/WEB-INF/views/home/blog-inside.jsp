<%@ page pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html lang="en">
		<c:set var="root" value="${pageContext.servletContext.contextPath}" />

		<head>
			<title>Blogs</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
				rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

			<link rel="stylesheet" href="${root}/resources/css/open-iconic-bootstrap.min.css">
			<link rel="stylesheet" href="${root}/resources/css/animate.css">

			<link rel="stylesheet" href="${root}/resources/css/owl.carousel.min.css">
			<link rel="stylesheet" href="${root}/resources/css/owl.theme.default.min.css">
			<link rel="stylesheet" href="${root}/resources/css/magnific-popup.css">

			<link rel="stylesheet" href="${root}/resources/css/aos.css">

			<link rel="stylesheet" href="${root}/resources/css/ionicons.min.css">

			<link rel="stylesheet" href="${root}/resources/css/bootstrap-datepicker.css">
			<link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.css">


			<link rel="stylesheet" href="${root}/resources/css/flaticon.css">
			<link rel="stylesheet" href="${root}/resources/css/icomoon.css">
			<link rel="stylesheet" href="${root}/resources/css/style.css">
		</head>

		<body class="goto-here">

			<div class="py-1 bg-primary">
				<div class="container">
					<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
						<div class="col-lg-12 d-block">
							<div class="row d-flex">
								<div class="col-md pr-4 d-flex topper align-items-center">
									<div class="icon mr-2 d-flex justify-content-center align-items-center"><span
											class="icon-phone2"></span></div>
									<span class="text">(+84) 979 888 999</span>
								</div>
								<div class="col-md pr-4 d-flex topper align-items-center">
									<div class="icon mr-2 d-flex justify-content-center align-items-center">
										<span class="icon-paper-plane"></span>
									</div>
									<span class="text">Nhóm 16 with ♥</span>
								</div>
								<div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
									<span class="text">3-5 Giao hàng trong ngày làm việc & Trả hàng miễn phí</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
				<div class="container">
					<a class="navbar-brand" href="${root}/home/index.htm"><img src="../resources/images/logo.png"
							alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
						aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="oi oi-menu"></span> Menu
					</button>

					<div class="collapse navbar-collapse" id="ftco-nav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a href="${root}/home/index.htm" class="nav-link">Trang chủ</a></li>
							<li class="nav-item"><a href="${root}/home/food.htm" class="nav-link">Thức ăn</a></li>
							<li class="nav-item"><a href="${root}/home/drink.htm" class="nav-link">Thức uống</a></li>
							<li class="nav-item"><a href="${root}/home/about.htm" class="nav-link">Thông tin thêm</a>
							</li>
							<li class="nav-item active"><a href="#" class="nav-link">Blog</a></li>
							<li class="nav-item cta cta-colored"><a href="${root}/home/cart.htm" class="nav-link">
									<span class="icon-shopping_cart">Giỏ hàng</span>[0]</a></li>

						</ul>
					</div>
				</div>


				<c:if test="${sessionScope['user'] != null}">

					<div class="collapse navbar-collapse pmd-navbar-sidebar" id="navbarSupportedContent"
						style="justify-content: flex-end">
						<div class="dropdown pmd-dropdown pmd-user-info">
							<a href="javascript:void(0);"
								class="btn-user dropdown-toggle media align-items-center nav-link"
								data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
								<!--  <img class="mr-2" src="${root}/resources/images/icon/avt.png" width="40" height="40" alt="avatar"> -->
								<div class="media-body">
									<h5>
										<span
											class="badge badge-pill badge-success nav-item">${sessionScope['user'].fullname}</span>
									</h5>

								</div>
							</a>
							<ul class="dropdown-menu dropdown-menu-right" role="menu">
								<a class="dropdown-item" href="${root}/home/profile.htm">Thay đổi mật khẩu</a>
								<a class="dropdown-item" href="${root}/home/logout.htm">Đăng xuất</a>
							</ul>
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope['user'] == null}">

					<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h3>Đăng nhập</h3>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">X</button>
								</div>
								<div class="modal-body">
									<form class="form needs-validation" role="form" autocomplete="off" id="formLogin"
										action="${root}/home/index.htm" method="POST">
										<div class="form-group">
											<a href="#SignupModal" class="float-right" data-toggle="modal">Bạn là khách
												hàng mới?</a> <label for="uname1">Tên đăng nhập</label> <input
												type="text" class="form-control form-control-lg" name="username_lg"
												id="uname1" required>
											<div class="invalid-feedback">Vui lòng nhập tên đăng nhập!</div>
										</div>
										<div class="form-group">
											<label>Mật khẩu</label> <input type="password"
												class="form-control form-control-lg" id="pwd1" name="password_lg"
												required>
											<div class="invalid-feedback">Vui lòng nhập tên mật khẩu!</div>
										</div>
										<div class="custom-control custom-checkbox">
											<label> <a href="${root}/home/forgot.htm">Quên mật khẩu?</a>
											</label>
										</div>
										<div class="form-group py-4">
											<button class="btn btn-outline-secondary btn-lg" data-dismiss="modal"
												aria-hidden="true">Huỷ</button>
											<button type="submit" class="btn btn-success btn-lg float-right"
												id="btnLogin">Đăng nhập</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div id="SignupModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h3>Đăng ký</h3>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">X</button>
								</div>
								<div class="modal-body">
									<form class="form" role="form" autocomplete="off" id="formSignup"
										action="${root}/home/login.htm" method="POST">
										<div class="form-group">
											<label for="uname1">Tên đăng nhập</label> <input type="text"
												class="form-control form-control-lg" name="username" id="username"
												required="">
											<div class="invalid-feedback">Vui lòng nhập tên đăng nhập!</div>
										</div>
										<div class="form-group">
											<label for="uname1">Họ và tên</label> <input type="text"
												class="form-control form-control-lg" name="fullname" id="fullname"
												required="">
											<div class="invalid-feedback">Vui lòng nhập họ và tên!</div>
										</div>
										<div class="form-group">
											<label for="uname1">Email</label> <input type="email"
												class="form-control form-control-lg" name="email" id="email"
												required="">
											<div class="invalid-feedback">Vui lòng nhập email của bạn!</div>
										</div>
										<div class="form-group">
											<label for="uname1">Số điện thoại</label> <input type="number"
												class="form-control form-control-lg" name="phone" id="phone"
												required="">
											<div class="invalid-feedback">Vui lòng nhập số điện thoại của bạn!
											</div>
											<div class="form-group">
												<label>Mật khẩu</label> <input type="password"
													class="form-control form-control-lg" name="password" required=""
													autocomplete="new-password">
												<div class="invalid-feedback">Vui lòng nhập mật khẩu!</div>
											</div>
											<div class="form-group">
												<label>Nhập lại mật khẩu</label>
												<input type="password" id="confirmPassword"
													class="form-control form-control-lg" name="confirmPassword"
													required="" autocomplete="new-password" oninput="check(this)" />
												<script language='javascript' type='text/javascript'>
													function check(input) {
														if (input.value != document.getElementById('password').value) {
															input.setCustomValidity('Password Must be Matching.');
														} else {
															// input is valid -- reset the error message
															input.setCustomValidity('');
														}
													}
												</script>
												<div class="invalid-feedback">Mật khẩu không trùng khớp!</div>
											</div>
											<input type="hidden" class="form-control form-control-lg" name="role"
												value="user">
											<div class="form-group py-4">
												<button class="btn btn-outline-secondary btn-lg" data-dismiss="modal"
													aria-hidden="true">Huỷ</button>
												<button type="submit" class="btn btn-success btn-lg float-right"
													id="btnSignup">Đăng ký</button>
											</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<a href="#loginModal" role="button" class="btn btn-primary btn-sm""
				data-toggle=" modal" style="margin:5px;" ">Đăng nhập</a> 
				
			<a href=" #SignupModal" role="button" class="btn btn-primary " data-toggle="modal">Đăng ký</a>
				</c:if>

			</nav>
			<!-- END nav -->

			<div class="hero-wrap hero-bread" style="background-image: url('${root}/resources/images/bg_1.jpg');">
				<div class="container">
					<div class="row no-gutters slider-text align-items-center justify-content-center">
						<div class="col-md-9 ftco-animate text-center">
							<p class="breadcrumbs"><span class="mr-2"><a href="#">Home</a></span> <span>Blog</span></p>
							<h1 class="mb-0 bread">Blog</h1>
						</div>
					</div>
				</div>
			</div>

			<section class="ftco-section ftco-degree-bg">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 ftco-animate">
							<h2 class="mb-3">Organic foods is good for your health</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia
								suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio
								laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima
								nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio
								deserunt molestiae voluptates soluta architecto tempora.</p>
							<p>
								<img src="${root}/resources/images/image_1.jpg" alt="" class="img-fluid">
							</p>
							<p>Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis
								repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam
								voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti
								tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut
								ea, repudiandae suscipit!</p>
							<h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>
							<p>Temporibus ad error suscipit exercitationem hic molestiae totam obcaecati rerum, eius
								aut, in. Exercitationem atque quidem tempora maiores ex architecto voluptatum aut
								officia doloremque. Error dolore voluptas, omnis molestias odio dignissimos culpa ex
								earum nisi consequatur quos odit quasi repellat qui officiis reiciendis incidunt hic
								non? Debitis commodi aut, adipisci.</p>
							<p>
								<img src="${root}/resources/images/image_2.jpg" alt="" class="img-fluid">
							</p>
							<p>Quisquam esse aliquam fuga distinctio, quidem delectus veritatis reiciendis. Nihil
								explicabo quod, est eos ipsum. Unde aut non tenetur tempore, nisi culpa voluptate
								maiores officiis quis vel ab consectetur suscipit veritatis nulla quos quia aspernatur
								perferendis, libero sint. Error, velit, porro. Deserunt minus, quibusdam iste enim
								veniam, modi rem maiores.</p>
							<p>Odit voluptatibus, eveniet vel nihil cum ullam dolores laborum, quo velit commodi rerum
								eum quidem pariatur! Quia fuga iste tenetur, ipsa vel nisi in dolorum consequatur,
								veritatis porro explicabo soluta commodi libero voluptatem similique id quidem?
								Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit inventore, quia
								laboriosam harum excepturi ea.</p>
							<p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam ipsam quidem, dolor
								distinctio similique asperiores voluptas enim, exercitationem ratione aut adipisci modi
								quod quibusdam iusto, voluptates beatae iure nemo itaque laborum. Consequuntur et
								pariatur totam fuga eligendi vero dolorum provident. Voluptatibus, veritatis. Beatae
								numquam nam ab voluptatibus culpa, tenetur recusandae!</p>
							<p>Voluptas dolores dignissimos dolorum temporibus, autem aliquam ducimus at officia
								adipisci quasi nemo a perspiciatis provident magni laboriosam repudiandae iure iusto
								commodi debitis est blanditiis alias laborum sint dolore. Dolores, iure, reprehenderit.
								Error provident, pariatur cupiditate soluta doloremque aut ratione. Harum voluptates
								mollitia illo minus praesentium, rerum ipsa debitis, inventore?</p>
							<div class="tag-widget post-tag-container mb-5 mt-5">
								<div class="tagcloud">
									<a href="#" class="tag-cloud-link">Life</a>
									<a href="#" class="tag-cloud-link">Sport</a>
									<a href="#" class="tag-cloud-link">Tech</a>
									<a href="#" class="tag-cloud-link">Travel</a>
								</div>
							</div>

							<div class="about-author d-flex p-4 bg-light">
								<div class="bio align-self-md-center mr-4">
									<img src="${root}/resources/images/person_1.jpg" alt="Image placeholder"
										class="img-fluid mb-4">
								</div>
								<div class="desc align-self-md-center">
									<h3>Lance Smith</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem
										necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa
										sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
								</div>
							</div>
						</div> <!-- .col-md-8 -->
						<div class="col-lg-4 sidebar ftco-animate">
							<div class="sidebar-box">
								<form action="#" class="search-form">
									<div class="form-group">
										<span class="icon ion-ios-search"></span>
										<input type="text" class="form-control" placeholder="Search...">
									</div>
								</form>
							</div>
							<div class="sidebar-box ftco-animate">
								<h3 class="heading">Categories</h3>
								<ul class="categories">
									<li><a href="#">Vegetables <span>(12)</span></a></li>
									<li><a href="#">Fruits <span>(22)</span></a></li>
									<li><a href="#">Juice <span>(37)</span></a></li>
									<li><a href="#">Dries <span>(42)</span></a></li>
								</ul>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="heading">Recent Blog</h3>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										style="background-image: url(${root}/resources/images/image_1.jpg);"></a>
									<div class="text">
										<h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control
												about the blind texts</a></h3>
										<div class="meta">
											<div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a>
											</div>
											<div><a href="#"><span class="icon-person"></span> Admin</a></div>
											<div><a href="#"><span class="icon-chat"></span> 19</a></div>
										</div>
									</div>
								</div>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										style="background-image: url(${root}/resources/images/image_2.jpg);"></a>
									<div class="text">
										<h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control
												about the blind texts</a></h3>
										<div class="meta">
											<div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a>
											</div>
											<div><a href="#"><span class="icon-person"></span> Admin</a></div>
											<div><a href="#"><span class="icon-chat"></span> 19</a></div>
										</div>
									</div>
								</div>
								<div class="block-21 mb-4 d-flex">
									<a class="blog-img mr-4"
										style="background-image: url(${root}/resources/images/image_3.jpg);"></a>
									<div class="text">
										<h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control
												about the blind texts</a></h3>
										<div class="meta">
											<div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a>
											</div>
											<div><a href="#"><span class="icon-person"></span> Admin</a></div>
											<div><a href="#"><span class="icon-chat"></span> 19</a></div>
										</div>
									</div>
								</div>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="heading">Tag Cloud</h3>
								<div class="tagcloud">
									<a href="#" class="tag-cloud-link">fruits</a>
									<a href="#" class="tag-cloud-link">tomatoe</a>
									<a href="#" class="tag-cloud-link">mango</a>
									<a href="#" class="tag-cloud-link">apple</a>
									<a href="#" class="tag-cloud-link">carrots</a>
									<a href="#" class="tag-cloud-link">orange</a>
									<a href="#" class="tag-cloud-link">pepper</a>
									<a href="#" class="tag-cloud-link">eggplant</a>
								</div>
							</div>

							<div class="sidebar-box ftco-animate">
								<h3 class="heading">Paragraph</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem
									necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa
									sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
							</div>
						</div>

					</div>
				</div>
			</section> <!-- .section -->

			<footer class="ftco-footer ftco-section bg-light">
				<div class="container">
					<div class="row">
						<div class="mouse">
							<a href="#" class="mouse-icon">
								<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
							</a>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">Vegefoods</h2>
								<p>Far far away, behind the word mountains, far from the countries Vokalia and
									Consonantia.</p>
								<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
									<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
									<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
									<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md">
							<div class="ftco-footer-widget mb-4 ml-md-5">
								<h2 class="ftco-heading-2">Menu</h2>
								<ul class="list-unstyled">
									<li><a href="#" class="py-2 d-block">Shop</a></li>
									<li><a href="#" class="py-2 d-block">About</a></li>
									<li><a href="#" class="py-2 d-block">Journal</a></li>
									<li><a href="#" class="py-2 d-block">Contact Us</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-4">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">Help</h2>
								<div class="d-flex">
									<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
										<li><a href="#" class="py-2 d-block">Shipping Information</a></li>
										<li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
										<li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
										<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
									</ul>
									<ul class="list-unstyled">
										<li><a href="#" class="py-2 d-block">FAQs</a></li>
										<li><a href="#" class="py-2 d-block">Contact</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md">
							<div class="ftco-footer-widget mb-4">
								<h2 class="ftco-heading-2">Have a Questions?</h2>
								<div class="block-23 mb-3">
									<ul>
										<li><span class="icon icon-map-marker"></span><span class="text">203 Fake St.
												Mountain View, San Francisco, California, USA</span></li>
										<li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392
													3929 210</span></a></li>
										<li><a href="#"><span class="icon icon-envelope"></span><span
													class="text">info@yourdomain.com</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">

							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>document.write(new Date().getFullYear());</script> All rights reserved | This
								template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</footer>



			<!-- loader -->
			<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
					<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
					<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
						stroke="#F96D00" />
				</svg></div>



			<script src="${root}/resources/js/jquery.min.js"></script>
			<script src="${root}/resources/js/jquery-migrate-3.0.1.min.js"></script>
			<script src="${root}/resources/js/popper.min.js"></script>
			<script src="${root}/resources/js/bootstrap.min.js"></script>
			<script src="${root}/resources/js/jquery.easing.1.3.js"></script>
			<script src="${root}/resources/js/jquery.waypoints.min.js"></script>
			<script src="${root}/resources/js/jquery.stellar.min.js"></script>
			<script src="${root}/resources/js/owl.carousel.min.js"></script>
			<script src="${root}/resources/js/jquery.magnific-popup.min.js"></script>
			<script src="${root}/resources/js/aos.js"></script>
			<script src="${root}/resources/js/jquery.animateNumber.min.js"></script>
			<script src="${root}/resources/js/bootstrap-datepicker.js"></script>
			<script src="${root}/resources/js/scrollax.min.js"></script>
			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
			<script src="${root}/resources/js/google-map.js"></script>
			<script src="${root}/resources/js/main.js"></script>
			<script type="text/javascript">
				$("#btnLogin").click(function (event) {

					//Fetch form to apply custom Bootstrap validation
					var form = $("#formLogin")

					if (form[0].checkValidity() === false) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.addClass('was-validated');
				});

				$("#btnSignup").click(function (event) {

					//Fetch form to apply custom Bootstrap validation
					var form = $("#formSignup")

					if (form[0].checkValidity() === false) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.addClass('was-validated');
				});
			</script>
		</body>

		</html>