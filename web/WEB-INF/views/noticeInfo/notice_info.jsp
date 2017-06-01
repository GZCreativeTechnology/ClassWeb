<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>班级公告</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery.min.js"> </script>
    <script type="text/javascript" src="/js/notice.js"></script>
</head>

<body class="gray-bg" >
<!-- scroll="no" style="overflow-x:hidden;overflow-y:hidden" -->
<div class="row" style="overflow:hidden;">
    <div class="col-sm-12" style="overflow:hidden;">
        <div class="wrapper wrapper-content animated fadeInUp" style="overflow:hidden;padding:5px 20px -1000px 20px;">
            <ul class="notes">
                <c:forEach items="${noticeInfos}" var="n">
                <li>
                    <div style="overflow:hidden;">
                        <small style="margin-right:40px;margin-down:20px;"><fmt:formatDate value="${n.noticeDay}" pattern="yyyy/MM/dd  HH:mm:ss"></fmt:formatDate></small>
                        <h5 style="text-align:center;margin:8px 0px 0px 0px;">${n.userName}&nbsp;&nbsp;${n.noticeTypeName}</h5>
                        <h4 style="margin-top:0px">${n.name}</h4>
                        <p>${n.des}</p>
                        <shiro:hasAnyRoles name="admin, classTeacher, teacher">
                            <a data-toggle="modal" style="margin-right:20px" onclick="showEdit(${n.noticeId})"><i class="fa fa-pencil-square-o "></i></a>
                            <a data-toggle="modal" onclick="showDel(${n.noticeId})"><i class="fa fa-trash-o "></i></a>
                        </shiro:hasAnyRoles>
                    </div>
                </li>
                </c:forEach>
            <shiro:hasAnyRoles name="admin, classTeacher, teacher">
                <li><div class="fa-hover col-md-3 col-sm-4" style="overflow:hidden;">
                        <a data-toggle="modal" onclick="showAdd()" title="添加公告">
                            <img alt="image" src="/img/jiaHao.png" style="width:200px;height:185px;"/>
                        </a>
                </div></li>
            </shiro:hasAnyRoles>
        </div>
        <c:if test="${noticeInfos.size() > 0}">
            <div class="col-sm-12" style="text-align: right;margin:0;">
                <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
                    <ul class="pagination">
                        <li class="paginate_button previous editable" aria-controls="editable" tabindex="0" id="editable_previous"><a href="/noticeInfo/queryByPage?pageNoStr=${requestScope.noticeInfoPageNo - 1}">上一页</a></li>

                        <li class="paginate_button next" aria-controls="editable" tabindex="0" id="editable_next"><a href="/noticeInfo/queryByPage?pageNoStr=${requestScope.noticeInfoPageNo + 1}">下一页</a></li>
                    </ul>
                </div>
            </div>
        </c:if>
        <!-- 添加公告弹窗 -->
        <div class="modal fade" id="addNotice" aria-hidden="true" style="overflow:hidden;">
            <div class="modal-dialog" style="overflow:hidden;">
                <div class="modal-content" style="overflow:hidden;">
                    <div class="modal-header" style="overflow:hidden;">
                        <input  type="text" id="addNoticeName" placeholder="请输入公告标题" style="width:300px;margin-left:70px;" maxlength="15" name="top-search"/>
                        <select id="addNoticeType" style="margin-left:20px;height:20px;width:100px;" >
                            <c:forEach items="${noticeTypes}" var="nt">
                                <option value="${nt.id}">${nt.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="modal-body" style="overflow:hidden;">
                        <textarea id="addNoticeDes" placeholder="请输入公告描述"  style="width:530px;height:100px;" maxlength="142"></textarea>
                    </div>
                    <div id="addDiv" class="modal-footer" style="overflow:hidden;">
                        <span id="error" style="color: red;"></span>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button id="addButton" type="button" class="btn btn-primary" onclick="addNotice();">
                            新建
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- 修改公告弹窗 -->
        <div class="modal fade" id="editNotice" aria-hidden="true" style="overflow:hidden;">
            <div class="modal-dialog" style="overflow:hidden;">
                <div class="modal-content" style="overflow:hidden;">
                    <input type="hidden" id="noticeId"/>
                    <div class="modal-header" style="overflow:hidden;">
                        <input type="text" id="noticeName" placeholder="请输入公告标题" style="width:300px;margin-left:70px;" maxlength="15" name="top-search"/>
                        <select id="editNoticeType" style="margin-left:20px;height:20px;width:100px;" >
                            <c:forEach items="${noticeTypes}" var="nt">
                                <option value="${nt.id}">${nt.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="modal-body" style="overflow:hidden;">
                        <textarea id="noticeDes" placeholder="请输入公告描述"  style="width:530px;height:100px;" maxlength="142"></textarea>
                    </div>
                    <div class="modal-footer" style="overflow:hidden;">
                        <span id="editError" style="color: red;"></span>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button id="editButton" type="button" class="btn btn-primary" onclick="updateNotice();">
                            保存
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <!-- 删除公告弹窗 -->
        <div class="modal fade" id="delNotice" aria-hidden="true" style="overflow:hidden;">
            <div class="modal-dialog" style="overflow:hidden;">
                <div class="modal-content" style="overflow:hidden;">
                    <input type="hidden" id="delNoticeId"/>
                    <div class="modal-footer" style="text-align: center;overflow:hidden;">
                        <h2>确认删除吗?</h2>
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="del()">
                            确认
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div>
</div>

<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>

</body>

</html>
