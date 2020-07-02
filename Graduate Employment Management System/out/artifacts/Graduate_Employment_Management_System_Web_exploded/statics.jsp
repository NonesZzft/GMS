<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>数据统计</title>
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
<script src="js/echarts.js"></script>
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



				<!--/outer-wp-->
				<div class="outter-wp">
					<!--/sub-heard-part-->
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="index.jsp">主页</a></li>
							<li class="active">数据统计</li>
						</ol>
					</div>
					<!--/sub-heard-part-->
					<!--/inner-charts-->
					<div>
						<ol class="breadcrumb m-b-0">

							<li class="active"><a
								href="#">职位信息</a></li>
							<li onclick="showchart4(),showchart5(),showchart6()"><a
								href="statics2.jsp">就职信息</a></li>
						</ol>

					</div>
					<div id="main"
						style="height: 500px; width: 100%; border: 1px solid #ccc; padding: 10px; float: left"></div>
					<div id="main1"
						style="height: 500px; width: 50%; border: 1px solid #ccc; padding: 10px; float: left"></div>
					<div id="main2"
						style="height: 500px; width: 50%; border: 1px solid #ccc; padding: 10px; float: right"></div>
					<script type="text/javascript">
						
							var myChart = echarts.init(document
									.getElementById('main1'));

							option = {
								backgroundColor : '#2c343c',

								title : {
									text : '职位信息饼状图',
									left : 'center',
									top : 20,
									textStyle : {
										color : '#ccc'
									}
								},

								tooltip : {
									trigger : 'item',
									formatter : "{a} <br/>{b} : {c} ({d}%)"
								},

								visualMap : {
									show : false,
									min : 2,
									max : 8,
									inRange : {
										colorLightness : [ 0, 1 ]
									}
								},
								series : [ {
									name : '访问来源',
									type : 'pie',
									radius : '55%',
									center : [ '50%', '50%' ],
									data : [ {
										value : 6,
										name : '新闻小编'
									}, {
										value : 5,
										name : '网站前端'
									}, {
										value : 3,
										name : '网站后端'
									}, {
										value : 1,
										name : '历史顾问'
									}, {
										value : 3,
										name : '机器学习'
									} ].sort(function(a, b) {
										return a.value - b.value;
									}),
									roseType : 'radius',
									label : {
										normal : {
											textStyle : {
												color : 'rgba(255, 255, 255, 0.3)'
											}
										}
									},
									labelLine : {
										normal : {
											lineStyle : {
												color : 'rgba(255, 255, 255, 0.3)'
											},
											smooth : 0.2,
											length : 10,
											length2 : 20
										}
									},
									itemStyle : {
										normal : {
											color : '#c23531',
											shadowBlur : 200,
											shadowColor : 'rgba(0, 0, 0, 0.5)'
										}
									},

									animationType : 'scale',
									animationEasing : 'elasticOut',
									animationDelay : function(idx) {
										return Math.random() * 200;
									}
								} ]
							};
							myChart.setOption(option);
						
					</script>

					<script type="text/javascript">
						
							var myChart = echarts.init(document
									.getElementById('main2'));
							// 显示标题，图例和空的坐标轴
							myChart.setOption({
								title : {
									text : '职位信息表'
								},
								tooltip : {},
								legend : {
									data : [ '职位' ]
								},
								xAxis : {
									data : []
								},
								yAxis : {},
								series : [ {
									name : '数量',
									type : 'bar',
									data : []
								} ]
							});

							myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

							var names = []; //类别数组（实际用来盛放X轴坐标值）
							var nums = []; //销量数组（实际用来盛放Y坐标值）

							$
									.ajax({
										type : "post",
										async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
										url : "StaticsServlet1", //请求发送到TestServlet处
										data : {},
										dataType : "json", //返回数据形式为json
										success : function(result) {
											//请求成功时执行该函数内容，result即为服务器返回的json对象
											if (result) {
												for (var i = 0; i < result.length; i++) {
													names.push(result[i].name); //挨个取出类别并填入类别数组
												}
												for (var i = 0; i < result.length; i++) {
													nums.push(result[i].num); //挨个取出销量并填入销量数组
												}
												myChart.hideLoading(); //隐藏加载动画
												myChart.setOption({ //加载数据图表
													xAxis : {
														data : names
													},
													series : [ {
														// 根据名字对应到相应的系列
														name : [ '职位' ],
														data : nums
													} ]
												});

											}

										},
										error : function(errorMsg) {
											//请求失败时执行该函数
											alert("图表请求数据失败!");
											myChart.hideLoading();
										}
									})
						
					</script>
					<script type="text/javascript">
						
							var myChart = echarts.init(document
									.getElementById('main'));
							// 显示标题，图例和空的坐标轴
							myChart.setOption({
								title : {
									text : '职位信息表'
								},
								tooltip : {},
								legend : {
									data : [ '职位' ]
								},
								xAxis : {
									data : []
								},
								yAxis : {},
								series : [ {
									name : '数量',
									type : 'line',
									data : []
								} ]
							});

							myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

							var names = []; //类别数组（实际用来盛放X轴坐标值）
							var nums = []; //销量数组（实际用来盛放Y坐标值）

							$
									.ajax({
										type : "post",
										async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
										url : "StaticsServlet1", //请求发送到TestServlet处
										data : {},
										dataType : "json", //返回数据形式为json
										success : function(result) {
											//请求成功时执行该函数内容，result即为服务器返回的json对象
											if (result) {
												for (var i = 0; i < result.length; i++) {
													names.push(result[i].name); //挨个取出类别并填入类别数组
												}
												for (var i = 0; i < result.length; i++) {
													nums.push(result[i].num); //挨个取出销量并填入销量数组
												}
												myChart.hideLoading(); //隐藏加载动画
												myChart.setOption({ //加载数据图表
													xAxis : {
														data : names
													},
													series : [ {
														// 根据名字对应到相应的系列
														name : [ '职位' ],
														data : nums
													} ]
												});

											}

										},
										error : function(errorMsg) {
											//请求失败时执行该函数
											alert("图表请求数据失败!");
											myChart.hideLoading();
										}
									})
						
					</script>
					<script type="text/javascript">
						function showchart4() {
							var myChart = echarts.init(document
									.getElementById('main'));
							option = {
								title : {
									text : '一周就职去向图'
								},
								tooltip : {
									trigger : 'axis'
								},
								legend : {
									data : [ '华为', '腾讯', '百度', '阿里', '新浪' ]
								},
								grid : {
									left : '3%',
									right : '4%',
									bottom : '3%',
									containLabel : true
								},
								toolbox : {
									feature : {
										saveAsImage : {}
									}
								},
								xAxis : {
									type : 'category',
									boundaryGap : false,
									data : [ '周一', '周二', '周三', '周四', '周五',
											'周六', '周日' ]
								},
								yAxis : {
									type : 'value'
								},
								series : [ {
									name : '华为',
									type : 'line',
									stack : '总量',
									data : [ 12, 13, 11, 14, 9, 23, 21 ]
								}, {
									name : '腾讯',
									type : 'line',
									stack : '总量',
									data : [ 22, 18, 11, 23, 29, 33, 31 ]
								}, {
									name : '百度',
									type : 'line',
									stack : '总量',
									data : [ 10, 22, 21, 14, 19, 33, 41 ]
								}, {
									name : '阿里',
									type : 'line',
									stack : '总量',
									data : [ 32, 33, 30, 33, 39, 33, 32 ]
								}, {
									name : '新浪',
									type : 'line',
									stack : '总量',
									data : [ 2, 12, 15, 24, 10, 10, 10 ]
								} ]
							};
							myChart.setOption(option);
						}
					</script>
					<script>
					function showchart5(){ var myChart = echarts.init(document
					.getElementById('main1'));
					option = {
							title : {
								text : '                                                                          毕业生就业去向总览'
							},
						    tooltip: {
						        trigger: 'item',
						        formatter: "{a} <br/>{b}: {c} ({d}%)"
						    },
						    legend: {
						        orient: 'vertical',
						        x: 'left',
						        data:['华为','腾讯','百度','阿里','新浪']
						    },
						    series: [
						        {
						            name:'访问来源',
						            type:'pie',
						            radius: ['50%', '70%'],
						            avoidLabelOverlap: false,
						            label: {
						                normal: {
						                    show: false,
						                    position: 'center'
						                },
						                emphasis: {
						                    show: true,
						                    textStyle: {
						                        fontSize: '60',
						                        fontWeight: 'bold'
						                    }
						                }
						            },
						            labelLine: {
						                normal: {
						                    show: false
						                }
						            },
						            data:[
						                {value:335, name:'华为'},
						                {value:310, name:'腾讯'},
						                {value:234, name:'百度'},
						                {value:135, name:'新浪'}
						            ]
						        }
						    ]
						};
					
					myChart.setOption(option);
					}				
				</script>
				<script>
					function showchart6(){ var myChart = echarts.init(document
					.getElementById('main2'));
					option = {
						    title: {
						        text: '历史招聘分布'
						    },
						    tooltip: {},
						    legend: {
						        data: ['华为', '腾讯', '百度', '阿里', '新浪']
						    },
						    radar: {
						        // shape: 'circle',
						        name: {
						            textStyle: {
						                color: '#fff',
						                backgroundColor: '#999',
						                borderRadius: 3,
						                padding: [3, 5]
						           }
						        },
						        indicator: [
						           { name: '新闻小编（Editor）', max: 65},
						           { name: '管理（Administration）', max: 160},
						           { name: '信息技术（Information Techology）', max: 300},
						           { name: '客服（Customer Support）', max: 380},
						           { name: '研发（Development）', max: 520},
						           { name: '市场（Marketing）', max: 250}
						        ]
						    },
						    series: [{
						        name: '预算 vs 开销（Budget vs spending）',
						        type: 'radar',
						        // areaStyle: {normal: {}},
						        data : [
						            {
						                value : [10, 100, 280, 350, 500, 190],
						                name : '华为'
						            },
						             {
						                value : [5, 140, 280, 310, 420, 210],
						                name : '腾讯'
						            },
						            {
						                value : [20, 140, 280, 310, 420, 200],
						                name : '百度'
						            },
						            {
						                value : [11, 140, 280, 310, 420, 210],
						                name : '阿里'
						            },
						            {
						                value : [50, 100, 280, 310, 40, 210],
						                name : '新浪'
						            }
						        ]
						    }]
						};
					
					myChart.setOption(option);
					}				
				</script>
					<!--/inner-charts-->
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