<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title> - 主页示例</title>

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <script>

    </script>
</head>

<body>
<div class="wrapper wrapper-content animated fadeInUp">
    <div class="row">
        <div class="col-sm-12">
            <image src="/img/bizhi.jpg" style="width:100%;height:420px;"></image>
        </div>
    </div>
    <hr style="margin-top:10px;height:1px;width:100%;background: #999;"/>

    <div class="row">
        <div class="top" style="padding-left: 20px; padding-right: 50px; padding-down:50px;">
            <span style="font-size:16px;">班级信息</span>
            <span style="float:right;font-size:16px;"><a href="/grade/grade_info">更多</a></span>
            <p class="clear"></p>
        </div>
        <div class="col-sm-6" style="padding-left:40px;">
            <div>
                <a href="/grade/grade_info"><image src="/${grade.logo}" style="width:50px;height:50px; float:left; margin-right:10px;"></image></a>
                <dl>
                    <dt>名称：<a href="/grade/grade_info">${grade.name}</a></dt>
                    <dt>人数：<a href="/users/grade_member">${grade.count}</a></dt>
                    <dt>班主任：<a href="/users/queryById/${requestScope.user.id}">${requestScope.user.userName}</a></dt>

                </dl>
                <p class="clear"></p>
            </div>
        </div>
        <%--<div class="col-sm-6">--%>
            <%--<div class="col-sm-6">--%>
                <%--<dl>--%>
                    <%--<dt>学习进度：ssm</dt>--%>
                    <%--<dt>班级成立：2016/10/05</dt>--%>
                <%--</dl>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <hr style="margin-top:10px;height:1px;width:100%;background: #999;"/>

    <div class="row" >

        <div class="top" style="padding-left: 20px; padding-right: 50px; padding-down:50px;">
            <span style="font-size:16px;">最新公告</span>
            <span style="float:right;font-size:16px;"><a href="/noticeInfo/queryByPage">更多</a></span>
            <p class="clear"></p>
        </div>
        <c:if test="${noticeInfo.size() <= 0}">
            <div class="top" style="padding-left: 16px; padding-right: 16px; padding-down:50px;">
                <span style="padding-left:4px">暂无最新公告</span><hr style="height:1px;width:100%;background: #999;"/>
            </div>
        </c:if>
        <c:if test="${noticeInfo.size() > 0}">
            <c:forEach items="${noticeInfo}" var="n" varStatus="status">
                <div class="row"  style="width:100%;">
                    <div class="small m-b-xs" style="padding-left:50px;">
                        <a href="/users/queryById/${n.userId}" class="pull-left">
                            <img alt="image" style="width:40px;height:40px" src="/${n.userHead}">
                        </a>
                        <div style="padding-left:50px;">
                            <a href="/users/queryById/${n.userId}"><span style="font-size:15px;">${n.userName}</span></a><br/>
                            <i class="fa fa-clock-o"></i><fmt:formatDate value="${n.noticeDay}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate>
                        </div>
                        <a href="/noticeInfo/queryByPage"><h2>${n.name}</h2></a>
                        <p>${n.des}</p>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${status.index +1 == noticeInfo.size()}">
                        <hr style="margin-top:10px;height:1px;width:98%;background: #999;"/>
                    </c:when>
                    <c:otherwise>
                        <hr style="margin-top:10px;height:1px;width:98%;background: #eee;"/>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>
    </div>


    <div class="row">
        <div class="top" style="padding-left: 20px; padding-right: 50px; padding-down:50px;">
            <span style="font-size:16px;">最新动态</span>
            <span style="float:right;font-size:16px;"><a href="/matter/queryByPage">更多</a></span>
            <p class="clear"></p>
        </div>
        <c:if test="${matters.size() <= 0}">
        <div class="top" style="padding-left: 16px; padding-right: 16px; padding-down:50px;">
            <span style="padding-left:4px">暂无最新动态</span>
            </div>
        </c:if>
        <c:if test="${matters.size() > 0}">
            <c:forEach items="${matters}" var="m" varStatus="status">
                <div class="row" style="width:100%;">
                    <div class="small m-b-xs" style="padding-left:50px;">
                            <a href="/users/queryById/${m.userId}" class="pull-left">
                                <img alt="image" style="width:40px;height:40px" src="/${m.userHead}">
                            </a>
                            <div style="padding-left:50px;">
                                <a href="/users/queryById/${m.userId}">
                                            <span style="font-size:15px;">${m.userName}</span>
                                </a><br />
                                <i class="fa fa-clock-o"></i><fmt:formatDate value="${m.createTime}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate>
                            </div>
                                <a href="/matter/matterInFo?id=${m.matterId}">
                                    <h2>${m.title}</h2></a>
                                <p>${m.des}</p>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${status.index + 1 == matters.size()}">
                    </c:when>
                    <c:otherwise>
                        <hr style="margin-top:10px;height:1px;width:98%;background: #eee;"/>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </c:if>
    </div>
</div>
<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/plugins/layer/layer.min.js"></script>
<!-- Flot -->
<script src="/js/plugins/flot/jquery.flot.js"></script>
<script src="/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="/js/plugins/flot/jquery.flot.pie.js"></script>
<!-- 自定义js -->
<script src="/js/content.js"></script>
<!--flotdemo-->
<script type="text/javascript">

</script>
</body>

</html>
