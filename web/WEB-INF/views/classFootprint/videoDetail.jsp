<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/24
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title> - 视频播放</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="/css/plugins/plyr/plyr.css">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">

        <div class="ibox-title col-md-12" style="height: 50px;">
            <h5>
                ${requestScope.video.name} &nbsp;&nbsp;|&nbsp;&nbsp;
                <small>${requestScope.video.des}</small>
            </h5>
            <shiro:hasAnyRoles name="admin, classTeacher, teacher">
                <div class="ibox-tools">
                    <a data-toggle="modal" href="#edit" title="编辑视频">
                        <button class="btn btn-info" type="button">
                            <i class="fa fa-edit"></i>
                            <span class="bold">编辑视频</span>
                        </button>
                    </a>
                    <a data-toggle="modal" href="#delete" title="删除视频">
                        <button class="btn btn-danger" type="button">
                            <i class="fa fa-close"></i>
                            <span class="bold">删除视频</span>
                        </button>
                    </a>

                </div>
            </shiro:hasAnyRoles>

        </div>
        <div style="text-align: center;">
            更新时间：
            <fmt:formatDate value="${requestScope.video.createTime}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="player">
                    <video src="/${requestScope.video.url}" controls="controls">
                    </video>
                </div>
            </div>
        </div>

        <div class="col-sm-12" style="text-align: right; padding-right: 50px;">
            <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
                <ul class="pagination">
                    <li class="paginate_button previous editable" aria-controls="editable" tabindex="0"
                        id="editable_previous"><a href="/video/pager?page=1&rows=10">返回</a></li>

                </ul>
            </div>
        </div>

    </div>
</div>

<!-- 弹窗-编辑视频 -->
<div id="edit" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">编辑视频</h3>
                        <form id="editVideo" action="/video/edit" onsubmit="return checkUpload()" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${requestScope.video.id}"/>
                            <input type="hidden" name="url" value="${requestScope.video.url}"/>
                            <input type="hidden" name="status" value="${requestScope.video.status}"/>
                            <div class="form-group">
                                <label>视频名称 ：</label>
                                <input id="name" class="form-control" value="${requestScope.video.name}" type="text" name="name">
                            </div>
                            <div class="form-group">
                                <label>描述：</label>
                                <textarea id="des" class="form-control" name="des" rows="3">${requestScope.video.des}</textarea>
                            </div>
                            <div class="form-group" style="display: none">
                                <label>视频：</label>
                                <input type="file" name="file" value="${requestScope.video.url}" class="form-control"
                                       accept="image/gif, image/jpeg, image/jpg, image/png, image/bmp"/>
                            </div>
                            <div class="form-group">
                                <label>更新时间：</label>
                                <p class="form-control-static">
                                    <fmt:formatDate value="${requestScope.video.createTime }"
                                                    pattern="yyyy/MM/dd HH:mm:ss"></fmt:formatDate>
                                </p>
                            </div>

                            <div class="modal-footer" style="overflow:hidden;">
                                <span id="error" style="color: red;"></span>
                                <br/>
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <input id="addButton" type="submit" class="btn btn-primary" value="更新">

                                </input>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 弹窗-删除视频 -->
<div id="delete" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">确定删除视频？</h3>
                        <div class="modal-footer" style="overflow:hidden;">
                            <a href="/video/del?id=${requestScope.video.id}">
                                <button type="button" class="btn btn-default">确定
                                </button>
                            </a>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">取消
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    (function (d, u) {
        var a = new XMLHttpRequest(),
                b = d.body;

        // Check for CORS support
        // If you're loading from same domain, you can remove the if statement
        if ("withCredentials" in a) {
            a.open("GET", u, true);
            a.send();
            a.onload = function () {
                var c = d.createElement("div");
                c.setAttribute("hidden", "");
                c.innerHTML = a.responseText;
                b.insertBefore(c, b.childNodes[0]);
            }
        }
    })(document, "/css/plugins/plyr/sprite.svg");
</script>

<!-- Plyr core script -->
<script src="/js/plugins/plyr/plyr.js"></script>
<script>
    plyr.setup();
</script>

<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>
<script>
    function checkUpload() {
        $("#addButton").attr('disabled','disabled');
        var name = $("#name").val();
        var des = $("#des").val();
        var error = document.getElementById("error");
        if (name != "" && des != "") {
                return true;
        }
        error.innerHTML = "请输入正确的数据";
        $("#addButton").removeAttr("disabled");
        return false;
    }
</script>

</body>

</html>
