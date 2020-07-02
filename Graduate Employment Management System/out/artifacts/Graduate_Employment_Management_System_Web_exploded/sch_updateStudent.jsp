<%@ page language="java" contentType="text/html; charset=UTF-8" language="java"
import="java.util.List" import="com.hwadee.pojo.Student"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title>学生基本信息</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
	<!-- Custom CSS -->
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<!-- Graph CSS -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- jQuery
	<link href='https://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
	-->
	<!-- lined-icons -->
	<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
	<link href="css/fabochart.css" rel='stylesheet' type='text/css' />
	<!-- /js -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<!-- //js-->
</head>

<body>
<form action="UpdatestudetailsServlet" method="post">
	<div class="page-container">
		<!--/content-inner-->
		<div class="left-content">
			<div class="inner-content">
				<!-- header-starts -->
				<div class="header-section">
					<!--menu-right-->
					<div class="top_menu">
						<div class="main-search">
							<form>
								<input type="text" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}" class="text"
								/>
								<input type="submit" value="">
							</form>
							<div class="close">
								<img src="images/cross.png" />
							</div>
						</div>
						<script type="text/javascript">
							$('.main-search').hide();
							$('button').click(function () {
								$('.main-search').show();
								$('.main-search text').focus();
							}
							);
							$('.close').click(function () {
								$('.main-search').hide();
							});
						</script>
						<!--/profile_details-->
						<div class="profile_details_left">
							<ul class="nofitications-dropdown">
								<li class="dropdown note dra-down">
									<script type="text/javascript">

										function DropDown(el) {
											this.dd = el;
											this.placeholder = this.dd.children('span');
											this.opts = this.dd.find('ul.dropdown > li');
											this.val = '';
											this.index = -1;
											this.initEvents();
										}
										DropDown.prototype = {
											initEvents: function () {
												var obj = this;

												obj.dd.on('click', function (event) {
													$(this).toggleClass('active');
													return false;
												});

												obj.opts.on('click', function () {
													var opt = $(this);
													obj.val = opt.text();
													obj.index = opt.index();
													obj.placeholder.text(obj.val);
												});
											},
											getValue: function () {
												return this.val;
											},
											getIndex: function () {
												return this.index;
											}
										}

										$(function () {

											var dd = new DropDown($('#dd'));

											$(document).click(function () {
												// all dropdowns
												$('.wrapper-dropdown-3').removeClass('active');
											});

										});

									</script>
								</li>
								<li class="dropdown note" style="float: right;">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										<i class="fa fa-envelope-o"></i>
										<span class="badge">3</span>
									</a>


									<ul class="dropdown-menu two first">
										<li>
											<div class="notification_header">
												<h3>You have 3 new messages </h3>
											</div>
										</li>
										<li>
											<a href="#">
												<div class="user_img">
													<img src="images/1.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
											</a>
										</li>
										<li class="odd">
											<a href="#">
												<div class="user_img">
													<img src="images/in.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet </p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="user_img">
													<img src="images/in1.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet </p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
											</a>
										</li>
										<li>
											<div class="notification_bottom">
												<a href="#">See all messages</a>
											</div>
										</li>
									</ul>
								</li>

								<div class="clearfix"></div>
							</ul>
						</div>
						<div class="clearfix"></div>
						<!--//profile_details-->
					</div>
					<!--//menu-right-->
					<div class="clearfix"></div>
				</div>
				<!-- //header-ends -->


				<!--outter-wp-->
				<div class="outter-wp">
					<!--sub-heard-part-->
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li>
								<a href="schIndex.jsp">主页</a>
							</li>
							<li>
							<a href= "sch_studetails.jsp" >学生基本信息</a>
							</li>
							<li class="active">学生基本信息更改</li>
						</ol>
					</div>
					<!--//sub-heard-part-->
					<div class="graph-visual tables-main">
						<h3 class="inner-tittle two">学生信息</h3>
						<div class="graph">
							<li>学生信息更改</li>
							<div class="empty-line" style="height:20px"></div>
							<div class="tables">
									<%
									
									List<Student> list = (List<Student>) session.getAttribute("list");
    								//第i个学生
    									String str=request.getParameter("i");
    									int i=Integer.parseInt(str);
     								%>
     								<form style="align:center" action="UpdatestudetailsServlet" method="post">
                                <p>学号：<input type="text" name="Sno" value="<%=list.get(i).getSno()%>" readonly></p>
                                <p>姓名：<input type="text" name="Sname" value="<%=list.get(i).getSname()%>"></p>
                                <p>性别：<input type="text" name="Sex" value="<%=list.get(i).getSex()%>"></p>
                                <p>生日：<input type="text" name="Birth" value="<%=list.get(i).getBirth()%>"></p>
                                <p>电话：<input type="text" name="Phone" value="<%=list.get(i).getPhone()%>"></p>
                                <p>学院：<input type="text" name="College" value="<%=list.get(i).getCollege()%>"></p>
                                <p>专业：<input type="text" name="Major" value="<%=list.get(i).getMajor()%>"></p>
                                <p>班号：<input type="text" name="Cno" value="<%=list.get(i).getCno()%>"></p>
                                <p>email：<input type="text" name="Email" value="<%=list.get(i).getEmail()%>"></p>
                                <p>详情更改：<input type="test" name="Extra" value="<%=list.get(i).getExtra()%>"></p>
                                <p>小学：<input type="text" name="Psch" value="<%=list.get(i).getPsch()%>"></p>
                                <p>初中：<input type="text" name="Jsch" value="<%=list.get(i).getJsch()%>"></p>
                                <p>高中：<input type="text" name="Ssch" value="<%=list.get(i).getSsch()%>"></p>
                                <p>大学：<input type="text" name="University" value="<%=list.get(i).getUniversity()%>"></p>
                                <p>培训经历：<input type="text" name="Train" value="<%=list.get(i).getTrain()%>"></p>
                                <p>实践经历：<input type="text" name="Practice" value="<%=list.get(i).getPractice()%>"></p>
                                <p>大学四级：<input type="text" name="Cetf" value="<%=list.get(i).getCetf()%>"></p>
                                <p>大学六级：<input type="text" name="Cets" value="<%=list.get(i).getCets()%>"></p>
                                <p>自我评价：<input type="text" name="Evaluation" value="<%=list.get(i).getEvaluation()%>"></p>
                                <p>求职意向：<input type="text" name="Intention" value="<%=list.get(i).getIntention()%>"></p>
                                <p>奖学金：<input type="text" name="Money" value="<%=list.get(i).getMoney()%>"></p>
                                <p>荣誉称号：<input type="text" name="Honor" value="<%=list.get(i).getHonor()%>"></p>
                                <p>获得证书：<input type="text" name="Certif" value="<%=list.get(i).getCertif()%>"></p>
                                <p>求职信：<input type="text" name="Letter" value="<%=list.get(i).getLetter()%>"></p>
                                <p>附加信息：<input type="text" name="Attach" value="<%=list.get(i).getAttach()%>"></p>
                                <p>毕业生自荐书：<input type="text" name="Selfreco" value="<%=list.get(i).getSelfreco()%>"></p>
                                
                                
                                <p><input type="submit" value="提交"></p>
                            </form>

								
							</div>

						</div>
					</div>

					</div>
					<!--//graph-visual-->
				</div>
				<!--//outer-wp-->

				

				<!--footer section start-->
				<footer>
					<p>Copyright &copy; 2018.Company name All rights reserved.</p>
				</footer>
				<!--footer section end-->
			</div>
		</div>
		<!--//content-inner-->

		<!--/sidebar-menu-->
		<div class="sidebar-menu">
			<header class="logo">
				<a href="#" class="sidebar-icon">
					<span class="fa fa-bars"></span>
				</a>
				<a href="schIndex.jsp">
					<span id="logo">
						<h1>学校端</h1>
					</span>
					<!--<img id="logo" src="" alt="Logo"/>-->
				</a>
			</header>
			<div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
			<!--/down-->
			<div class="down">
				<a href="schIndex.jsp">
					<span class=" name-caret"><%=session.getAttribute("NameInSession") %></span>
				</a>
				<p>System Administrator in School</p>
				<ul>
					<li>
						<a class="tooltips" href="schIndex.jsp">
							<span>Profile</span>
							<i class="lnr lnr-user"></i>
						</a>
					</li>
					<li>
						<a class="tooltips" href="schIndex.jsp">
							<span>Settings</span>
							<i class="lnr lnr-cog"></i>
						</a>
					</li>
					<li>
						<a class="tooltips" href="logoutServ">
							<span>Log out</span>
							<i class="lnr lnr-power-switch"></i>
						</a>
					</li>
				</ul>
			</div>
			<!--//down-->
			<div class="menu">
				<ul id="menu">
					<li>
						<a href="schIndex.jsp">
							<i class="fa fa-tachometer"></i>
							<span>主页</span>
						</a>
					</li>
					<li id="menu-academico">
						<a href="findStudentServlet?currentPage=0">
							<i class="fa fa-table"></i>
							<span>学生信息管理</span>
							<!-- <span class="fa fa-angle-right" style="float: right"></span> -->
						</a>
					</li>
					<li id="menu-academico">
						<a href="FindCompanyServ?currentPage=0">
							<i class="fa fa-table"></i>
							<span>企业信息管理</span>
						</a>
					</li>
					<li>
						<a href="statics.jsp">
							<i class="lnr lnr-chart-bars"></i>
							<span>数据统计</span>
						</a>
					</li>
					<li id="menu-comunicacao">
						<a href="#">
							<i class="lnr lnr-pencil"></i>
							<span>公告管理</span>
							<span class="fa fa-angle-right" style="float: right"></span>
						</a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width:120px">
								<a href="sch_grids.jsp">公告发布</a>
							</li>
							<li id="menu-mensagens" style="width:120px">
								<a href="FindNoteServ?currentPage=1">发布公告管理</a>
							</li>
						</ul>
					</li>
					<li id="menu-comunicacao">
						<a href="#">
							<i class="fa fa-smile-o"></i>
							<span>更多</span>
							<span class="fa fa-angle-right" style="float: right"></span>
						</a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width:120px">
								<a href="sch_contact.jsp">联系我们</a>
							</li>
						</ul>
					</li>


				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<script>
		var toggle = true;

		$(".sidebar-icon").click(function () {
			if (toggle) {
				$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
				$("#menu span").css({ "position": "absolute" });
			}
			else {
				$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
				setTimeout(function () {
					$("#menu span").css({ "position": "relative" });
				}, 400);
			}

			toggle = !toggle;
		});
	</script>
	<!--js -->
	<link rel="stylesheet" href="css/vroom.css">
	<script type="text/javascript" src="js/vroom.js"></script>
	<script type="text/javascript" src="js/TweenLite.min.js"></script>
	<script type="text/javascript" src="js/CSSPlugin.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>