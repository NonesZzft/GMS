<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>公告发布</title>
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
</head>

<body>
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



				<div class="outter-wp">
					<!--sub-heard-part-->
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="schIndex.jsp">主页</a></li>
							<li class="active">公告发布</li>
						</ol>
					</div>
					<!--//sub-heard-part-->
					<div class="graph-visual">
						<h2 class="inner-tittle">公告发布</h2>
						<div class="maark-edit graph">
							<form action="PublishNoticeServlet" method="post">
								<div class="form-group">
									<input class="form-control" name="Passagename" type="text"
										placeholder="标题?">
								</div>
								<div class="md-editor" id="1454925081632">

									<textarea name="Passagecontext" data-provide="markdown"
										rows="15" class="md-input" style="resize: none;">请输入发布的内容！
										                </textarea>
									<!-- <div class="md-fullscreen-controls">
																			<a href="#" class="exit-fullscreen" title="Exit fullscreen"><span class="glyphicon glyphicon-fullscreen"></span></a>
																		</div> -->
								</div>
								<div class="radio">
									<a style="float: left; color: black">请选择发布板块：</a> <label
										class="radio-inline"> <input type="radio"
										name="Passagevariety" id="optionsRadios1" value="notation"
										checked>公告
									</label> <label class="radio-inline"> <input type="radio"
										name="Passagevariety" id="optionsRadios2" value="position">招聘会信息
									</label> <label class="radio-inline"> <input type="radio"
										name="Passagevariety" id="optionsRadios3" value="survey">最新调查
									</label> <label class="radio-inline"> <input type="radio"
										name="Passagevariety" id="optionsRadios4" value="issue">热点问题与就业形式
									</label> <label class="radio-inline"> <input type="radio"
										name="Passagevariety" id="optionsRadios5" value="policy">政策法规
									</label> <label class="radio-inline"> <input type="radio"
										name="Passagevariety" id="optionsRadios6" value="guidence">指导培训信息
									</label>

								</div>

								<hr>
								<button type="submit" class="btn">Submit</button>
							</form>
						</div>
						<script>
							$("#target-editor")
									.markdown(
											{
												savable : true,
												onShow : function(e) {
													alert("Showing "
															+ e.$textarea
																	.prop(
																			"tagName")
																	.toLowerCase()
															+ "#"
															+ e.$textarea
																	.attr("id")
															+ " as Markdown Editor...")
												},
												onPreview : function(e) {
													var previewContent

													if (e.isDirty()) {
														var originalContent = e
																.getContent()

														previewContent = "Prepended text here..."
																+ "\n"
																+ originalContent
																+ "\n"
																+ "Apended text here..."
													} else {
														previewContent = "Default content"
													}

													return previewContent
												},
												onSave : function(e) {
													alert("Saving '"
															+ e.getContent()
															+ "'...")
												},
												onChange : function(e) {
													console.log("Changed!")
												},
												onFocus : function(e) {
													alert("Focus triggered!")
												},
												onBlur : function(e) {
													alert("Blur triggered!")
												}
											})
						</script>
					</div>

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
			</a> <a href="schIndex.jsp"> <span id="logo">
					<h1>学校端</h1>
			</span> <!--<img id="logo" src="" alt="Logo"/>-->
			</a> </header>
			<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
			<!--/down-->
			<div class="down">
				<a href="schIndex.jsp"> <span class=" name-caret"><%=session.getAttribute("NameInSession")%></span>
				</a>
				<p>System Administrator in School</p>
				<ul>
					<li><a class="tooltips" href="schIndex.jsp"> <span>Profile</span>
							<i class="lnr lnr-user"></i>
					</a></li>
					<li><a class="tooltips" href="schIndex.jsp"> <span>Settings</span>
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
					<li><a href="schIndex.jsp"> <i class="fa fa-tachometer"></i>
							<span>主页</span>
					</a></li>
					<li id="menu-academico"><a
						href="findStudentServlet?currentPage=0"> <i
							class="fa fa-table"></i> <span>学生信息管理</span> <!-- <span class="fa fa-angle-right" style="float: right"></span> -->
					</a></li>
					<li id="menu-academico"><a
						href="FindCompanyServ?currentPage=0"> <i class="fa fa-table"></i>
							<span>企业信息管理</span>
					</a></li>
					<li><a href="statics.jsp"> <i class="lnr lnr-chart-bars"></i>
							<span>数据统计</span>
					</a></li>
					<li id="menu-comunicacao"><a href="#"> <i
							class="lnr lnr-pencil"></i> <span>公告管理</span> <span
							class="fa fa-angle-right" style="float: right"></span>
					</a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width: 120px"><a
								href="sch_grids.jsp">公告发布</a></li>
							<li id="menu-mensagens" style="width: 120px"><a
								href="FindNoteServ?currentPage=1">发布公告管理</a></li>
						</ul></li>
					<li id="menu-comunicacao"><a href="#"> <i
							class="fa fa-smile-o"></i> <span>更多</span> <span
							class="fa fa-angle-right" style="float: right"></span>
					</a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width: 120px"><a
								href="sch_contact.jsp">联系我们</a></li>
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