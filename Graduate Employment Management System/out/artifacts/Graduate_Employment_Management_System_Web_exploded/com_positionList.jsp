<%@ page import="com.hwadee.pojo.Company"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE HTML>
<html>

<head>
<title>企业信息列表</title>
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
<!-- /js -->
<script src="js/jquery-1.10.2.min.js"></script>
<!-- //js-->
</head>

<body>
	<%
		if (session.getAttribute("udpmes") != null) {
			if (session.getAttribute("udpmes").equals("success")) {
				out.print("<script type='text/javascript'>alert('修改成功');</script>");
				session.removeAttribute("udpmes");
			} else {
				out.print("<script type='text/javascript'>alert('修改失败');</script>");
				session.removeAttribute("udpmes");
			}

		} else if (session.getAttribute("delmes") != null) {
			if (session.getAttribute("delmes").equals("success")) {
				out.print("<script type='text/javascript'>alert('删除成功');</script>");
				session.removeAttribute("delmes");
			} else {
				out.print("<script type='text/javascript'>alert('删除失败');</script>");
				session.removeAttribute("delmes");
			}
		} else if (session.getAttribute("addmes") != null) {
			if (session.getAttribute("addmes").equals("success")) {
				out.print("<script type='text/javascript'>alert('添加成功');</script>");
				session.removeAttribute("addmes");
			} else {
				out.print("<script type='text/javascript'>alert('添加失败');</script>");
				session.removeAttribute("addmes");
			}
		}
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
									class="text" /> <input
									type="submit" value="">
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
							<li class="active">发布的职位列表</li>
						</ol>
					</div>
					<!--//sub-heard-part-->
					<div class="graph-visual tables-main">
						<h3 class="inner-tittle two" style="display: inline">发布的职位列表</h3>
						<form style="align: center; display: inline;"
							action="com_posList_add.jsp" method="post">
							<input style="display: inline; border: none" type="image"
								src="images/add.jpg">
						</form>
						<div class="graph">
							<div class="tables">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th>职位</th>
											<th>数量</th>
											<th>工资</th>
											<th>职位要求</th>
											<th>公司id</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											/*currentPage : 当前页号 ，count ：记录的总数目 ，pageCount ：总页数 ,
											                                 *i ： 数组元素的下标，用于遍历数组元素；数组列表中的数组元素是学生记录
											                                 */
											Integer currentPage = 1, count = 0, pageCount = 1, i = 0;

											//获取当前页号
											currentPage = (Integer) request.getAttribute("currentPage");
											//获取记录总数
											count = (Integer) request.getAttribute("count");

											if (currentPage.equals(null)) {
												currentPage = 1;
											}
											if (count.equals(null)) {
												count = 0;
											}

											//每页显示7条记录，计算总页数
											if (count % 7 == 0) {
												pageCount = count / 7;
											} else {
												pageCount = count / 7 + 1;
											}

											// 获取信息集合
											List<com.hwadee.pojo.ComPos> list = (List<com.hwadee.pojo.ComPos>) session.getAttribute("list");
											// 判断集合是否有效
											if (list == null || list.size() < 1) {
												out.print("没有数据");
											} else {
												// 遍历集合中的数据
												for (i = (currentPage - 1) * 7; i < currentPage * 7 && i < list.size(); i++) {
										%>
										<tr>
											<%--<th scope="row">1</th>--%>
											<td><%=list.get(i).getComposition()%></td>
											<td><%=list.get(i).getComamount()%></td>
											<td><%=list.get(i).getComsalary()%></td>
											<td><%=list.get(i).getComcondition()%></td>
											<td><%=list.get(i).getPoComid()%></td>
											<td>
												<form style="align: center; display: inline;"
													action="FindSpecificPositionServlet?PoComid=<%=list.get(i).getPoComid()%>&Composition=<%=URLEncoder.encode(list.get(i).getComposition(), "UTF-8")%>"
													method="post">
													<!--  PoComid：<input type="text" name="PoComid" value="<%=list.get(i).getPoComid()%>">
                                        //Composition：<input type="text" name="Composition" value="<%=list.get(i).getComposition()%>">-->

													<input type="submit" value="编辑">
												</form>
												<form style="align: center; display: inline"
													action="DelPositionServlet?Composition=<%=list.get(i).getComposition()%>&PoComid=<%=list.get(i).getPoComid()%>"
													onsubmit="return sumbit_form()" method="post">
													<!-- ???? -->
													<input style="background-color: #C31916; display: inline"
														type="submit" value="删除">
												</form>
											</td>
										</tr>
										<%
											}
											}
										%>
									</tbody>
								</table>
								<!-- 底部-->
								<div align="center">
									<%
										if (currentPage == 1) {
									%>
									<span class="unuse">[第一页]</span> <span class="unuse">[上一页]</span>
									<%
										} else {
									%>
									<span><a href="FindPositionServlet?currentPage=1">[第一页]</a>
									</span> <span><a
										href="FindPositionServlet?currentPage=<%=currentPage - 1%>">[上一页]</a>
									</span>
									<%
										}
										//匹配<!--从request中提取值-->处得try
									%>
									<%
										for (i = 1; i <= pageCount; i++) {
											if (i == currentPage) {
									%>
									<span class="currentPage"><%=i%></span>
									<%
										} else {
									%>
									<span><a href="FindPositonServlet?currentPage=<%=i%>"><%=i%></a>
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
										href="FindPositionServlet?currentPage=<%=currentPage + 1%>">[下一页]</a>
									</span> <span><a
										href="FindPositionServlet?currentPage=<%=pageCount%>">[最后一页]</a>
									</span>
									<%
										}
									%>
									<form action="FindPositionServlet" id="frm"
										style="display: inline;">
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
										</select> <input type="submit" name="jspGo" value="去" />
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