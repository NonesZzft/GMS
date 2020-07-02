<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="error.jsp"%>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>newsList</title>

<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="description" content="四川大学">

<link rel="shortcut icon"
	href="http://www.scu.edu.cn/images/favicon.png">
<link rel="stylesheet" href="./newsList/common.css">
<link rel="stylesheet" href="./newsList/list.css">
<!--Announced by Visual SiteBuilder 9-->
<link rel="stylesheet" type="text/css" href="./newsList/_sitegray.css">
<script language="javascript" src="./newsList/_sitegray.js.下载"></script>
<!-- CustomerNO:77656262657232307003475455525640035748 -->
<link rel="stylesheet" type="text/css"
	href="./newsList/index_news.vsb.css">
<script type="text/javascript" src="./newsList/vsbscreen.min.js.下载"
	id="_vsbscreen" devices="pc|pad"></script>
<script type="text/javascript" src="./newsList/counter.js.下载"></script>
<script type="text/javascript">
	_jsq_(1207, '/index_news.jsp', -1, 1420436181)
</script>
</head>

<body>
	<div class="news-list">
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
						<img src="./indexes/search.png" class="go-search" alt="">
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
						var base64 = new Base64();
						document.getElementById("lucenenewssearchkey195929").value = base64
								.encode(document
										.getElementById("lucenenewssearchkey195929").value);
						new VsbFormFunc().disableAutoEnable(document
								.getElementById("showkeycode195929"));
						return true;
					}
				</script>
				<div class="search-block">
					<form action="HomeSearchServlet"
						method="post" id="au3a" name="au3a"
						onsubmit="return _nl_ys_t_check()">
							<input type="hidden" name="currentPage" value="1" />
							<input type="text" name="showkeycode"
							id="showkeycode195929" class="se-input" placeholder="请输入关键字..">
						<input type="image" class="se-btn" src="./newsList/se-icon.png">
						<img src="./newsList/close.png" class="se-close" alt="">
					</form>
				</div>



				<script language="javascript" src="./newsList/base64.js.下载"></script>
				<script language="javascript" src="./newsList/formfunc.js.下载"></script>

			</div>
		</div>

		<div class="navBox">
			<div class="nav-menu">
				<a href="index.jsp"> <img src="./indexes/nav-home.png">
				</a>

<%System.out.println(request.getParameter("cols")); %>
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


		<div class="topHead">
			<div class="picContainer">
				<img src="./newsList/d_xw.png">
			</div>
		</div>
		<div class="main">
			<div class="locationContainer" style="text-align: left;">
				<div class="borderContainer" style="width: 1099.6px; left: 0;">
				</div>
				<div class="loc-block" style="right: 0; position: relative;">
					<p class="location" style="right: 0; position: relative;">
						<a href="index.jsp">首页</a> · <a href="index.jsp">查询结果有<%=request.getSession().getAttribute("ResultsCountInSession")%>条
						</a>
					</p>
					<p class="column-name">查询结果：</p>
				</div>
			</div>
			<div class="mainContainer clearfix">
				<div class="main-right" style="float: left; width: 1280px;">
					<script language="javascript" src="./newsList/statpagedown.js.下载"></script>



					<%-- <li><span class="date"><%=session.getAttribute("PNameInSession")%></span>
						<a href="details.jsp?id=<%=session.getAttribute("PIDInSession")%>"
						target="_blank" title=""><%=session.getAttribute("PContextInSession")%></a></li> --%>
					<ul class="list">
						<%
							Integer count, currentPage = 1, pageCount = 1, i = 0, j = 0;
							ArrayList<String> PName = (ArrayList<String>) session.getAttribute("PNameInSession");
							ArrayList<String> PID = (ArrayList<String>) session.getAttribute("PIDInSession");
							ArrayList<String> PContext = (ArrayList<String>) session.getAttribute("PContextInSession");
							ArrayList<String> PWriter = (ArrayList<String>) session.getAttribute("PWriterInSession");
							currentPage = (Integer) request.getAttribute("currentPage");
							
							System.out.println(PName);
							try {

								if (currentPage.equals(null)) {
									currentPage = 1;
								}
								if (session.getAttribute("ResultsCountInSession").equals(null)) {
									count = 0;
								} else {
									count = (int) session.getAttribute("ResultsCountInSession");
								}
								if (count % 3 == 0) {
									pageCount = count / 3;
								} else
									pageCount = count / 3 + 1;

								for (i = (currentPage - 1) * 3; i < currentPage * 3; i++) {
									if (i > (count - 1)) {
										break;
									}
						%>
						<li><span class="date">————by
								<%=PWriter.get(i)%></span> <a
							href="details.jsp?id=<%=PID.get(i)%>" target="_blank" title=""><%=PName.get(i)%></a></li>
						<%
							}
						%>
					</ul>
					<div class="page">
						<link rel="stylesheet" content-type="text/css"
							href="./newsList/sys.css">
						<div class="pb_sys_common pb_sys_normal pb_sys_style2"
							style="margin-top: 10px; text-align: center;">
							<span class="p_pages"> <%
 	if (currentPage == 1) {
 %> <span class="unuse">[第一页]</span> <span class="unuse">[上一页]</span> <%
 	} else {
 %> <span><a href="HomeSearchServlet?currentPage=1">[第一页]</a> </span> <span><a
									href="HomeSearchServlet?currentPage=<%=currentPage - 1%>">[上一页]</a>
							</span> <%
 	}
 	} //匹配<!--从request中提取值-->处得try
 	catch (Exception e) {
 		System.err.println(this.getClass() + "发生异常:" + e.getLocalizedMessage());
 		throw new Exception(this.getClass() + "发生异常.");
 	}
 %> <%
 	for (i = 1; i <= pageCount; i++) {
 		if (i == currentPage) {
 %> <span class="currentPage"><%=i%></span> <%
 	} else {
 %> <span><a href="HomeSearchServlet?currentPage=<%=i%>"><%=i%></a>
							</span> <%
 	}
 	}
 %> <%
 	if (currentPage == pageCount) {
 %> <span class="unuse">[下一页]</span> <span class="unuse">[最后一页]</span> <%
 	} else {
 %> <span><a
									href="HomeSearchServlet?currentPage=<%=currentPage + 1%>">[下一页]</a>
							</span> <span><a
									href="HomeSearchServlet?currentPage=<%=pageCount%>">[最后一页]</a>
							</span> <%
 	}
 %> <select name="currentPage">
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
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer" style="height: 50px; padding: 12px;">
			<div class="foot-top">
				<p style="text-align: center; font-size: 1em; color: white;">
					Copyright © 2018.Company name All rights reserved.</a>
			</div>
		</div>

		<div class="backTop" id="backTop"></div>
	</div>
	<script src="./newsList/jquery.js.下载"></script>
	<script src="./newsList/common.js.下载"></script>
	<script src="./newsList/selectFilter.js.下载"></script>
	<script>
		var links = [ ".one", ".two" ];
		$.each(links, function(index, item) {
			$(item).selectFilter({
				callBack : function(val) {
					if (val != "") {
						window.location.href = val;
					}
				}
			});
		})
		//border
		function cal_border() {
			var m_r = $(".mainContainer").offset().left;
			var m_w = $(".main-right").width();
			if (m_r > 0) {
				$(".borderContainer").width(m_w + m_r);
			}
		}
		cal_border();
		window.onresize = function() {
			cal_border();
		}
	</script>


</body>

</html>