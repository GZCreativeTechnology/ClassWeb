<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>15秋预科</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <link rel="shortcut icon" href="css/ico.ico">
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
    <script>
        $(function(){
            tishi();
        });
        function updataAll() {
            $.get("/message/updateAll",
                    function () {
                        tishi();
                        $("#J_iframe").attr("src", "/message/message_page");
                    });
        }

        function tishi(){
            $.get("/message/queryAllJS",
                    function (data) {
                        $("#messageDiv").html("");
                        $("#messageSize").html("");
                        if(data.length > 0){
                            $.each(data, function (index, item) {
                                    $("#messageSize").html(index + 1);
                                var date = new Date(item.createTime);
                                var fmtDate = date.pattern("yyyy/MM/dd hh:mm:ss");
                                    $("#messageDiv").html($("#messageDiv").html() +
                                            "<li><div class='dropdown-messages-box'>" +
                                            "<p class='pull-left'>" +
                                            "<img alt='image' class='img-circle' src="+item.foUserHead+">" +
                                            "</p><div class='media-body'>" +
                                            "<strong>"+item.foUserName+"</strong><br/>"+item.des+""+
                                            "<small class='pull-right text-navy' style='color:#676a6c'>" + fmtDate +"</small></div></div></li>" +
                                            "<li class='divider'></li>");
                            });
                        }
                    });
        }

        function no(){
            document.getElementById('messageAllDiv').style.display = 'none';
        }

        function show(){
            document.getElementById('messageAllDiv').style.display = 'block';
        }

        window.setInterval("tishi()",60000);

        Date.prototype.pattern=function(fmt) {
            var o = {
                "M+" : this.getMonth()+1, //月份
                "d+" : this.getDate(), //日
                "h+" : this.getHours()%24 == 0 ? 24 : this.getHours()%24, //小时
                "H+" : this.getHours(), //小时
                "m+" : this.getMinutes(), //分
                "s+" : this.getSeconds(), //秒
                "q+" : Math.floor((this.getMonth()+3)/3), //季度
                "S" : this.getMilliseconds() //毫秒
            };
            var week = {
                "0" : "/u65e5",
                "1" : "/u4e00",
                "2" : "/u4e8c",
                "3" : "/u4e09",
                "4" : "/u56db",
                "5" : "/u4e94",
                "6" : "/u516d"
            };
            if(/(y+)/.test(fmt)){
                fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            }
            if(/(E+)/.test(fmt)){
                fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);
            }
            for(var k in o){
                if(new RegExp("("+ k +")").test(fmt)){
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
                }
            }
            return fmt;
        }
    </script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <p data-toggle="dropdown" class="dropdown-toggle" style="color: #869fb1;">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold" >15秋预科</strong>
                                    </span>
                                </span>
                        </p>
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">15秋预科</span>
                </li>
                <li>
                    <a class="J_menuItem" href="/right/queryByIndex">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>

                <li class="line dk"></li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">社区管理</span>
                </li>
                <li>
                    <a href="#"><i class="fa fa-send-o"></i> <span class="nav-label">班级管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/grade/grade_info">班级信息</a>
                        </li>
                        <li><a class="J_menuItem" href="/users/grade_member">班级成员</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">班级社区</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/matter/queryByPage">班级动态</a></li>
                        <shiro:hasAnyRoles name="admin, classTeacher, teacher, student">
                             <li><a class="J_menuItem" href="/matter/MyMatter">个人动态</a></li>
                        </shiro:hasAnyRoles>
                    </ul>
                </li>
                <li>

                <li>
                    <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">班级足迹</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/photo/show_photo">班级相册</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="/video/pager?page=1&rows=10">班级视频</a>

                        </li>

                    </ul>
                </li>

                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">系统管理</span>
                </li>


                <li>
                    <a href="#"><i class="fa fa-table"></i> <span class="nav-label">班级公告</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/noticeInfo/queryByPage">所有公告</a></li>
                    </ul>
                </li>
                <shiro:hasAnyRoles name="admin, classTeacher, teacher, student">
                    <li class="line dk"></li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope">信息管理</span>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-odnoklassniki"></i> <span class="nav-label">个人信息</span><span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="/users/my_detail">我的信息</a>
                            </li>
                            <li><a class="J_menuItem" href="/users/pwd_pages">修改密码</a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasAnyRoles>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1" frameborder="0" scroll="no"
         style="overflow-x:hidden;overflow-y:hidden">

        <div class="row border-bottom">

            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
                <div class="dropdown" style="float:left;">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-info" href="#"><i class="fa fa-bars"></i> </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li style="padding-top:12px;">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <shiro:hasAnyRoles name="admin, student">
                                <span style="padding-right:20px;font-size:15px;">老同学, 欢迎回来:&nbsp;${sessionScope.user.userName }</span>
                            </shiro:hasAnyRoles>
                            <shiro:hasRole name="teacher">
                                <span style="padding-right:20px;font-size:15px;">大牛老师, 欢迎回来:&nbsp;${sessionScope.user.userName }</span>
                            </shiro:hasRole>
                            <shiro:hasRole name="classTeacher">
                                <span style="padding-right:20px;font-size:15px;">庆哥, 欢迎回来:&nbsp;${sessionScope.user.userName }</span>
                            </shiro:hasRole>
                                <button type="button" class="btn btn-default btn-xs"
                                        style="width:76px;height:30px;margin-right:20px;padding:0;">
                                    <a href="/users/logout">退出登录</a>
                                </button>

                        </c:when>
                        <c:otherwise>
                                <button type="button" class="btn btn-default btn-xs"
                                        style="width:70px;height:30px;margin-right:20px;;padding:0;">
                                    <a href="/users/login_page">
                                    登录</a>
                                </button>
                        </c:otherwise>
                    </c:choose>
                    </li>
                    <c:if test="${sessionScope.user != null}">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="javascript:;" onclick="show()">
                                <i class="fa fa-bell"></i> <span class="label label-primary" id="messageSize"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts" id="messageAllDiv" onmouseover="show();" onmouseleave="no();">
                                    <div id="messageDiv" style="max-height:500px;overflow:auto;"></div>
                                <li >
                                    <div class="text-center link-block">
                                        <a id="a" onclick="updataAll()" class="J_menuItem">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="/right/queryByIndex" frameborder="0"
                    data-id="/right/queryByIndex" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="js/index.js"></script>

<!-- 第三方插件 -->
<script src="js/plugins/pace/pace.min.js"></script>

</body>

</html>
