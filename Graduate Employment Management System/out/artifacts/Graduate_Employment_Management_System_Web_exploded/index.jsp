<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0022)http://www.scu.edu.cn/ -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>毕业生就业管理系统</title>

<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="renderer" content="webkit">

<link rel="shortcut icon"
	href="http://www.scu.edu.cn/images/favicon.png">
<link rel="stylesheet" href="./indexes/common.css">
<link rel="stylesheet" href="./indexes/style.css">
<!--Announced by Visual SiteBuilder 9-->
<link rel="stylesheet" type="text/css" href="./indexes/_sitegray.css">
<script language="javascript" src="./indexes/_sitegray.js.下载"></script>
<link rel="stylesheet" type="text/css" href="./indexes/index.vsb.css">
<script type="text/javascript" src="./indexes/vsbscreen.min.js.下载"
	id="_vsbscreen" devices="pc|pad"></script>
<script type="text/javascript" src="./indexes/counter.js.下载"></script>
</head>

<body>
	<div class="index">
		<div class="topBox">
			<div class="topContainer">
				<div class="head-left">

					<!-- 网站logo图片地址请在本组件"内容配置-网站logo"处填写 -->
					<a href="index.jsp" title="主站" class="logo"> <img
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
					<form action="HomeSearchServlet" method="post">
						<form id="au3a" name="au3a" onsubmit="return _nl_ys_t_check()">
							<input type="hidden" name="currentPage" value="1" /><input
								type="text" name="showkeycode"id="showkeycode195929"
								class="se-input"  placeholder="请输入关键字.."> 
								
								<input
								type="image" class="se-btn" src="./indexes/se-icon.png">
							<img src="./indexes/close.png" class="se-close" alt="">
						</form>
						
					</form>

				</div>



				<script language="javascript" src="./indexes/base64.js.下载"></script>
				<script language="javascript" src="./indexes/formfunc.js.下载"></script>

			</div>
		</div>


		<div class="navBox">
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
								<li><a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=schoolintroduction&currentPage=1">院系介绍</a></li>
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


		<div class="news">
			<div class="newsContainer clearfix">
				<div class="column zhxw" style="margin-right: 50px; width: 700px">
					<div class="col-title">
						<i class="icon icon-zhxw"></i> <span class="cn">最新公告</span> <span
							class="en">News &amp; Events </span> <span class="fr"> <a
							class="more" href="${pageContext.request.contextPath}/HomeSearchServlet?cols=notation&currentPage=1">更多&gt;&gt;</a>
						</span>
					</div>
					<ul class="news-list">
						<li><a href="./details.jsp?id=15322314"
							target="_blank" title="新时代全国高等学校本科教育工作会议在四川大学召开">新时代全国高等学校本科教育工作会议在四川大学召开</a>
							<span class="date">2018-06-22</span></li>
					</ul>
				</div>
				<div class="column zhxw" style="float: right;">

					<div class="col-title">
						<i class="icon icon-zhxw"></i> <span class="cn">招聘会信息</span> <span
							class="en">Job Fair </span> <span class="fr"> <a
							class="more" href="${pageContext.request.contextPath}/HomeSearchServlet?cols=position&currentPage=1"">更多&gt;&gt;</a>
						</span>
					</div>
					<ul class="news-list">
						<li><a href="./details.jsp?id=15322314"
							target="_blank" title="新时代全国高等学校本科教育工作会议在四川大学召开">新时代全国高等学校本科教育工作会议在四川大学召开</a>
							<span class="date">2018-06-22</span></li>

					</ul>
				</div>
			</div>
		</div>
		<div class="xskb">
			<div class="xskbContainer">
				<ul class="titlenav">
					<li class="xskbnav active"><a class="item01 fl"
						href="${pageContext.request.contextPath}/HomeSearchServlet?cols=issue&currentPage=1" target="_blank">
							<div class="col-title">
								<i class="icon icon-xskb"></i> <span class="cn">热点问题</span> <span
									class="en">Hot Issue</span>
							</div>
					</a></li>
					<li class="tzggnav"><a class="item02 fl"
						href="${pageContext.request.contextPath}/HomeSearchServlet?cols=policy&currentPage=1" 
						style="width: 400px">
							<div class="col-title">
								<i class="icon icon-tzgg"></i> <span class="cn">就业政策与法规</span> <span
									class="en">Policy & Law</span>
							</div>
					</a></li>
					<li class="mtcdnav"><a class="item03 fl"
						href="${pageContext.request.contextPath}/HomeSearchServlet?cols=survey&currentPage=1">
							<div class="col-title">
								<i class="icon icon-mtcd"></i> <span class="cn">最新调查</span> <span
									class="en">New Researches</span>
							</div>
					</a></li>
				</ul>

				<div class="xskbtxt tabdiv">

					<ul class="list xs">
						<li>
							<div class="dl"
								style="background: url(images/xs-bg.png) no-repeat;">
								<p class="month">2018-07</p>
								<p class="date">02</p>
							</div>
							<div class="dr">
								<div class="l1">
									<a href="details.jsp?id=123456"
										target="_blank" >ACM全宇宙总冠军</a>
								</div>
								<div class="l2">
									<img src="./indexes/zjricon.png" class="xs-icon1" alt="">李雷
								</div>
								<div class="l3">
									<img src="./indexes/xs2.png" class="xs-icon2" alt="">联系方式：XXXX
								</div>
							</div>
						</li>

					</ul>

					<b
						style="position: relative; right: 10px; top: -20px; display: block; float: right;">
						<a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=issue&currentPage=1" target="_blank"> <img
							src="./indexes/more.png">
					</a>
					</b>
				</div>


				<div class="tzggtxt tabdiv" style="display: none">
					<ul class="list tz">
						<li>
							<div class="dl"
								style="width: 100px; height: 80px; background: url(images/tz-bg.png) no-repeat;">
								<p class="month">2018-06</p>
								<p class="date">28</p>
							</div>
							<div class="dr">
								<div class="l1">
									<a href="details.jsp?id=123321"
										target="_blank" 
										style="line-height: 24px">关于2018年最新出台的就业政策</a>
								</div>
							</div>
						</li>
					</ul>
					<b
						style="position: relative; right: 10px; top: -20px; display: block; float: right;">
						<a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=policy&currentPage=1" target="_blank"> <img
							src="./indexes/more.png">
					</a>
					</b>
				</div>
				<div class="mtcdtxt tabdiv" style="display: none">
					<ul class="list mt">
						<li style="margin-bottom: 53px; height: 92px; overflow: hidden;">
							<div class="dl"
								style="width: 100px; height: 80px; background: url(images/mt-bg.png) no-repeat;">
								<p class="month">2018-06</p>
								<p class="date">18</p>
							</div>
							<div class="dr">
								<div class="l1" style="height: 57px;">
									<a href="details.jsp?id=111"
										target="_blank" title="【人民网】一个无学分课程 引发高校垃圾回收分类实践"
										style="line-height: 24px;">【人民网】一个无学分课程 引发高校垃圾回收分类实践</a>
								</div>
								<div class="l2" style="margin-top: 5px">【人民网 就业频道】</div>
							</div>
						</li>
					</ul>
					<b
						style="position: relative; right: 10px; top: -20px; display: block; float: right;">
						<a href="${pageContext.request.contextPath}/HomeSearchServlet?cols=survey&currentPage=1" target="_blank"> <img
							src="./indexes/more.png" alt="">
					</a>
					</b>
				</div>
			</div>
		</div>

		<div class="footer" style="height: 50px; padding: 12px;">
			<div class="foot-top">
				<p style="text-align: center; font-size: 1em; color: white;">
					Copyright © 2018.Company name All rights reserved.</a>
			</div>
		</div>
	</div>


	<script src="./indexes/jquery.js.下载"></script>
	<script src="./indexes/jquery.lazyload.js.下载"></script>
	<script src="./indexes/wySlider.min.js.下载"></script>
	<script src="./indexes/common.js.下载"></script>
	<script src="./indexes/selectFilter.js.下载"></script>
	<script>
		/*导航滑动特效*/
		$(document).scroll(function() {
			var top = $(document).scrollTop();
			if (top > 480) {
				$(".navbar-fixed-top").show();
			} else {
				$(".navbar-fixed-top").hide();
			}
		});
	</script>
	<script>
		//图片预加载效果
		$("img.lazy").lazyload({
			effect : "fadeIn",
			threshold : 200
		});
	</script>
	<script>
		$(".js-silder").silder({
			auto : true,
			speed : 20,
			sideCtrl : true,
			bottomCtrl : true,
			defaultView : 0,
			interval : 5000,
			activeClass : "active",
			preload : true
		});
	</script>
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
	</script>


</body>

</html>