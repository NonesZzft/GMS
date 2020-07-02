<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" errorPage="error.jsp"%>
<%@ page import="dao.ConnectMySql"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>详情页</title>

<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<link rel="shortcut icon"
	href="http://www.scu.edu.cn/images/favicon.png">
<link rel="stylesheet" href="./details/common.css">
<link rel="stylesheet" href="./details/content.css">
<!--Announced by Visual SiteBuilder 9-->
<link rel="stylesheet" type="text/css" href="./details/_sitegray.css">
<!-- CustomerNO:77656262657232307003475455525640035748 -->
<link rel="stylesheet" type="text/css" href="./details/content1.vsb.css">
</head>

<body>
	<div class="news-content">
		<div class="topBox">
			<div class="topContainer">
				<div class="head-left">

					<!-- 网站logo图片地址请在本组件"内容配置-网站logo"处填写 -->
					<a href="index.jsp" title="川大主站" class="logo"> <img
						src="./indexes/logo.png">
					</a>
				</div>

				<div class="head-right">
					<ul class="hr-left" style="width: 60px;">
						<!-- 注意修改超链接 -->
						<li><a href="login.jsp" target="_blank" title="">登录</a></li>
					</ul>
					<div class="hr-right">
						<img src="./四川大学 Sichuan University_files/search.png"
							class="go-search" alt="">
					</div>
				</div>

				<script type="text/javascript">
					function _nl_ys_t_check() {

						var keyword = document
								.getElementById('showkeycode195929').value;
						if (keyword == null || keyword == "") {
							alert("请输入你要检索的内容！");
							return false;
						}
						if (window.toFF == 1) {
							document
									.getElementById("lucenenewssearchkey195929").value = Simplized(keyword);
						} else {
							document
									.getElementById("lucenenewssearchkey195929").value = keyword;
						}
						new VsbFormFunc().disableAutoEnable(document
								.getElementById("showkeycode195929"));
						return true;
					}
				</script>
				<div class="search-block">
					<form action="HomeSearchServlet" method="post" id="au3a"
						name="au3a" onsubmit="return _nl_ys_t_check()">
						<input type="hidden" name="currentPage" value="1" /><input type="text" name="showkeycode"
							id="showkeycode195929" class="se-input" placeholder="请输入关键字..">
						<input type="image" class="se-btn" src="./details/se-icon.png">
						<img src="./details/close.png" class="se-close" alt="">
					</form>
				</div>


				<script language="javascript" src="./details/formfunc.js.下载"></script>

			</div>
		</div>

		<div class="navBox border">
			<div class="nav-menu">
				<a href="index.jsp"> <img src="./indexes/nav-home.png">
				</a>


				<ul class="nav">

					<li><a>就业中心</a>
						<div class="nav-submenu" style="display: none;">
							<ul class="sub-links">
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=issue&currentPage=1">就业形势与热点问题</a></li>
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=guidence&currentPage=1"> 指导培训信息</a></li>
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=policy&currentPage=1">就业政策与法规</a></li>
							</ul>
						</div></li>

					<li><a>企业服务</a>
						<div class="nav-submenu" style="display: none;">
							<ul class="sub-links">
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=college&currentPage=1">院系介绍</a></li>
							</ul>
						</div></li>

					<li><a>招聘在线</a>
						<div class="nav-submenu" style="display: none;">
							<ul class="sub-links">
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=position&currentPage=1">职位信息</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=position&currentPage=1">招聘会信息</a></li>
							</ul>
						</div></li>

					<li><a>其他</a>
						<div class="nav-submenu" style="display: none;">
							<ul class="sub-links">
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=survey&currentPage=1">最新调查</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>

		<%
			String Pid = request.getParameter("id");
			System.out.println(Pid);
			Connection ServletConn = ConnectMySql.getConn();
			ResultSet rs;
			PreparedStatement pstmt;
			pstmt = ServletConn.prepareStatement(
					"select * from passage where Passagenumber= ?");
			pstmt.setString(1, Pid);
			rs=pstmt.executeQuery();
			while(rs.next()){
			System.out.println("查询成功");
			System.out.println(rs.getString(1));
			request.getSession().removeAttribute("title");
			request.getSession().removeAttribute("author");
			request.getSession().removeAttribute("context");
			request.getSession().removeAttribute("date");
			request.getSession().removeAttribute("variety");
			
			request.getSession().setAttribute("title",rs.getString(1));
			request.getSession().setAttribute("author", rs.getString(2));
			request.getSession().setAttribute("context",rs.getString(3));
			request.getSession().setAttribute("date", rs.getString(4));
			request.getSession().setAttribute("variety", rs.getString(5));
	
			}
		%>

		<div class="main">
			<div class="loc-section">
				<div class="locationContainer">
					<div class="loc-block">
						<p class="location">
							<a href="index.jsp">首页</a> · <a href="index.jsp"><%=session.getAttribute("variety")%></a>
							· 正文
						</p>
						<p class="column-name"><%=session.getAttribute("variety")%></p>
					</div>
				</div>
			</div>

			<link href="./details/photoswipe.css" type="text/css"
				rel="stylesheet">
			<form name="content">
				<div class="contentContainer">
					<p class="t_title"></p>
					<p class="title"><%=session.getAttribute("title")%></p>
					<p class="b_title"></p>
					<p class="info">
						<span class="s1">发布时间 ：<%=session.getAttribute("date")%></span>
						<span class="s1">来源 ：<%=session.getAttribute("author")%>
						</span> <span class="s1">浏览量 ：111 </span>
					</p>

					<div class="content" id="vsb_content">
						<div class="v_news_content">
							<p><%=session.getAttribute("context")%></p>
							<!-- <p>
								崇高的事业需要榜样的引领，奋斗的精神激发前行的力量。在四川大学庆祝中国共产党成立97周年暨表彰大会上，学校党委对包括文学与新闻学院党委等6个先进基层党委、经济学院经济系党支部等24个先进党支部在内的30个基层党组织予以表彰。近年来，受表彰的30个先进基层党组织按照全面从严治党的要求，围绕中心、服务大局，切实把基层党建工作落到实处，以改革创新精神推进本单位事业发展迈上了新的台阶，充分发挥了基层党组织的战斗堡垒作用。
								<br>
							</p>
							 <p style="text-align: center;">
								<strong>先进基层党委：坚持党的全面领导 推进党建与事业融合发展</strong>
							</p> 
							<p>
								<br>
							</p> -->
						</div>
					</div>
				</div>

				<div class="tipsContainer"></div>
				<div class="backContainer">
					<a href="index.jsp"> <img src="./details/content-back.png"
						alt=""> 返回至首页
					</a>
				</div>
			</form>
		</div>

		<div class="footer" style="height: 50px; padding: 12px;">
			<div class="foot-top">
				<p style="text-align: center; font-size: 1em; color: white;">
					Copyright © 2018.Company name All rights reserved.</a>
			</div>
		</div>
		<div class="backTop" id="backTop" style="display: block;"></div>

		<script src="./details/jquery.js.下载"></script>
		<script src="./details/common.js.下载"></script>
		<script src="./details/selectFilter.js.下载"></script>
</body>

</html>