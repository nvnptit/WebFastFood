<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<link rel="shortcut icon" type="image/x-icon"
	href="${root}/resources/images/hamburger.png" />
<head>
<title>Blog</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${root}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/css/animate.css">

<link rel="stylesheet" href="${root}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${root}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${root}/resources/css/magnific-popup.css">

<link rel="stylesheet" href="${root}/resources/css/aos.css">

<link rel="stylesheet" href="${root}/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="${root}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${root}/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="${root}/resources/css/flaticon.css">
<link rel="stylesheet" href="${root}/resources/css/icomoon.css">
<link rel="stylesheet" href="${root}/resources/css/style.css">
</head>

<body class="goto-here">

	<%@include file="/WEB-INF/views/include/header.jsp"%>

	<div class="hero-wrap hero-bread"
		style="background-image: url('${root}/resources/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span>
					</p>
					<h1 class="mb-0 bread">Blog</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<div class="row">
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-inside.htm" class="block-20"
									style="background-image: url('${root}/resources/images/image_1.jpg');">
								</a>
								<div class="text d-block pl-md-4">
									<div class="meta mb-3">
										<div>
											<a href="#">July 20, 2019</a>
										</div>
										<div>
											<a href="#">Admin</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												3</a>
										</div>
									</div>
									<h3 class="heading">
										<a href="#">Even the all-powerful Pointing has no control
											about the blind texts</a>
									</h3>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p>
										<a href="blog-inside.htm" class="btn btn-primary py-2 px-3"><s:message code="blog.ReadMore"/></a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-inside.htm" class="block-20"
									style="background-image: url('${root}/resources/images/image_2.jpg');">
								</a>
								<div class="text d-block pl-md-4">
									<div class="meta mb-3">
										<div>
											<a href="#">July 20, 2019</a>
										</div>
										<div>
											<a href="#">Admin</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												3</a>
										</div>
									</div>
									<h3 class="heading">
										<a href="#">Even the all-powerful Pointing has no control
											about the blind texts</a>
									</h3>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p>
										<a href="blog-inside.htm" class="btn btn-primary py-2 px-3"><s:message code="blog.ReadMore"/></a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-inside.htm" class="block-20"
									style="background-image: url('${root}/resources/images/image_3.jpg');">
								</a>
								<div class="text d-block pl-md-4">
									<div class="meta mb-3">
										<div>
											<a href="#">July 20, 2019</a>
										</div>
										<div>
											<a href="#">Admin</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												3</a>
										</div>
									</div>
									<h3 class="heading">
										<a href="#">Even the all-powerful Pointing has no control
											about the blind texts</a>
									</h3>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p>
										<a href="blog-inside.htm" class="btn btn-primary py-2 px-3"><s:message code="blog.ReadMore"/></a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-inside.htm" class="block-20"
									style="background-image: url('${root}/resources/images/image_4.jpg');">
								</a>
								<div class="text d-block pl-md-4">
									<div class="meta mb-3">
										<div>
											<a href="#">July 20, 2019</a>
										</div>
										<div>
											<a href="#">Admin</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												3</a>
										</div>
									</div>
									<h3 class="heading">
										<a href="#">Even the all-powerful Pointing has no control
											about the blind texts</a>
									</h3>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p>
										<a href="blog-inside.htm" class="btn btn-primary py-2 px-3"><s:message code="blog.ReadMore"/></a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-inside.htm" class="block-20"
									style="background-image: url('${root}/resources/images/image_5.jpg');">
								</a>
								<div class="text d-block pl-md-4">
									<div class="meta mb-3">
										<div>
											<a href="#">July 20, 2019</a>
										</div>
										<div>
											<a href="#">Admin</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												3</a>
										</div>
									</div>
									<h3 class="heading">
										<a href="#">Even the all-powerful Pointing has no control
											about the blind texts</a>
									</h3>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p>
										<a href="blog-inside.htm" class="btn btn-primary py-2 px-3"><s:message code="blog.ReadMore"/></a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-12 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-inside.htm" class="block-20"
									style="background-image: url('${root}/resources/images/image_6.jpg');">
								</a>
								<div class="text d-block pl-md-4">
									<div class="meta mb-3">
										<div>
											<a href="#">July 20, 2019</a>
										</div>
										<div>
											<a href="#">Admin</a>
										</div>
										<div>
											<a href="#" class="meta-chat"><span class="icon-chat"></span>
												3</a>
										</div>
									</div>
									<h3 class="heading">
										<a href="#">Even the all-powerful Pointing has no control
											about the blind texts</a>
									</h3>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.</p>
									<p>
										<a href="blog-inside.htm" class="btn btn-primary py-2 px-3"><s:message code="blog.ReadMore"/></a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- .col-md-8 -->
				<div class="col-lg-4 sidebar ftco-animate">
					<div class="sidebar-box">
						<form action="#" class="search-form">
							<div class="form-group">
								<span class="icon ion-ios-search"></span> <input type="text"
									class="form-control" placeholder="Search...">
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
								<h3 class="heading-1">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> April 09,
											2019</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(${root}/resources/images/image_2.jpg);"></a>
							<div class="text">
								<h3 class="heading-1">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> April 09,
											2019</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(${root}/resources/images/image_3.jpg);"></a>
							<div class="text">
								<h3 class="heading-1">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> April 09,
											2019</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3 class="heading">Tag Cloud</h3>
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">fruits</a> <a href="#"
								class="tag-cloud-link">tomatoe</a> <a href="#"
								class="tag-cloud-link">mango</a> <a href="#"
								class="tag-cloud-link">apple</a> <a href="#"
								class="tag-cloud-link">carrots</a> <a href="#"
								class="tag-cloud-link">orange</a> <a href="#"
								class="tag-cloud-link">pepper</a> <a href="#"
								class="tag-cloud-link">eggplant</a>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3 class="heading">Paragraph</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ducimus itaque, autem necessitatibus voluptate quod mollitia
							delectus aut, sunt placeat nam vero culpa sapiente consectetur
							similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

	<%@include file="/WEB-INF/views/include/footer.jsp"%>

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
	<!-- <script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
	<!-- <script src="${root}/resources/js/google-map.js"></script> -->
	<script src="${root}/resources/js/main.js"></script>

</body>

</html>