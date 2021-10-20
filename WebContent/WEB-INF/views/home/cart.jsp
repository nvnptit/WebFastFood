<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="ptithcm.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Vegefoods - Free Bootstrap 4 Template by Colorlib</title>
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
		<div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
							<span class="text">(+84) 979 888 999</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">Group 16 with ♥</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
						    <span class="text">3-5 Business days delivery &amp; Free Returns</span>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.htm">Vegefoods</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.htm" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="shop.htm" class="nav-link">Products</a></li>
	          <li class="nav-item"><a href="about.htm" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="blog.htm" class="nav-link">Blog</a></li>
	          <li class="nav-item cta cta-colored active"><a href="#" class="nav-link"><span class="icon-shopping_cart"></span>[ ${sessionScope['Orders_list'].size()} ]</a></li>

	        </ul>
	      </div>
	    </div>
	    <div class="collapse navbar-collapse pmd-navbar-sidebar" id="navbarSupportedContent" style="justify-content:flex-end">
        <div class="dropdown pmd-dropdown pmd-user-info">
            <a href="javascript:void(0);" class="btn-user dropdown-toggle media align-items-center nav-link" data-toggle="dropdown" data-sidebar="true" aria-expanded="false">
               <!--  <img class="mr-2" src="${root}/resources/images/icon/avt.png" width="40" height="40" alt="avatar"> -->
                <div class="media-body">
                 <h5><span class="badge badge-pill badge-success nav-item">${sessionScope['user'].fullname}</span></h5> 
                 
                </div>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                <a class="dropdown-item" href="profile.htm">Change Password</a>
                <a class="dropdown-item" href="logout.htm">Logout</a>
            </ul>
        </div>
    	</div>
	  </nav>
    <!-- END nav -->

    <div class="hero-wrap hero-bread" style="background-image: url('${root}/resources/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.htm">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">My Cart</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-cart">
    
			<div class="container">
			<form method=POST action="deleteCart.htm" id="formCart">
				<div class="row">
    			<div class="col-md-12 ftco-animate">

    				
	    				<table class="table" id="tab_logic">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>Product name</th>
						        <th>Price</th>
						        <th>Quantity</th>
						        <th>Discount</th>
						        <th>Total</th>
						      </tr>
						    </thead>
						    <tbody>
						    
						    <c:forEach var="p" items="${sessionScope['Orders_list']}">
						     <tr class="text-center">
						     	 <td class="product-remove"><button class="btn close" type="submit" value="${p.id}" name="deleteItem" >X</button>
						     	 <input type="hidden" name="id" class="form-control" value="${p.id}"></td>
						        <td class="image-prod"><div class="img" style="background-image:url(${root}/resources/images/${p.img});"></div></td>
						        <td class="product-name">
						        	<h3>${p.name}</h3>
						        	<input type="hidden" name="name" class="form-control" value="${p.name}">
						        </td>
						        
						        <td>
						        <div class="input-group mb-3">
						        <input type="number" name="price" class="form-control input-number price" value="${p.price}" readonly>
						        </div>
						        </td>
						        
						        <td>
						        	<div class="input-group mb-3">
					             	<input type="number" name="quantity" class="form-control input-number quantity" value="1" min="1">
					          	</div>
					          </td>
						        <td><div class="input-group mb-3">
						        <input type="number" name="discount" class="form-control input-number discount" value="${p.discount}" readonly/>
						        </div>
						        </td>
						        <td><div class="input-group mb-3">
						        <input type="number" name="total" class="form-control input-number total" value="${p.price}"readonly/>
						        </div>
						        </td>
						      </tr><!-- END TR-->
						    </c:forEach>
						    </tbody>
						  </table>
    			</div>
    		</div>
			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
    					
    					<p class="d-flex total-price">
    						<span>Total</span>
    						<input type="number" name='total_amount' id="total_amount" placeholder='0.00' class="form-control" readonly/>
    					</p>
    				</div>
    				<p><button formaction="record.htm" class="btn btn-primary py-3 px-4">BUY</button></p>
    			</div>
    			</form>
			</div>
			
		</section>

		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          	<span>Get e-mail updates about our latest shops and special offers</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <footer class="ftco-footer ftco-section">
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
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
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
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>



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

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});
			
			$('#tab_logic tbody').on('keyup change',function(){
				calc();
			});
			$('#tax').on('keyup change',function(){
				calc_total();
			});
			calc();
		});
		
		function calc()
		{
			$('#tab_logic tbody tr').each(function(i, element) {
				var html = $(this).html();
				if(html!='')
				{
					var qty = $(this).find('.quantity').val();
					var price = $(this).find('.price').val();
					var discount = $(this).find('.discount').val();
					$(this).find('.total').val(qty*price*(100-discount)/100);
					
					calc_total();
				}
		    });
		}

		function calc_total()
		{
			total=0;
			$('.total').each(function() {
		        total += parseInt($(this).val());
		    });
			$('#total_amount').val(total);
		}
		
	</script>
	

</body>

</html>