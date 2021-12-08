<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />

<head>
<!-- Required meta tags-->

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title Page-->
<title>Đăng ký</title>

<!-- Fontfaces CSS-->
<link href="${root}/resources/css/font-face.css" rel="stylesheet"
	media="all">
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
<link href="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="${root}/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="${root}/resources/vendor/wow/animate.css" rel="stylesheet"
	media="all">
<link href="${root}/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="${root}/resources/vendor/slick/slick.css" rel="stylesheet"
	media="all">
<link href="${root}/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${root}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="${root}/resources/css/theme.css" rel="stylesheet"
	media="all">

</head>


<body class="animsition">
	<div class="page-content--bge5">
		<div style="background-color: lightgray;">
			<div class="login-wrap">
				<div class="login-content">
					<%@include file="/WEB-INF/views/include/language.jsp"%>
					<div class="login-logo mt-3">
						<a href="#"> <img
							src="${root}/resources/images/icon/admin.png" alt="CoolAdmin">
						</a>
					</div>
					<c:if test="${not empty message}">
						<div class="alert alert-danger" role="alert">${message}</div>
					</c:if>

					<div class="login-form">
						<form:form action="signup.htm" method="post"
							modelAttribute="userz">
							<div class="form-group">
								<s:message code="general.Username" var="username" />
								<s:message code="info.Username" var="i_username" />
								<label class="form-control-label">${username}</label>
								<form:input path="username" type="text"
									placeholder="${username}" class="form-control"
									oninvalid="this.setCustomValidity('${i_username}')"
									oninput="setCustomValidity('')" required="required" />
							</div>

							<div class="form-group">
								<s:message code="general.FullName" var="fullName" />
								<s:message code="info.FullName" var="i_fullName" />
								<label class="form-control-label">${fullName }</label>
								<form:input path="fullname" type="text"
									placeholder="${fullName }" class="form-control"
									oninvalid="this.setCustomValidity('${i_fullName }')"
									oninput="setCustomValidity('')" required="required" />
							</div>
							<div class="form-group">
								<label class="form-control-label">Email</label>
								<s:message code="general.Email.Check" var="checkEmail" />
								<form:input path="email" type="email" placeholder="Email"
									class="form-control"
									oninvalid="this.setCustomValidity('${checkEmail }')"
									oninput="setCustomValidity('')" required="required" />
							</div>
							<div class="form-group">
								<s:message code="general.Phone" var="phone" />
								<s:message code="info.Phone" var="i_phone" />
								<label class="form-control-label">${phone }</label>
								<form:input path="phone" type="text" maxlength="10"
									placeholder="${phone }" class="form-control"
									oninvalid="this.setCustomValidity('${i_phone }')"
									oninput="setCustomValidity('')" required="required" />
							</div>

							<div class="form-group">
								<s:message code="general.Password" var="password" />
								<s:message code="info.Password" var="i_password" />
								<label>${password}</label>
								<form:input path="password" placeholder="${password}"
									type="password" class="form-control"
									oninvalid="this.setCustomValidity('${i_password}')"
									oninput="setCustomValidity('')" required="required" />
							</div>

							<div class="form-group">
								<s:message code="general.ConfirmPassword" var="cpassword" />
								<s:message code="info.ConfirmPassword" var="i_cpassword" />
								<label>${cpassword }</label> <input
									class="au-input au-input--full form-control" type="password"
									name="confirmPassword"
									oninvalid="this.setCustomValidity('${i_cpassword }')"
									oninput="setCustomValidity('')" required>
							</div>
							<div>
								 <span
									class="show-btn"><i class="fas fa-eye"></i> <s:message code="general.ShowPassword" /></span>
							</div>

							<div>
								<form:input path="role" type="hidden" value="user"
									required="required" />
							</div>
							<div class="form-group">
								<form:input path="status" type="hidden" value="1" />
							</div>
							<!-- <div><img src="${root}/captcha/">
                                            <input style="width: 200px; height: 40px;    border: 2px solid #231fe7;
                                            border-radius: 7px;" name="captcha" type="text" id="captcha" required />
                                            <label class="mb-1">
                                                <h6 class="mb-0 text-sm">${recaptcha}</h6>
                                            </label>
                                        </div><br> -->
							<button class="au-btn au-btn--block au-btn--green m-b-20"
								type="submit">
								<s:message code="general.SignUp" />
							</button>
						</form:form>
						<div>
							<button class="au-btn au-btn--block au-btn--blue m-b-20"
								onclick="location.href='${root}/home/login.htm';">
								<s:message code="general.SignIn" />
							</button>
						</div>
						<div align="center">
							<button class="btn btn-danger"
								onclick="location.href='${root}/home/index.htm';">
								<i class="zmdi zmdi-home"></i>
								<s:message code="general.BackToHomePage" />
							</button>
						</div>
						<%-- 					<div class="login-checkbox">
							<label> <a href="${root}/home/login.htm"><s:message
										code="general.Already" /></a>
						</div> --%>
						<div class="register-link">
							<a href="#">Copyright &copy; Nhóm 16 Dịu - Nhất - Phúc</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Jquery JS-->
	<script src="${root}/resources/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script src="${root}/resources/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="${root}/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script src="${root}/resources/vendor/slick/slick.min.js">
		
	</script>
	<script src="${root}/resources/vendor/wow/wow.min.js"></script>
	<script src="${root}/resources/vendor/animsition/animsition.min.js"></script>
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
	<script src="${root}/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script src="${root}/resources/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script src="${root}/resources/js/main_admin.js"></script>

	<script>
 $('.show-btn').click(function(e) {

	const passField1 = document.querySelector("body > div.page-content--bge5 > div > div > div > div.login-form > form > div:nth-child(5) > input");
	const passField2 = document.querySelector("body > div.page-content--bge5 > div > div > div > div.login-form > form > div:nth-child(6) > input");
	const showBtn = document.querySelector("span i");
	showBtn.onclick = (()=>{
	  if(passField1.type === "password"){
	   passField1.type = "text";
	    passField2.type = "text"; 
	    showBtn.classList.remove("fa-eye"); 
	    showBtn.classList.add("fa-eye-slash");  
	  }else{
		    passField1.type = "password";
		    passField2.type = "password";
	    showBtn.classList.remove("fa-eye-slash"); 
	    showBtn.classList.add("fa-eye");  
	  }
	});

}); 

</script>
</body>

</html>
<!-- end document-->