<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/19
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 班级相册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">

    <style>
        #container {
            position: relative;
            height: 800px;
        }

        .clear {
            clear: both;
        }

        .box {
            padding: 5px;
            float: left;
        }

        .box_img {
            padding: 5px;
            border: 1px solid #cccccc;
            box-shadow: 0 0 5px #ccc;
            border-radius: 5px;
            text-align: center;
        }

        .box_img img {
            width: 150px;
            height: auto;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12 animated fadeInRight">
            <div>
                <div class="ibox-title" style="height: 50px;">
                    <h5>班级相册
                        <small>纪念美好的瞬间</small>
                    </h5>
                    <shiro:hasAnyRoles name="admin, classTeacher, teacher">
                        <div class="ibox-tools">
                            <a data-toggle="modal" href="#upload" title="上传图片">
                                <button class="btn btn-success " type="button">
                                    <i class="fa fa-upload"></i>&nbsp;&nbsp;
                                    <span class="bold">上传图片</span>
                                </button>
                            </a>
                        </div>

                    </shiro:hasAnyRoles>
                </div>
                <div id="container">
                    <c:forEach items="${requestScope.photoList}" var="photo">
                        <div class="box">
                            <div class="box_img">
                                <a href="/photo/id?id=${photo.id}" title="${photo.name}">
                                    <img alt="${photo.des}" src="/${photo.image}"/>
                                </a>
                            </div>
                        </div>
                    </c:forEach>


                    <p class="clear"></p>
                </div>


            </div>
        </div>
    </div>
</div>

<!-- 弹窗 -->
<div id="upload" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">上传图片</h3>
                        <form id="addphoto" action="/photo/upload" onsubmit="return checkUpload()" method="post"
                              enctype="multipart/form-data">
                            <div class="form-group">
                                <label>图片名称 ：</label>
                                <input id="name" class="form-control" type="text" onchange="clearError()" name="name">
                            </div>
                            <div class="form-group">
                                <label>描述：</label>
                                <textarea id="des" class="form-control" name="des" onchange="clearError()"
                                          rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label>图片：</label>
                                <input id="file" type="file" name="file" style="height:40px;"
                                       class="form-control"
                                       accept="image/gif, image/jpeg, image/jpg, image/png, image/bmp"/>
                            </div>

                            <div class="modal-footer" style="overflow:hidden;">
                                <span id="error" style="color: red;"></span>
                                <br/>
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <button id="addButton" type="submit" class="btn btn-primary">
                                    上传
                                </button>
                            </div>
                        </form>
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
<script src="/js/app.js"></script>
<script>
    function checkUpload() {
        $("#addButton").attr('disabled','disabled');
        var name = $("#name").val();
        var des = $("#des").val();
        var file = $("#file").val();
        var error = document.getElementById("error");
        if (name != "" && des != "" && file != "") {
            return true;
        }
        error.innerHTML = "请输入正确的数据";
        $("#addButton").removeAttr("disabled");
        return false;
    }

    function clearError() {
        var error = document.getElementById("error");
        error.innerHTML = "";
    }
</script>


</body>

</html>

