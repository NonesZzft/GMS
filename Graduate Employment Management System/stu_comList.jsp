<%@ page import="com.hwadee.pojo.Position" %>
<%@ page import="java.util.List" %>
<%@ page import="org.omg.Messaging.SYNC_WITH_TRANSPORT" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/6
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>企业职位搜索</title>
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
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <!-- /js -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <!-- //js-->

    <!--seach box css-->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style_search.css">

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
                            <a href="stuIndex.jsp">主页</a>
                        </li>
                        <li class="active">企业职位搜索</li>
                    </ol>
                </div>
                <!--//sub-heard-part-->
                <div class="graph-visual tables-main">
                    <h3 class="inner-tittle two">企业信息</h3>

                    <!--search box-->
                    <div class="searchbox">
                        <div class="mod_select">
                            <div class="select_box">
                                <span class="select_txt">企业</span>
                                <span class="select-icon"></span>
                                <ul class="option">
                                    <li>企业</li>
                                    <li>职位</li>
                                    <li>技能</li>
                                    <li>薪资</li>
                                </ul>
                            </div>
                        </div>
                        <%
                            if (session.getAttribute("info").equals("nodata"))
                                session.setAttribute("info","");
                        %>
                        <form action="Stu_FindPositionServ?currentPage=0" method="post">
                            <input type="hidden" name="type" value="企业" id="select_value">
                            <input type="text" name="info" id="searchPlaceholder"  value="<%=session.getAttribute("info")%>" class="import" placeholder="请输入企业名称" style="background-color: transparent;color:grey">
                            <input type="submit" value="搜 索" class="btn-search">
                        </form>
                    </div>
                    <script src="js/jquery.min.js"></script>
                    <script>
                        $(function(){
                            $(".select_box").click(function(event){
                                event.stopPropagation();
                                $(this).find(".option").toggle();
                                $(this).parent().siblings().find(".option").hide();
                            });
                            $(document).click(function(event){
                                var eo=$(event.target);
                                if($(".select_box").is(":visible") && eo.attr("class")!="option" && !eo.parent(".option").length)
                                    $('.option').hide();
                            });
                            $(".option li").click(function(){
                                var check_value=$(this).text();
                                var value0 = $('.option li:eq(0)').html();
                                var value1 = $('.option li:eq(1)').html();
                                var value2 = $('.option li:eq(2)').html();
                                var value3 = $('.option li:eq(3)').html();
                                $(this).parent().siblings(".select_txt").text(check_value);
                                $("#select_value").val(check_value);
                                if(check_value == value0) {
                                    $('#searchPlaceholder').prop('placeholder','请输入企业名称');
                                }else if(check_value == value1) {
                                    $('#searchPlaceholder').prop('placeholder','请输入职位名称');
                                }else if(check_value == value2) {
                                    $('#searchPlaceholder').prop('placeholder','请输入技能要求');
                                }else if(check_value == value3) {
                                    $('#searchPlaceholder').prop('placeholder','请输入期望薪资');
                                }
                            });
                        })
                    </script>

                    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
                    </div>
                    <!--//search box-->


                    <div class="graph">
                        <div class="tables">

                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align: center;background:#f1fafb" colspan="1">#</th>
                                    <th style="text-align: center;background:#f1fafb" colspan="1">企业</th>
                                    <th style="text-align: center;background:#f1fafb" colspan="1">职位</th>
                                    <th style="text-align: center;background:#f1fafb" colspan="1">职位数量</th>
                                    <th style="text-align: center;background:#f1fafb" colspan="1">技能需求</th>
                                    <th style="text-align: center;background:#f1fafb" colspan="2">薪资水平</th>
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
                                    if(count%7==0){
                                        pageCount = count / 7;
                                    }
                                    else{
                                        pageCount = count / 7 + 1;
                                    }


                                    // 获取图书信息集合
                                    List<Position> list = (List<Position>) session.getAttribute("list");
                                    // 判断集合是否有效
                                    if (list == null || list.size() < 1) {
                                        out.print("没有数据");
                                    } else {
                                        // 遍历图书集合中的数据
                                        for (i = (currentPage - 1) * 7; i < currentPage * 7 && i < list.size(); i++) {
                                %>
                                <tr>
                                    <th scope="row" style="text-align: center;background:#f1fafb" colspan="1"><%=i+1%></th>
                                    <td style="text-align: center;"><%=list.get(i).getPoComname()%></td>
                                    <td style="text-align: center;"><%=list.get(i).getComposition()%></td>
                                    <td style="text-align: center;"><%=list.get(i).getComamount()%></td>
                                    <td style="text-align: center;"> <%=list.get(i).getComcondition()%></td>
                                    <td style="text-align: center;"><%=list.get(i).getComsalary()%></td>
                                </tr>

                                </tbody>
                                <%
                                        }
                                    }
                                %>
                            </table>
                            <div align="center">
                                <%if (list.size()!=0){
                                    System.out.println("list_size"+list.size());
                                    if (currentPage == 1) {
                                %>
                                <span class="unuse">[第一页]</span> <span class="unuse">[上一页]</span>
                                <%
                                } else {
                                %>
                                <span><a href="Stu_FindPositionServ?currentPage=1">[第一页]</a> </span> <span><a
                                    href="Stu_FindPositionServ?currentPage=<%=currentPage - 1%>">[上一页]</a> </span>
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
                                <span><a href="Stu_FindPositionServ?currentPage=<%=i%>"><%=i%></a>
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
                                        href="Stu_FindPositionServ?currentPage=<%=currentPage + 1%>">[下一页]</a> </span> <span><a
                                    href="Stu_FindPositionServ?currentPage=<%=pageCount%>">[最后一页]</a> </span>
                                <%
                                    }
                                %>
                                <form action="Stu_FindPositionServ" id="frm" style="display: inline;">
                                    <select name="currentPage">
                                        <%
                                            for (i = 1; i <= pageCount; i++) {
                                        %>
                                        <option value="<%=i%>" <%=(i == currentPage ? "selected" : "")%>>
                                            <%=i%>
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select> <input type="submit" name="jspGo" value="去" />
                                </form>
                                <%}%>
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
            <a href="stuIndex.jsp">
					<span id="logo">
						<h1>学生端</h1>
					</span>
                <!--<img id="logo" src="" alt="Logo"/>-->
            </a>
        </header>
        <div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
        <!--/down-->
        <div class="down">
            <a href="stuIndex.jsp">
                <span class=" name-caret"><%=session.getAttribute("NameInSession") %></span>
            </a>
            <p>Student</p>
            <ul>
                <li>
                    <a class="tooltips" href="stuIndex.jsp">
                        <span>Profile</span>
                        <i class="lnr lnr-user"></i>
                    </a>
                </li>
                <li>
                    <a class="tooltips" href="stuIndex.jsp">
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
                    <a href="stuIndex.jsp">
                        <i class="fa fa-tachometer"></i>
                        <span>主页</span>
                    </a>
                </li>
                <li id="menu-academico">
                    <a href="stu_studentsListServlet?sno=<%=session.getAttribute("Sno")%>&save=false">
                        <i class="fa fa-table"></i>
                        <span>学生基本信息</span>
                    </a>
                </li>

                <li id="menu-academico">
                    <a href="Stu_FindPositionServ?currentPage=0">
                        <i class="fa fa-table"></i>
                        <span>企业职位搜索</span>
                    </a>
                </li>

                <li>
                    <a href="separateServlet?currentPage=0">
                        <i class="lnr lnr-pencil"></i>
                        <span>求职意向投递</span>
                    </a>
                </li>
                
                <li>
                    <a href="stu_leave.jsp">
                        <i class="lnr lnr-pencil"></i>
                        <span>离校管理</span>
                    </a>
                </li>

                <li id="menu-comunicacao">
                    <a href="#">
                        <i class="fa fa-smile-o"></i>
                        <span>更多</span>
                        <span class="fa fa-angle-right" style="float: none"></span>
                    </a>
                    <ul id="menu-comunicacao-sub">
                        <li id="menu-mensagens" style="width:120px">
                            <a href="stu_contact.jsp">联系我们</a>
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