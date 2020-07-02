<%@ page language="java" import="java.util.Date"
	import="java.util.ArrayList" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>学生信息检索</title>
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
<!-- jQuery
	<link href='https://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
	-->
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/amcharts.js"></script>
<script src="js/serial.js"></script>
<script src="js/light.js"></script>
<script src="js/radar.js"></script>
<link href="css/barChart.css" rel='stylesheet' type='text/css' />
<link href="css/fabochart.css" rel='stylesheet' type='text/css' />
<!--clock init-->
<script src="js/css3clock.js"></script>
<!--Easy Pie Chart-->
<!--skycons-icons-->
<script src="js/skycons.js"></script>

<script src="js/jquery.easydropdown.js"></script>

<!--//skycons-icons-->
<!--seach box css-->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style_search.css">
<body>
	<%
		Integer currentPage = 1, count = 0, pageCount = 1, i = 0;
		String sname, sex, sno, college, major, cno, phone, email, psch, jsch, ssch, university, train, practice,
				intention, money, honor, certif, evaluation;
		Date birth;
		Integer cetf, cets;
		ArrayList<beans.Student> jspStudentList = null;
	%>
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
								<input type="text" value="Search" onFocus="this.value = '';"
									onBlur="if (this.value == '') {this.value = 'Search';}"
									class="text" /> <input type="submit" value="">
							</form>
							<div class="close">
								<img src="images/cross.png" />
							</div>
						</div>
						<script type="text/javascript">
							$('.main-search').hide();
							$('button').click(function() {
								$('.main-search').show();
								$('.main-search text').focus();
							});
							$('.close').click(function() {
								$('.main-search').hide();
							});
						</script>
						<!--/profile_details-->
						<div class="profile_details_left">
							<ul class="nofitications-dropdown">
								<li class="dropdown note dra-down"><script
										type="text/javascript">
									function DropDown(el) {
										this.dd = el;
										this.placeholder = this.dd
												.children('span');
										this.opts = this.dd
												.find('ul.dropdown > li');
										this.val = '';
										this.index = -1;
										this.initEvents();
									}
									DropDown.prototype = {
										initEvents : function() {
											var obj = this;

											obj.dd.on('click', function(event) {
												$(this).toggleClass('active');
												return false;
											});

											obj.opts.on('click', function() {
												var opt = $(this);
												obj.val = opt.text();
												obj.index = opt.index();
												obj.placeholder.text(obj.val);
											});
										},
										getValue : function() {
											return this.val;
										},
										getIndex : function() {
											return this.index;
										}
									}

									$(function() {

										var dd = new DropDown($('#dd'));

										$(document).click(
												function() {
													// all dropdowns
													$('.wrapper-dropdown-3')
															.removeClass(
																	'active');
												});

									});
								</script></li>
								<li class="dropdown note" style="float: right;"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="false"> <i class="fa fa-envelope-o"></i> <span
										class="badge">3</span>
								</a>


									<ul class="dropdown-menu two first">
										<li>
											<div class="notification_header">
												<h3>You have 3 new messages</h3>
											</div>
										</li>
										<li><a href="#">
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
										</a></li>
										<li class="odd"><a href="#">
												<div class="user_img">
													<img src="images/in.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li><a href="#">
												<div class="user_img">
													<img src="images/in1.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li>
											<div class="notification_bottom">
												<a href="#">See all messages</a>
											</div>
										</li>
									</ul></li>

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
				<form action="com_studentsListSeparateServlet"
					style="display: inline;">
					<div class="outter-wp">
						<!--sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="comIndex.jsp">主页</a></li>
								<li class="active">学生信息检索</li>
							</ol>
						</div>
						<!--//sub-heard-part-->
						<div class="graph-visual tables-main">
							<h3 class="inner-tittle two">学生信息</h3>

							<!--search box-->
							<div class="searchbox">
								<div class="mod_select">
									<div class="select_box">
										<span class="select_txt">姓名</span> <span class="select-icon"></span>
										<ul class="option">
											<li>姓名</li>
											<li>专业</li>
											<li>教育</li>
											<li>工作</li>
											<li>奖项</li>
											<li>意向</li>
										</ul>
									</div>
								</div>
								<form action="com_studentsListSeparateServlet?currentPage=0"
									method="post">
									<input type="hidden" name="type" value="姓名" id="select_value">
									<input type="text" name="info" id="searchPlaceholder"
										class="import" placeholder="请输入学生姓名"
										style="background-color: transparent; color: grey"> <input
										type="submit" value="搜索" class="btn-search">
								</form>
							</div>
							<script src="js/jquery.min.js"></script>
							<script>
								$(function() {
									$(".select_box")
											.click(
													function(event) {
														event.stopPropagation();
														$(this).find(".option")
																.toggle();
														$(this)
																.parent()
																.siblings()
																.find(".option")
																.hide();
													});
									$(document)
											.click(
													function(event) {
														var eo = $(event.target);
														if ($(".select_box")
																.is(":visible")
																&& eo
																		.attr("class") != "option"
																&& !eo
																		.parent(".option").length)
															$('.option').hide();
													});
									$(".option li")
											.click(
													function() {
														var check_value = $(
																this).text();
														var value0 = $(
																'.option li:eq(0)')
																.html();
														var value1 = $(
																'.option li:eq(1)')
																.html();
														var value2 = $(
																'.option li:eq(2)')
																.html();
														var value3 = $(
																'.option li:eq(3)')
																.html();
														var value4 = $(
																'.option li:eq(4)')
																.html();
														var value5 = $(
																'.option li:eq(5)')
																.html();
														$(this)
																.parent()
																.siblings(
																		".select_txt")
																.text(
																		check_value);
														$("#select_value").val(
																check_value);
														if (check_value == value0) {
															$(
																	'#searchPlaceholder')
																	.prop(
																			'placeholder',
																			'请输入学生姓名');
														} else if (check_value == value1) {
															$(
																	'#searchPlaceholder')
																	.prop(
																			'placeholder',
																			'请输入专业名称');
														} else if (check_value == value2) {
															$(
																	'#searchPlaceholder')
																	.prop(
																			'placeholder',
																			'请输入教育经历');
														} else if (check_value == value3) {
															$(
																	'#searchPlaceholder')
																	.prop(
																			'placeholder',
																			'请输入工作经历');
														} else if (check_value == value4) {
															$(
																	'#searchPlaceholder')
																	.prop(
																			'placeholder',
																			'请输入获奖信息');
														} else if (check_value == value5) {
															$(
																	'#searchPlaceholder')
																	.prop(
																			'placeholder',
																			'请输入意向');
														}
													});
								})
							</script>

							<div
								style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">
							</div>
							<!--//search box-->

							<%
								try {
									//获取当前页号
									currentPage = (Integer) request.getAttribute("zwt_currentPage");
									//获取记录总数
									count = (Integer) request.getAttribute("zwt_count");
									//获取接收到的request中的学生记录列表
									jspStudentList = (java.util.ArrayList<beans.Student>) request.getAttribute("zwt_StudentList");
									if (currentPage.equals(null)) {
										currentPage = 1;
									}
									if (count.equals(null)) {
										count = 0;
									}
									pageCount = (count - 1) / 3 + 1;//每页显示3条记录，计算总页数
							%>


							<div class="graph">
								<div class="tables">

									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">#</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">姓名</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">专业</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">教育</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">工作</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">奖项</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">意向</th>
												<th style="text-align: center; background: #f1fafb"
													colspan="1">详情</th>
											</tr>
										</thead>
										<tbody>
											<!--提取数组元素属性值-->
											<%
												//提取数组元素;第一个数组元素的下标是零,最后一个元素的下标是 (count - 1)
													for (i = (currentPage - 1) * 3; i < currentPage * 3; i++) {
														if (i > (count - 1)) {
															break;
														}

														//判断用户是否登录并显示其投递信息
														//Object name = request.getSession().getAttribute("NameInSession");
														//if (name == null) {
														//	throw new Exception("用户尚未登录.");
														//}

														//提取数组元素的属性值；jspStudentList.get(i)提取第i+1个元素
														sname = jspStudentList.get(i).getSname();
														major = jspStudentList.get(i).getMajor();
														university = jspStudentList.get(i).getUniversity();
														practice = jspStudentList.get(i).getPractice();
														certif = jspStudentList.get(i).getCertif();
														intention = jspStudentList.get(i).getIntention();
														sno = jspStudentList.get(i).getSno();
														System.out.println("sno is:" + sno);
											%>
											<tr>
												<th scope="row"
													style="text-align: center; background: #f1fafb" colspan="1">1</th>
												<td id="jspSname_<%=i%>" style="text-align: center;"><%=sname%></td>
												<td id="jspMajor_<%=i%>" style="text-align: center;"><%=major%></td>
												<td id="jspUniversity_<%=i%>" style="text-align: center;"><%=university%></td>
												<td id="jspPractice_<%=i%>" style="text-align: center;"><%=practice%></td>
												<td id="jspCertif_<%=i%>" style="text-align: center;"><%=certif%></td>
												<td id="jspIntention_<%=i%>" style="text-align: center;"><%=intention%></td>
												<td id="jspDetail_<%=i%>" style="text-align: center;"><a
													href="com_studentDetailServlet?sno=<%=sno%>">点击查看详情</a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>


							<!-- 只有第一页居中？？ -->
							<div align="center">
								<%
									if (currentPage == 1) {
								%>
								<span class="unuse">[第一页]</span> <span class="unuse">[上一页]</span>
								<%
									} else {
								%>
								<span><a
									href="com_studentsListSeparateServlet?currentPage=1">[第一页]</a>
								</span> <span><a
									href="com_studentsListSeparateServlet?currentPage=<%=currentPage - 1%>">[上一页]</a>
								</span>
								<%
									}
									} //匹配<!--从request中提取值-->处得try
									catch (Exception e) {
										System.err.println(this.getClass() + "发生异常:" + e.getLocalizedMessage());
										throw new Exception(this.getClass() + "发生异常.");
									}
								%>
								<%
									for (i = 1; i <= pageCount; i++) {
										if (i == currentPage) {
								%>
								<span class="currentPage"><%=i%></span>
								<%
									} else {
								%>
								<span><a
									href="com_studentsListSeparateServlet?currentPage=<%=i%>"><%=i%></a>
								</span>
								<%
									}
									}
								%>
								<%
									if (currentPage == pageCount) {
								%>
								<span class="unuse">[下一页]</span> <span class="unuse">[最后一页]</span>
								<%
									} else {
								%>
								<span><a
									href="com_studentsListSeparateServlet?currentPage=<%=currentPage + 1%>">[下一页]</a>
								</span> <span><a
									href="com_studentsListSeparateServlet?currentPage=<%=pageCount%>">[最后一页]</a>
								</span>
								<%
									}
								%>
								<select name="currentPage">
									<%
										for (i = 1; i <= pageCount; i++) {
									%>
									<option value="<%=i%>"
										<%=(i == currentPage ? "selected" : "")%>>
										<%=i%>
									</option>
									<%
										}
									%>
								</select> <input type="submit" name="jspGo" value="go" />
							</div>
						</div>
						<!--//graph-visual-->
					</div>
					<!--//outer-wp-->
				</form>


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
			<header class="logo"> <a href="#" class="sidebar-icon">
				<span class="fa fa-bars"></span>
			</a> <a href="comIndex.jsp"> <span id="logo">
					<h1>企业端</h1>
			</span> <!--<img id="logo" src="" alt="Logo"/>-->
			</a> </header>
			<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
			<!--/down-->
			<div class="down">
				<a href="comIndex.jsp"> <span class=" name-caret"><%=session.getAttribute("NameInSession")%></span>
				</a>
				<p>System Administrator in Company</p>
				<ul>
					<li><a class="tooltips" href="comIndex.jsp"> <span>Profile</span>
							<i class="lnr lnr-user"></i>
					</a></li>
					<li><a class="tooltips" href="comIndex.jsp"> <span>Settings</span>
							<i class="lnr lnr-cog"></i>
					</a></li>
					<li><a class="tooltips" href="logoutServ"> <span>Log
								out</span> <i class="lnr lnr-power-switch"></i>
					</a></li>
				</ul>
			</div>
			<!--//down-->
			<div class="menu">
				<ul id="menu">
					<li><a href="comIndex.jsp"> <i class="fa fa-tachometer"></i>
							<span>主页</span>
					</a></li>
					<li id="menu-academico"><a
						href="FindPositionServlet?currentPage=0"> <i
							class="fa fa-table"></i> <span>发布的职位列表</span>
					</a></li>

					<li id="menu-academico"><a
						href="com_studentsListSeparateServlet?currentPage=1"> <i
							class="fa fa-table"></i> <span>学生信息检索</span>
					</a></li>

					<li><a href="OfferServlet?currentPage=0"> <i
							class="lnr lnr-pencil"></i> <span>已投递的学生信息</span>
					</a></li>

					<li id="menu-comunicacao"><a href="#"> <i
							class="fa fa-smile-o"></i> <span>更多</span> <span
							class="fa fa-angle-right" style="float: none"></span>
					</a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width: 120px"><a
								href="com_contact.jsp">联系我们</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>

	<script>
		var toggle = true;

		$(".sidebar-icon").click(
				function() {
					if (toggle) {
						$(".page-container").addClass("sidebar-collapsed")
								.removeClass("sidebar-collapsed-back");
						$("#menu span").css({
							"position" : "absolute"
						});
					} else {
						$(".page-container").removeClass("sidebar-collapsed")
								.addClass("sidebar-collapsed-back");
						setTimeout(function() {
							$("#menu span").css({
								"position" : "relative"
							});
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