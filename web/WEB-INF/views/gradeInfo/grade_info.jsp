<%--
  Created by IntelliJ IDEA.
  User: xiao-kang
  Date: 2017/2/16
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>班级信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=kb2drrx8WGDVfXy9UVEGOaNhtkGLxVEV"></script>

</head>
<body class="gray-bg">
<div class="row">
    <div class="col-sm-9" style="width:100%">
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="m-b-md">
                                <shiro:hasAnyRoles name="admin, teacher, classTeacher">
                                    <a href="#update-form" data-toggle="modal"
                                       class="btn btn-white btn-xs pull-right">修改班级</a>
                                </shiro:hasAnyRoles>
                                <h2>15秋宏图预科班</h2>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <dl class="dl-horizontal">
                                <image src="/${requestScope.grade.logo}"
                                       style="width:90px;height:90px;margin-left:-155px;"></image>
                                <dt style="margin-top:35px;">名称 :</dt>
                                <label style="margin-left:75px;font-size:20px;">${requestScope.grade.name}</label>


                            </dl>
                        </div>
                        <div class="col-sm-7" id="cluster_info">
                            <dl class="dl-horizontal">

                                <dt>人数 :</dt>
                                <dd>${requestScope.grade.count}</dd>
                                <dt>班主任 :</dt>
                                <dd><a href="/users/queryById/${requestScope.user.id}">${requestScope.user.userName}</a>
                                </dd>
                                <dt>班级位置:</dt>
                                <dd><a href="javascript:;" onclick="showMap()"><i class="fa fa-map-marker"></i></a></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <dl class="dl-horizontal">
                                <dt>班级描述 :</dt>
                                <dd>${requestScope.grade.des}</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="row m-t-sm">
                        <div class="col-sm-12">
                            <div class="panel blank-panel">
                                <div class="panel-heading">
                                    <div class="panel-options">
                                        <ul class="nav nav-tabs">
                                            <li><a href="#tab-1" data-toggle="tab">班级留言</a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>

                                <div class="panel-body">

                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab-1">
                                            <div class="feed-activity-list">
                                                <c:forEach items="${requestScope.writtens}" var="written">
                                                    <div class="feed-element" style="margin-top:20px;">
                                                        <a href="/show/my_detail" class="pull-left">
                                                            <img alt="image" class="img-circle"
                                                                 src="/${written.user.head}">
                                                        </a>
                                                        <div class="media-body ">
                                                                ${written.des}
                                                            <br>
                                                            <small class="text-muted" style="color:#555">
                                                                <a href="/users/queryById/${written.user.id}"><strong>${written.user.userName}</strong></a>
                                                                <fmt:formatDate value="${written.createTime}"
                                                                                pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate>
                                                            </small>

                                                            <shiro:hasPermission name="written:delete">
                                                                <c:choose>
                                                                    <c:when test="${written.user.id == written.sessionId}">
                                                                        <a href="/grade/delete_written?id=${written.id}">
                                                                            <small class="pull-right"><i
                                                                                    class="fa fa-trash-o"></i>
                                                                            </small>
                                                                        </a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <shiro:hasAnyRoles name="admin, teacher, classTeacher">
                                                                            <a href="/grade/delete_written?id=${written.id}">
                                                                                <small class="pull-right"><i
                                                                                        class="fa fa-trash-o"></i>
                                                                                </small>
                                                                            </a>
                                                                        </shiro:hasAnyRoles>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                            </shiro:hasPermission>


                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6"></div>
                                                <div class="col-sm-6" style="text-align: right;">
                                                    <c:if test="${writtens.size() > 0}">
                                                        <div class="dataTables_paginate paging_simple_numbers"
                                                             id="editable_paginate">
                                                            <ul class="pagination">
                                                                <li class="paginate_button previous editable"
                                                                    aria-controls="editable" tabindex="0"
                                                                    id="editable_previous"><a
                                                                        href="/grade/grade_info?pageNo=${requestScope.pageNo-1}">上一页</a>
                                                                </li>

                                                                <li class="paginate_button next" aria-controls="editable"
                                                                    tabindex="0" id="editable_next"><a
                                                                        href="/grade/grade_info?pageNo=${requestScope.pageNo+1}">下一页</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <shiro:hasAnyRoles name="admin,teacher,student,classTeacher">
                                                <div class="social-comment">
                                                    <form id="addWitter" action="/grade/add_written" method="post">
                                                        <span class="pull-left">
                                                            <img alt="image" src="/${sessionScope.user.head}"
                                                                 class="img-circle"
                                                                 style="width:40px;height:40px;margin-right:10px;">
                                                        </span>
                                                        <div class="media-body" style="width:90%;text-align: left">

                                                            <textarea class="form-control" placeholder="填写留言"
                                                                      name="des"></textarea>
                                                        </div>
                                                        <div style="text-align: right">
                                                            <input type="submit" class="btn btn-primary btn-sm"
                                                                   value="发送">
                                                            </input>
                                                        </div>
                                                    </form>
                                                </div>
                                            </shiro:hasAnyRoles>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<%--地图弹窗--%>
<div id="mapWin" style="overflow:scroll" class="modal fade" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <span class="glyphicon glyphicon-remove closeModal" data-dismiss="modal" style="float: right; cursor: pointer;"></span>
                        <h3 class="m-t-none m-b">班级位置</h3>

                        <div style="width:730px;margin:auto;">
                            <div id="addMap" style="position:relative; width: 700px; height: 500px;">
                            </div>
                        </div>

                        <div class="modal-footer" style="overflow:hidden;">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 弹窗 -->
<div id="update-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">修改班级</h3>
                        <form id ="editGrade" role="form" id="updateForm" action="/grade/update" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" value="${requestScope.grade.id }" name="id"/>
                            <input type="hidden" value="${requestScope.grade.logo }" name="logo"/>
                            <div class="form-group">
                                <div>
                                    <img src="/${requestScope.grade.logo}" style="width:90px; height:90px;"/>
                                </div>

                                <label>班级logo ：</label>
                                <input class="form-control" value="${requestScope.grade.logo}" type="file" name="file">

                            </div>
                            <div class="form-group">
                                <label>班级名称：</label>
                                <input type="text" value="${requestScope.grade.name }" name="name"
                                       class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>人数：</label>
                                <input type="text" value="${requestScope.grade.count }" name="count"
                                       class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>班级描述：</label>
                                <textarea class="form-control" name="des" rows="3">${requestScope.grade.des}</textarea>
                            </div>

                            <div class="modal-footer" style="overflow:hidden;">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <input type="submit" class="btn btn-primary" value="修改">

                                </input>
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
    var map = new BMap.Map("addMap");
    var point = new BMap.Point(114.9481770000, 25.8050920000);
    map.centerAndZoom(point, 14);
    map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

    map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
    map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件
    map.addControl(new BMap.OverviewMapControl({isOpen: true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT}));   //右下角，打开
    var marker = new BMap.Marker(new BMap.Point(114.9481770000, 25.8050920000));
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    map.addOverlay(marker);

    var localSearch = new BMap.LocalSearch(map);
    localSearch.enableAutoViewport(); //允许自动调节窗体大小
    map.panBy(345,265);

    var stCtrl = new BMap.PanoramaControl(); //构造全景控件
    stCtrl.setOffset(new BMap.Size(20, 20));
    map.addControl(stCtrl);//添加全景控件

    $(document).ready(function () {

        $('#loading-example-btn').click(function () {
            btn = $(this);
            simpleLoad(btn, true)
            simpleLoad(btn, false)
        });
    });

    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass('fa-spin');
            btn.contents().last().replaceWith(" Loading");
        } else {
            setTimeout(function () {
                btn.children().removeClass('fa-spin');
                btn.contents().last().replaceWith(" Refresh");
            }, 2000);
        }
    }

    $("#editGrade").submit(function(){
        $(":submit",this).attr("disabled","disabled");
    });

    $("#addWitter").submit(function(){
        $(":submit",this).attr("disabled","disabled");
    });

    function showMap() {
        $("#mapWin").modal('show');
    }
</script>

</body>
</html>