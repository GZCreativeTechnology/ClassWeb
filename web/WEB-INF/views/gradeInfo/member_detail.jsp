<%--
  Created by IntelliJ IDEA.
  User: xiao-kang
  Date: 2017/2/16
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 成员详情</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="/favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">

    <style>

        td {
            text-align: center;
            width: 120px;
        }

        tr {
            height: 40px;
        }

        .lab label {
            width: 70px;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInRight">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>成员详情</h5>
                </div>
                <div>
                    <div class="ibox-content no-padding border-left-right" align="center">
                        <img alt="image" class="img-circle m-t-xs img-responsive" src="/${requestScope.user.head}"
                             style="height:130px;width:130px;">
                    </div>
                    <div class="ibox-content profile-content" >
                        <div align="center">
                        <h3><strong>${requestScope.user.userName}</strong></h3>
                        <p><i class="fa fa-map-marker"></i> ${requestScope.user.address}</p>
                        </div>
                        <table align="center">
                            <tr>
                                <td>
                                    <label>姓名:</label>

                                </td>
                                <td>
                                    ${requestScope.user.userName}
                                </td>
                                <td>
                                    <label>年龄:</label>

                                </td>
                                <td>
                                    ${requestScope.user.age}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>身份证:</label>

                                </td>
                                <td>
                                    ${requestScope.user.idCard}
                                </td>
                                <td>
                                    <label>性别:</label>

                                </td>
                                <td>
                                    ${requestScope.user.gender}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>手机号:</label>

                                </td>
                                <td>
                                    ${requestScope.user.phone}
                                </td>
                                <td>
                                    <label>QQ:</label>

                                </td>
                                <td>
                                    ${requestScope.user.qq}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>微信:</label>

                                </td>
                                <td>
                                    ${requestScope.user.weChat}
                                </td>
                                <td>
                                    <label>籍贯:</label>

                                </td>
                                <td>
                                    ${requestScope.user.nation}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>住址:</label>

                                </td>
                                <td>
                                    ${requestScope.user.address}
                                </td>
                                <td>
                                    <label>生日:</label>

                                </td>
                                <td>
                                    ${requestScope.user.birthday}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>家长号码:</label>

                                </td>
                                <td>
                                    ${requestScope.user.parentPhone}
                                </td>
                                <td>
                                    <label>家长名称:</label>

                                </td>
                                <td>
                                    ${requestScope.user.parentName}
                                </td>
                            </tr>
                        </table>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <h5>
                                    关于我 :
                                </h5>
                                <p>
                                    ${requestScope.user.des}
                                </p>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                        <div class="user-button">
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-3">
                                    <shiro:hasAnyRoles name="admin, teacher, classTeacher">
                                        <a href="#update-form" data-toggle="modal"
                                           class="btn btn-primary btn-sm btn-block">修改信息</a>
                                    </shiro:hasAnyRoles>
                                </div>
                                <div class="col-sm-6">
                                    <a href="JavaScript:history.go(-1)" class="btn btn-w-m btn-success"
                                       data-dismiss="modal">返回
                                    </a>
                                </div>
                            </div>
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
                    <div class="col-sm-12 b-r lab">
                        <h3 class="m-t-none m-b">修改信息</h3>
                        <form id = "defaultForm" role="form" class="form-horizontal" action="/users/update_member" method="post"
                              modelAttribute="user" enctype="multipart/form-data">
                            <input type="hidden" value="${requestScope.user.id }" name="id"/>
                            <input type="hidden" value="${requestScope.user.head }" name="head"/>
                            <input type="hidden" value="${requestScope.user.phone }" name="phone"/>
                            <div class="form-group">
                                <label>头像：</label>
                                <input class="form-control" type="file" name="file" style="height:40px;">

                            </div>
                            <div class="form-group">
                                <label>角色：</label>
                                <c:if test = "${requestScope.roleId == '4'}">
                                    <select  class="form-control" name="roleId" style = "height: 35px;">
                                        <option value="4">学生</option>
                                        <option value="1">班干部</option>
                                    </select>
                                </c:if>
                                <c:if test = "${requestScope.roleId == '1'}">
                                    <select  class="form-control" name="roleId" style = "height: 35px;">
                                        <option value="1">班干部</option>
                                        <option value="4">学生</option>
                                    </select>
                                </c:if>

                            </div>
                            <%--<div class="form-group">
                                <label>生日：</label>
                                <input class="form_datetime form-control" name = "birthday"  value="${requestScope.user.birthday} " type="text" onclick="getDate()" size="16">

                            </div>--%>
                            <div class="form-group">
                                <label>名称：</label>
                                <input  type="text" name="userName" value="${requestScope.user.userName} " class = "form-control"/>

                            </div>

                            <div class="form-group">
                                <label >微信：</label>
                                <input  id="wet" type="text" name="weChat"  value="${requestScope.user.weChat}" class = "form-control" maxlength="20"/>

                            </div>

                            <div class="form-group">
                                <label>身份证号：</label>
                                <input id="cardId" type="text"  value="${requestScope.user.idCard}"name="idCard" class = "form-control" diyCheck="请正确填写您的身份证！" diyRule="^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$"/>

                            </div>

                            <%--<div class="form-group">
                                <label>手机号码：</label>
                                <input id="phone"  type="text"  value="${requestScope.user.phone}" name="phone" class = "form-control" />

                            </div>--%>
                            <div class="form-group">
                                <label>状态：</label>
                                <c:if test = "${requestScope.user.status == '1'}">
                                    <select  class="form-control" name="status" style = "height: 35px;">
                                        <option value="1">激活</option>
                                        <option value="0">禁用</option>
                                    </select>
                                </c:if>
                                <c:if test = "${requestScope.roleId == '0'}">
                                    <select  class="form-control" name="status" style = "height: 35px;">
                                        <option value="0">禁用</option>
                                        <option value="1">激活</option>
                                    </select>
                                </c:if>

                            </div>

                            <div class="row">
                                <div class = "col-xs-6">
                                    <label>扣扣：</label>
                                    <input type="text" name="qq"  value="${requestScope.user.qq}"class="form-control">
                                </div>

                                <div class = "col-xs-6">
                                    <label>户口性质：</label>
                                    <c:if test="${requestScope.user.residence == '农村'}">
                                        <select name="residence" class="form-control" style="height:35px;">
                                            <option value="农村">农村</option>
                                            <option value="城市">城市</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${requestScope.user.residence == '城市'}">
                                        <select name="residence" class="form-control" style="height:35px;">
                                            <option value="城市">城市</option>
                                            <option value="农村">农村</option>
                                        </select>
                                    </c:if>
                                </div>
                            </div>
                            <p/>
                            <div class="row">
                                <div class = "col-xs-6">
                                    <label>籍贯：</label>
                                    <input type="text" name="nation"  value="${requestScope.user.nation}"class="form-control"/>
                                </div>

                                <div class = "col-xs-6">
                                    <label >家庭住址：</label>
                                    <input id="address" type="text" value="${requestScope.user.address}" name="address" class="form-control"/>
                                </div>
                            </div>

                            <p/>
                            <div class="row">
                                <div class = "col-xs-6">
                                    <label>性别：</label>
                                    <select name="gender" class="form-control" style="height:35px;">
                                        <c:if test="${requestScope.user.gender == '男'}">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </c:if>
                                        <c:if test="${requestScope.user.gender == '女'}">
                                            <option value="女">女</option>
                                            <option value="男">男</option>
                                        </c:if>
                                    </select>
                                </div>

                                <div class = "col-xs-6">
                                    <label>家长姓名：</label>
                                    <input type="text" name="parentName"  value="${requestScope.user.parentName}" class="form-control">
                                </div>
                            </div>

                            <p/>
                            <div class="form-group">
                                <label>描述：</label>
                                <textarea class="form-control"  rows="3" name="des" maxlength="250">${requestScope.user.des}</textarea>

                            </div>

                            <div class="modal-footer" style="overflow:hidden;">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <input type="submit"  class="btn btn-primary" value="修改"/>

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
<script src="/js/jquery.validate.js"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/bootstrap-datetimepicker.min.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>


<!-- Peity -->
<script src="/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/js/user/users.js"></script>

<script>
    $("#defaultForm").submit(function(){
        $(":submit",this).attr("disabled","disabled");
    });

    MyValidator.init();
</script>
</body>

</html>
