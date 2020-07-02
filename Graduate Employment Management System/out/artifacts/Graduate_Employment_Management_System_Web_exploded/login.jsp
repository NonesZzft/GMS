<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<link
	href='https://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400'
	rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<script src="js/jquery-1.10.2.min.js"></script>
<!--clock init-->
</head>



<body>

	<%
		String path = request.getServletContext().getContextPath();
		System.out.println("path: " + path);
	%>

	<div class="error_page">
		<!--/login-top-->

		<div class="error-top">
			<!-- <h2 class="inner-tittle page">毕业生就业管理系统</h2> -->
			<div class="login">
				<h3 class="inner-tittle t-inner">Login</h3>
				<!-- 																<div class="buttons login">
																			<ul>
																				<li><a href="#" class="hvr-sweep-to-right">Facebook</a></li>
																				<li class="lost"><a href="#" class="hvr-sweep-to-left">Twitter</a> </li>
																				<div class="clearfix"></div>
																			</ul>
																		</div>
 -->
				<form action="<%=path%>/LoginServlet" method="post">
					<input type="text" class="text" name="name" value="Your account"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Your account';}">
					<input type="password" name="password">
					<div class="onoffswitch"></div>
					<div class="radio">
						<a style="float: left; color: black">请选择您的身份：</a> <label
							class="radio-inline"> <input type="radio"
							name="optionsRadios" id="optionsRadios1" value="student" checked>
							学生
						</label> <label class="radio-inline"> <input type="radio"
							name="optionsRadios" id="optionsRadios3" value="admin">管理员
						</label> <label class="radio-inline"> <input type="radio"
							name="optionsRadios" id="optionsRadios2" value="company">企业
						</label>

					</div>
					<div class="submit">
						<input type="submit" value="Login">
					</div>
					<div class="clearfix"></div>
					<div class="new">
						<!-- 	<p><label class="checkbox11"><input type="checkbox" name="checkbox"><i> </i>Forgot Password ?</label></p> -->
						<!--	<p class="sign">Do not have an account ? <a href="index.jsp">Sign Up</a></p> -->
						<div class="clearfix"></div>
					</div>
				</form>
			</div>


		</div>


		<!--//login-top-->
	</div>

	<!--//login-->
	<!--footer section start-->
	<div class="footer">
		<div class="error-btn">
			<a class="read fourth" href="index.jsp">Return to Home</a>
		</div>
		<p>Copyright &copy; 2016.Company name All rights reserved.</p>
	</div>
	<!--footer section end-->
	<!--/404-->
	<!--js -->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>