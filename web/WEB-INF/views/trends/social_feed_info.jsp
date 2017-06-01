<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 社交</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=path%>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path%>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="<%=path%>/css/animate.css" rel="stylesheet">
    <link href="<%=path%>/css/style.css?v=4.1.0" rel="stylesheet">
    <!-- 全局js -->
    <script src="<%=path%>/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=path%>/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="<%=path%>/js/content.js?v=1.0.0"></script>

    <!-- jQuery Validation plugin javascript-->
    <script src="<%=path%>/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=path%>/js/plugins/validate/messages_zh.min.js"></script>

    <!-- 配置文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>


    <!-- 自定义js -->
    <script src="<%=path%>/js/content.js?v=1.0.0"></script>

    <script src="<%=path%>/js/social_feed/social_feed.js"></script>
    <!--css让滚动条变成白色的style-->

    <link href="<%=path%>/css/scrollOver.css" rel="stylesheet">

</head>

<body class="gray-bg">
<c:if test="${sessionUserId != null}">
<div id="ctop" style="position:fixed;z-index:100;bottom:500px;width:100%;text-align:right;">
    <a href="javascript:void(0);" onclick="returnDown();">
        <button class="btn btn-info ">评论</button>
    </a>
</div>
</c:if>

<div style="position:fixed;z-index:100;bottom:550px;width:100%;text-align:right ;">
    <a href="javascript:void(0);" onclick="returnUrl();" >
        <button style="opacity:0.60;" class="btn btn-info ">返回</button>
    </a>
</div>


<div id="atop" style="position:fixed;z-index:100;bottom:400px;width:100%;text-align:right;display:none">
    <a href="javascript:void(0);" onclick="returnUP();">
        <button class="btn btn-info ">返回顶部</button>
    </a>
</div>
<!-- 动态 -->
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="social-feed-box">
                <div class="pull-right social-action dropdown">
                    <shiro:hasPermission name="matter:delete">
                        <c:choose>
                            <c:when test="${userId == sessionUserId}">
                                <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu m-t-xs">
                                    <li><a href="/matter/delMatter?id=${id}&jsp=trends/social_feed">删除</a></li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <shiro:hasAnyRoles name="admin, teacher, classTeacher">
                                    <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu m-t-xs">
                                        <li><a href="/matter/delMatter?id=${id}&jsp=trends/social_feed">删除</a></li>
                                    </ul>
                                </shiro:hasAnyRoles>
                            </c:otherwise>
                        </c:choose>
                    </shiro:hasPermission>
                </div>
                <div class="social-avatar">
                    <a href="/users/queryById/${requestScope.userId}" class="pull-left">
                        <img alt="image" src="<%=path%>/${requestScope.userHead}">
                    </a>
                    <div class="media-body">
                        <a href="/users/queryById/${userId}">
                            ${userName}
                        </a>
                        <small class="text-muted"><fmt:formatDate value="${createTime}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate></small>
                    </div>
                </div>
                <div class="social-body">
                    <h4 style="color: #5a0b30">楼主</h4>
                    <p>
                        <h2 style="margin-top:0;">${title}</h2>
                    </p>
                    ${des}

                </div>


            </div>

            <%--评论--%>

            <c:forEach items="${requestScope.comments}" varStatus="s" var="c">
                <div class="social-feed-box">
                    <div class="pull-right social-action dropdown">
                            <c:choose>
                                <c:when test="${userId == sessionUserId}">
                                    <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu m-t-xs">
                                        <li><a href="/matter/delComment?id=${c.id}&jsp=redirect:matterInFo&matterId1=${id}">删除</a></li>
                                    </ul>
                                </c:when>
                                <c:when test="${c.userId == sessionUserId}">
                                    <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu m-t-xs">
                                        <li><a href="/matter/delComment?id=${c.id}&jsp=redirect:matterInFo&matterId1=${id}">删除</a></li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <shiro:hasAnyRoles name="admin, teacher, classTeacher">
                                        <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                            <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu m-t-xs">
                                            <li><a href="/matter/delComment?id=${c.id}&jsp=redirect:matterInFo&matterId1=${id}">删除</a></li>
                                        </ul>
                                    </shiro:hasAnyRoles>
                                </c:otherwise>
                            </c:choose>
                    </div>
                    <div class="social-avatar">
                        <a href="/users/queryById/${c.userId}" class="pull-left">
                            <img alt="image" src="<%=path%>/${c.userHead}">
                        </a>
                        <div class="media-body">
                            <a href="/users/queryById/${c.userId}">
                                    ${c.userName}
                            </a>
                            <small class="text-muted"><fmt:formatDate value="${c.createTime}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate></small>
                        </div>
                    </div>
                    <div class="social-body">
                        <h4 style="color: #5a0b30">第${s.index + 1}楼</h4>
                        <p>
                                ${c.des}
                        </p>
                        <div class="btn-group">

                            <div class="btn-group">
                                <a><button class="btn btn-white btn-xs" onclick="comment('${c.id}',this)" ; value="y">展开回复</button></a>
                            </div>
                        </div>
                    </div>

                    <div id="f${c.id}" style="display:none">
                        <div id="a${c.id}" class="social-footer">

                        </div>


                    </div>

                </div>
            </c:forEach>


            <form id="ueditorFrom" style="display:none" action="<%=path%>/matter/addComment?id=${requestScope.id}&userId=${requestScope.userId}" method="post">
                <div style="text-align:left; width:100px; ">
                    <!-- 实例化编辑器 -->
                    <script id="container" name="content" type="text/plain"
                            style="height:10px;width:1000px;text-align:center">
                    </script>
                    <!-- 加载编辑器的容器 -->
                    <script type="text/javascript">
                        var ue = UE.getEditor('container', {
                            autoheight: false
                        });
                        ue.ready(function () {
                            ue.setHeight(200);
                        });
                    </script>
                        <div>
                                <input id="ueitorInput" type="button" onclick="ueditOnclick()"  value="评论" class="btn btn-info" />
                        </div>
                </div>

            </form>


        </div>

    </div>
</div>

</body>

</html>