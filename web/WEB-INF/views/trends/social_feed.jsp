<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 举
  Date: 2017/2/22
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%String path = request.getContextPath();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 社交</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> <link href="<%=path%>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
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
    <script type="text/javascript" src="<%=path%>/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>/js/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>


    <!-- 自定义js -->
    <script src="<%=path%>/js/content.js?v=1.0.0"></script>

    <script src="<%=path%>/js/social_feed/social_feed.js"></script>


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
            <c:forEach items="${requestScope.matters}" var="m">
                <div class="social-feed-box">
                    <div class="pull-right social-action dropdown">
                        <shiro:hasPermission name="matter:delete">
                            <c:choose>
                                <c:when test="${m.userId == m.sessionId}">
                                    <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu m-t-xs">
                                        <li><a href="/matter/delMatter?id=${m.matterId}&jsp=redirect:queryByPage">删除</a></li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                <shiro:hasAnyRoles name="admin, teacher, classTeacher">
                                    <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu m-t-xs">
                                        <li><a href="/matter/delMatter?id=${m.matterId}&jsp=redirect:queryByPage">删除</a></li>
                                    </ul>
                                </shiro:hasAnyRoles>
                                </c:otherwise>
                            </c:choose>
                        </shiro:hasPermission>
                    </div>
                    <div class="social-avatar">
                        <a href="/users/queryById/${m.userId}" class="pull-left">
                            <img alt="image" src="<%=path%>/${m.userHead}">
                        </a>
                        <div class="media-body">
                            <a href="/users/queryById/${m.userId}">
                                    ${m.userName}
                            </a>
                            <small class="text-muted"><fmt:formatDate value="${m.createTime}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate></small>

                        </div>
                    </div>
                    <div class="social-body">
                        <p>
                                <a href="/matter/matterInFo?id=${m.matterId}"><h2 style="margin-top:0;">${m.title}</h2></a>
                        </p>
                            ${m.des}
                    </div>
                </div>
            </c:forEach>
            <c:if test="${matters.size() > 0}">
                <div class="col-sm-12" style="text-align: right;margin:0;">
                    <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
                        <ul class="pagination">
                            <li class="paginate_button previous editable" aria-controls="editable" tabindex="0" id="editable_previous"><a href="/matter/queryByPage?pageNoStr=${requestScope.matterPageNo - 1}">上一页</a></li>

                            <li class="paginate_button next" aria-controls="editable" tabindex="0" id="editable_next"><a href="/matter/queryByPage?pageNoStr=${requestScope.matterPageNo + 1}">下一页</a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
    </div>
</div>

</body>

</html>

