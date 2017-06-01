<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 回复消息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="<%=path%>/js/social_feed/social_feed.js"></script>

    <script>
        function replyMessage(id, btn) {
            var currentBtn = document.getElementById(id);
            if (btn.value == "y") {
                currentBtn.style.display = "block"; //style中的display属性
                btn.innerHTML = "收起回复";
                btn.value = "n";
            } else if (btn.value == "n") {
                currentBtn.style.display = "none"; //style中的display属性
                btn.innerHTML = "回复";
                btn.value = "y";
            }
        }
    </script>
</head>
<body class="gray-bg">
<c:forEach items="${messagesAll}" var="m">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="social-feed-box">
                    <div class="social-avatar">
                        <a href="/users/queryById/${m.foUser}" class="pull-left">
                           <!-- <img alt="image" src="${m.foUserHead}">-->
                            <img alt='image' class='img-circle' src="/${m.foUserHead}">
                        </a>
                        <div class="media-body">
                            <a href="/users/queryById/${m.foUser}">
                                ${m.foUserName}
                            </a>
                            <small class="text-muted"><fmt:formatDate value="${m.createTime}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate></small>
                        </div>
                    </div>
                    <div class="social-body">
                            ${m.des}
                        <div class="media-body">
                                <a href="/matter/matterInFo?id=${m.matterId}"><h2 style="margin-top:0;">${m.matterTitle}</h2></a>
                            <p>
                               ${m.matterDes}
                            </p>
                        </div>
                    </div>


                </div>
            </div>


        </div>
    </div>
</c:forEach>

</body>

</html>
