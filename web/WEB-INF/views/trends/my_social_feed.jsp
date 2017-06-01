<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 举
  Date: 2017/2/22
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>

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


    <link href="<%=path%>/css/scrollOver.css" rel="stylesheet">

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


    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>


    <!-- 自定义js -->
    <script src="<%=path%>/js/content.js?v=1.0.0"></script>

    <script src="<%=path%>/js/social_feed/social_feed.js"></script>
    <script>

    </script>

</head>

<body onload="" class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <a data-toggle="modal" href="#myModal" title="添加动态">
                <button class="btn btn-success  dim" type="button">发布动态
                </button>
            </a>
            <c:forEach items="${requestScope.matters}" var="m">
                <div class="social-feed-box">

                    <div class="pull-right social-action dropdown">
                        <button data-toggle="dropdown" class="dropdown-toggle btn-white">
                            <i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu m-t-xs">
                            <li><a href="/matter/delMatter?jsp=redirect:MyMatter&id=${m.matterId}">删除</a></li>
                        </ul>
                    </div>
                    <div class="social-avatar">
                        <a href="/users/queryById/${m.userId}" class="pull-left">
                            <img alt="image" src="/${requestScope.head}">
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
                            <li class="paginate_button previous editable" aria-controls="editable" tabindex="0" id="editable_previous"><a href="/matter/MyMatter?pageNoStr=${myMatterPageNo - 1}">上一页</a></li>

                            <li class="paginate_button next" aria-controls="editable" tabindex="0" id="editable_next"><a href="/matter/MyMatter?pageNoStr=${myMatterPageNo + 1}">下一页</a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>

    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hien="true">
    <div class="modal-dialog">
        <form id="addMatter" action="<%=path %>/matter/addMatter" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="form-group">
                        <label>动态：</label>
                        <div>
                            <input id="cname" name="title" minlength="2" type="text" class="form-control" required=""
                                   aria-required="true">
                        </div>
                    </div>
                </div>
                <div style="text-align:left">
                    <!-- 实例化编辑器 -->
                    <script id="container" name="content" type="text/plain"
                            style="height:50px;width:589px;text-align:center">
                    </script>
                    <!-- 加载编辑器的容器 -->
                    <script type="text/javascript">
                        var ue = UE.getEditor('container', {
                            autoheight: false
                        });
                        ue.ready(function () {
                            ue.setHeight(300);
                        });
                    </script>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <input type="submit" value="发布" class="btn btn-primary">
                    </input>
                </div>

            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->

</div><!-- /.modal -->

<div class="modal fade" id="myReply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hien="true">
    <div class="modal-dialog">
        <form  action="<%=path %>/ueditor/a" method="post">
            <div class="modal-content">
                <div>
                    <div class="col-sm-11 col-md-12 col-lg-11">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div>
                                    <div class="chat-activity-list">
                                        <div class="chat-element">
                                            <a href="widgets.html#" class="pull-left">
                                                <img alt="image" class="img-circle" src="<%=path%>/img/a2.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right text-navy">1分钟前</small>
                                                <strong>奔波儿灞</strong>
                                                <p class="m-b-xs">
                                                    跑步呐，最重要的是要有动力
                                                </p>
                                                <small class="text-muted">今天 09:02</small>
                                            </div>
                                        </div>

                                        <div class="chat-element right">
                                            <a href="widgets.html#" class="pull-right">
                                                <img alt="image" class="img-circle" src="<%=path%>/img/a4.jpg">
                                            </a>
                                            <div class="media-body text-right ">
                                                <small class="pull-left">5分钟前</small>
                                                <strong>灞波儿奔 </strong>
                                                <p class="m-b-xs">
                                                    V信已经提前恢复，也算是个好消息吧
                                                </p>
                                                <small class="text-muted">11月7日 21:38</small>
                                            </div>
                                        </div>

                                        <div class="chat-element ">
                                            <a href="widgets.html#" class="pull-left">
                                                <img alt="image" class="img-circle" src="<%=path%>/img/a2.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right">2小时前</small>
                                                <strong>奔波儿灞</strong>
                                                <p class="m-b-xs">
                                                    是你对不对
                                                </p>
                                                <small class="text-muted">11月8日 14:27</small>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="chat-form">
                                    <form role="form">
                                        <div class="form-group">
                                            <textarea class="form-control" placeholder="消息内容…"></textarea>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">关闭
                                            </button>
                                            <input type="submit" value="发送" class="btn btn-primary">
                                            </input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>


            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal-dialog -->

</div><!-- /.modal -->

</body>

</html>

