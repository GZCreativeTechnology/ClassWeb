<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/19
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 相册详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title" style="height: 50px;">
                    <h5>
                        ${requestScope.photo.name} &nbsp;&nbsp;|&nbsp;&nbsp;
                        <small>${requestScope.photo.des}</small>
                    </h5>
                    <shiro:hasAnyRoles name="admin, classTeacher, teacher">
                        <div class="ibox-tools">
                            <a data-toggle="modal" href="#edit" title="编辑图片">
                                <button class="btn btn-info" type="button">
                                    <i class="fa fa-edit"></i>
                                    <span class="bold">编辑图片</span>
                                </button>
                            </a>
                            <a data-toggle="modal" href="#delete" title="删除图片">
                                <button class="btn btn-danger" type="button">
                                    <i class="fa fa-close"></i>
                                    <span class="bold">删除图片</span>
                                </button>
                            </a>

                        </div>
                    </shiro:hasAnyRoles>

                </div>
                <div style="text-align: center;">
                    更新时间：
                    <fmt:formatDate value="${requestScope.photo.createTime}"
                                    pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate>
                </div>
                <div class="ibox-content" style="text-align: center;">

                    <img src="/${requestScope.photo.image}" alt="${requestScope.photo.des}" style="max-width: 80%"/>
                </div>


                <div class="row">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6" style="text-align: right; padding-right: 50px;">
                        <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
                            <ul class="pagination">
                                <li class="paginate_button previous editable" aria-controls="editable" tabindex="0"
                                    id="editable_previous"><a href="/photo/show_photo">返回</a></li>

                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>


</div>

<!-- 弹窗-编辑图片 -->
<div id="edit" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">编辑图片</h3>
                        <form action="/photo/edit" id="editPhoto" method="post" onsubmit="return checkUpload()" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${requestScope.photo.id}"/>
                            <input type="hidden" name="image" value="${requestScope.photo.image}"/>
                            <input type="hidden" name="status" value="${requestScope.photo.status}"/>
                            <div class="form-group">
                                <img src="/${requestScope.photo.image}" style="width:20%;"/>
                            </div>
                            <div class="form-group">
                                <label>图片名称 ：</label>
                                <input id="name" class="form-control" value="${requestScope.photo.name}" type="text" name="name">
                            </div>
                            <div class="form-group">
                                <label>描述：</label>
                                <textarea id="des" class="form-control" name="des" rows="3">${requestScope.photo.des}</textarea>
                            </div>
                            <div class="form-group" style="display: none">
                                <label>图片：</label>
                                <input type="file" id="file" name="file" style="height:40px;" value="${requestScope.photo.image}" class="form-control"
                                       accept="image/gif, image/jpeg, image/jpg, image/png, image/bmp"/>
                            </div>
                            <div class="form-group">
                                <label>更新时间：</label>
                                <p class="form-control-static">
                                    <fmt:formatDate value="${requestScope.photo.createTime }"
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

<!-- 弹窗-删除图片 -->
<div id="delete" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">确定删除图片？</h3>
                        <div style="padding: 20px; text-align: center;">
                            <img src="/${requestScope.photo.image}" style="width:50%;"/>
                        </div>
                        <div class="modal-footer" style="overflow:hidden;">
                            <a href="/photo/del?id=${requestScope.photo.id}">
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
