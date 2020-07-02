<%@ page language="java" import="java.util.Date"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>学生信息详情</title>
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
<link href="css/fabochart.css" rel='stylesheet' type='text/css' />
<!-- /js -->
<script src="js/jquery-1.10.2.min.js"></script>
<!-- //js-->
</head>

<body>
	<%
		String sname, sex, sno, college, major, cno, phone, email, psch, jsch, ssch, university, train, practice,
				intention, money, honor, certif, evaluation;
		Date birth;
		Integer cetf, cets;
		String path = request.getServletContext().getContextPath();
		System.out.println("path: " + path);
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
				<div class="outter-wp">
					<!--sub-heard-part-->
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="comIndex.jsp">主页</a></li>
							<li><a href="com_studentsListSeparateServlet?currentPage=0">学生信息检索</a></li>
							<li class="active">学生信息详情</li>
						</ol>
					</div>
					<!--//sub-heard-part-->
					<div class="graph-visual tables-main">
						<h3 class="inner-tittle two">学生信息</h3>
						<div class="graph">
							<li>基本信息</li>
							<div class="empty-line" style="height: 20px"></div>
							<div class="tables">

								<table class="table table-bordered">
									<tbody>
										<tr>
											<th style="text-align: center; width: 10%">姓名</th>
											<td class="inputinfo" width="12%"><input name="sname"
												id="sname"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_sname")%>"
												maxlength="15" type="text"></td>

											<th style="text-align: center; width: 10%">性别</th>
											<td class="inputinfo" width="12%"><input name="sex"
												id="sex"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_sex")%>"
												maxlength="1" type="text"></td>

											<th style="text-align: center; width: 10%">学号</th>
											<td class="inputinfo" colspan="2"><input name="sno"
												id="sno"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="" maxlength="13" type="text"></td>


											<!--pic
											<td colspan="4" rowspan="2">
												<div class="pic" width="100px">
													<img alt="" src="images/admin1.jpg" height="120px" width="100px">
												</div>
											</td>
											-->
										</tr>


										<tr>
											<th style="text-align: center; width: 10%">出生日期</th>
											<td class="inputinfo" width="12%"><input name="birth"
												id="birth"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_birth")%>"
												maxlength="10" type="text"></td>

											<th style="text-align: center; width: 10%">学院</th>
											<td class="inputinfo" width="12%"><input name="college"
												id="college"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_college")%>"
												maxlength="30" type="text"></td>

											<th style="text-align: center; width: 10%">专业</th>
											<td class="inputinfo" colspan="2"><input name="major"
												id="major"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_major")%>"
												maxlength="30" type="text"></td>
										</tr>

										<tr>
											<th style="text-align: center; width: 10%">大学四级</th>
											<td class="inputinfo" width="12%"><input name="cetf"
												id="cetf"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_cetf")%>"
												maxlength="3" type="text"></td>

											<th style="text-align: center; width: 10%">大学六级</th>
											<td class="inputinfo" width="12%"><input name="cets"
												id="cets"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_cets")%>"
												maxlength="3" type="text"></td>

											<th style="text-align: center; width: 10%">班号</th>
											<td class="inputinfo" width="12%"><input name="cno"
												id="cno"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_cno")%>"
												maxlength="30" type="text"></td>
										</tr>

										<tr>
											<th style="text-align: center; width: 10%">电话</th>
											<td class="inputinfo" colspan="2"><input name="phone"
												id="phone"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_phone")%>"
												maxlength="11" type="text"></td>


											<th style="text-align: center; width: 10%">email</th>
											<td class="inputinfo" colspan="2"><input name="email"
												id="email"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_email")%>"
												maxlength="30" type="text"></td>
										</tr>

									</tbody>
								</table>
							</div>

							<div class="empty-line" style="height: 20px"></div>
							<li>教育经历</li>
							<div class="empty-line" style="height: 20px"></div>
							<div class="tables">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th style="text-align: center; background: #f1fafb"
												colspan="1">学校层次</th>
											<th style="text-align: center; background: #f1fafb"
												colspan="2">学校名称</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th style="text-align: center; width: 10%">小学</th>

											<td class="inputinfo" colspan="2"><input name="psch"
												id="psch"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_psch")%>"
												maxlength="6" type="text"></td>
										</tr>

										<tr>
											<th style="text-align: center; width: 10%">初中</th>

											<td class="inputinfo" colspan="2"><input name="jsch"
												id="jsch"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_jsch")%>"
												maxlength="6" type="text"></td>
										</tr>

										<tr>
											<th style="text-align: center; width: 10%">高中</th>

											<td class="inputinfo" colspan="2"><input name="ssch"
												id="ssch"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_ssch")%>"
												maxlength="6" type="text"></td>
										</tr>

										<tr>
											<th style="text-align: center; width: 10%">大学</th>

											<td class="inputinfo" colspan="2"><input
												name="university" id="university"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_university")%>"
												maxlength="6" type="text"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="empty-line" style="height: 20px"></div>
							<li>工作经历</li>
							<div class="empty-line" style="height: 20px"></div>
							<div class="tables">
								<table class="table table-bordered" width="100%">
									<tbody>
										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">培训经历</th>
											<td class="inputinfo"><input name="train" id="train"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_train")%>"
												maxlength="200" type="text"></td>
										</tr>

										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">实践经历</th>
											<td class="inputinfo"><input name="practice"
												id="practice"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_practice")%>"
												maxlength="200" type="text"></td>
										</tr>

										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">求职意向</th>
											<td class="inputinfo"><input name="intention"
												id="intention"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_intention")%>"
												maxlength="200" type="text"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="empty-line" style="height: 20px"></div>
							<li>所获奖项</li>
							<div class="empty-line" style="height: 20px"></div>
							<div class="tables">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">奖学金</th>
											<td class="inputinfo"><input name="money" id="money"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_money")%>"
												maxlength="50" type="text"></td>
										</tr>

										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">荣誉称号</th>
											<td class="inputinfo"><input name="honor" id="honor"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_hornor")%>"
												maxlength="50" type="text"></td>
										</tr>

										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">获得证书</th>
											<td class="inputinfo"><input name="certif" id="certif"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_certif")%>"
												maxlength="50" type="text"></td>
										</tr>

										<tr>
											<th
												style="text-align: center; background: #f1fafb; width: 10%">自我评价</th>
											<td class="inputinfo"><input name="evaluation"
												id="evaluation"
												style="width: 90%; color: grey; background-color: transparent; border: 0px"
												value="<%=request.getSession().getAttribute("zwt_evaluation")%>"
												maxlength="200" type="text"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="empty-line" style="height: 20px"></div>
							<li>求职信</li>
							<div class="maark-edit graph">
								<button type="submit" class="btn">点击查看</button>
							</div>
						</div>

					</div>
					<div class="maark-edit gtraph">
						<button type="submit" class="btn"
							onclick="javascript:history.back(-1);">返回</button>
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
				<header class="logo"> <a href="#" class="sidebar-icon">
					<span class="fa fa-bars"></span>
				</a> <a href="comIndex.jsp"> <span id="logo">
						<h1>企业端</h1>
				</span> <!--<img id="logo" src="" alt="Logo"/>-->
				</a> </header>
				<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
				<!--/down-->
				<div class="down">
					<a href="comIndex.jsp"> <span class=" name-caret"><%=session.getAttribute("NameInSession") %></span>
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
						<li id="menu-academico"><a href="FindPositionServlet?currentPage=0"> <i
								class="fa fa-table"></i> <span>发布的职位列表</span>
						</a></li>

						<li id="menu-academico"><a href="com_studentsListSeparateServlet?currentPage=1">
								<i class="fa fa-table"></i> <span>学生信息检索</span>
						</a></li>

						<li><a href="OfferServlet?currentPage=0"> <i class="lnr lnr-pencil"></i>
								<span>已投递的学生信息</span>
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
							$(".page-container").removeClass(
									"sidebar-collapsed").addClass(
									"sidebar-collapsed-back");
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