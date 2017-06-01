<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/19
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> -班级视频</title>
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
        <div class="col-sm-12 animated fadeInRight">
            <div>
                <div class="ibox-title" style="height: 50px;">
                    <h5>班级视频
                        <small>纪念美好的瞬间</small>
                    </h5>
                    <shiro:hasAnyRoles name="admin, classTeacher, teacher">
                        <div class="ibox-tools">
                            <a data-toggle="modal" href="#upload" title="上传视频">
                                <button class="btn btn-success " type="button">
                                    <i class="fa fa-upload"></i>&nbsp;&nbsp;
                                    <span class="bold">上传视频</span>
                                </button>
                            </a>
                        </div>
                    </shiro:hasAnyRoles>

                </div>
                <div id="container">
                    <c:forEach items="${requestScope.videos.rows}" var="video">
                        <div class="file-box col-md-3">
                            <div class="file">
                                <a href="/video/id?id=${video.id}">
                                    <span class="corner"></span>

                                    <div class="icon">
                                        <i class="fa fa-file"></i>
                                    </div>
                                    <div class="file-name" style="text-align: center;">
                                            ${video.name}
                                        <br/>
                                        <small>
                                            <fmt:formatDate value="${video.createTime }"
                                                            pattern="yyyy/MM/dd HH:mm:ss"></fmt:formatDate>
                                        </small>
                                    </div>
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

<c:if test="${requestScope.videos.rows.size() > 0}">
    <div class="row">
        <div class="col-sm-6"></div>
        <div class="col-sm-5" style="text-align: right;">
            <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
                <ul class="pagination">
                    <li class="paginate_button previous editable" aria-controls="editable" tabindex="0"
                        id="editable_previous"><a href="javascript:;" onclick="previous('${requestScope.videos.pageNo}')">上一页</a>
                    </li>

                    <li class="paginate_button next" aria-controls="editable" tabindex="0" id="editable_next"><a
                            href="javascript:;"
                            onclick="next('${requestScope.videos.pageNo}','${requestScope.videos.total}')">下一页</a></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-1"></div>
    </div>
</c:if>


</div>

<!-- 弹窗 -->
<div id="upload" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">上传视频</h3>
                        <form action="/video/add" onsubmit="return checkUpload()" method="post"
                              enctype="multipart/form-data">
                            <div class="form-group">
                                <label>视频名称 ：</label>
                                <input id="name" class="form-control" onchange="clearError()" type="text" name="name">
                            </div>
                            <div class="form-group">
                                <label>描述：</label>
                                <textarea id="des" class="form-control" onchange="clearError()" name="des"
                                          rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label>视频：</label>
                                <input id="file" type="file" name="file"
                                       class="form-control" accept="video/avi, video/mp4, audio/mkv"/>
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
<script>
    function previous(pageNo) {
        var pageNo1 = parseInt(pageNo) - 1;
        window.location.href = "/video/pager?page=" + pageNo1 + "&rows=10";
    }

    function next(pageNo, total) {
        var pageNo1 = parseInt(pageNo) + 1;
        var maxPage = Math.ceil(parseInt(total) / 10);
        if (pageNo1 > maxPage) {
            pageNo1 = maxPage;
        }
        window.location.href = "/video/pager?page=" + pageNo1 + "&rows=10";
    }

    function checkUpload() {
        $("#addButton").attr('disabled','disabled');
        var name = $("#name").val();
        var des = $("#des").val();
        var file = $("#file").val();
        var error = document.getElementById("error");
        if (name != "" && des != "" && file != "") {
            var fileTypes = new Array("mp4","avi","mkv");  //定义可支持的文件类型数组
            var fileTypeFlag = "0";
            var newFileName = file.split('.');
            newFileName = newFileName[newFileName.length-1];
            for(var i=0;i<fileTypes.length;i++){
                if(fileTypes[i] == newFileName){
                    fileTypeFlag = "1";
                }
            }
            var dom = document.getElementById("file");
            var fileSize =  dom.files[0].size;//文件的大小，单位为字节B
            if(fileSize >= 2147483648){// 假如上传的文件大于2GB
                fileTypeFlag = "2";
            }
            if(fileTypeFlag == "0"){
                error.innerHTML = "上传的视频格式只能是mp4/avi/mkv";
                $("#addButton").removeAttr("disabled");
                return false;
            } else if (fileTypeFlag == "2"){
                error.innerHTML = "上传的视频文件大小不能超过2GB";
                $("#addButton").removeAttr("disabled");
                return false;
            }else {
                return true;
            }
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

