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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>班级成员</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="/favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <c:forEach items="${requestScope.users}" var="user">
            <div class="col-sm-4" >

                <div class="contact-box">
                    <a href="/users/queryById/${user.id}">
                        <div class="col-sm-4">
                            <div class="text-center">

                                <img alt="image" class="img-circle m-t-xs img-responsive" style="height:70px;width: 125px;" src="/${user.head}">

                                <div class="m-t-xs font-bold">${user.gender}</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <h3><strong>${user.userName}</strong></h3>
                            <p><i class="fa fa-map-marker"></i> ${user.address}</p>
                            <address>
                                <strong>QQ:${user.qq}</strong><br>
                                年龄:${user.age}<br>
                                生日:${user.birthday}<br/>
                                手机:${user.phone}
                            </address>

                        </div>
                        <div class="clearfix"></div>
                    </a>
                </div>


            </div>
        </c:forEach>
        <shiro:hasAnyRoles name="admin, teacher, classTeacher">
            <div class="col-sm-4">

                <div class="contact-box">

                    <div class="col-sm-12">
                        <div class="text-center">
                            <a data-toggle="modal" href="#add-form" title="添加成员">
                                <img alt="image"  class="img-circle m-t-xs img-responsive"
                                     src="/img/jiaHao1.png"/>
                            </a>
                        </div>

                    </div>

                    <div class="clearfix"></div>

                </div>


            </div>
        </shiro:hasAnyRoles>
    </div>

</div>


<div id="add-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r lab">
                        <h3 class="m-t-none m-b">添加成员</h3>
                        <form id = "defaultForm" role="form"  action="/users/add_member" class="form-horizontal" method="post"
                              modelAttribute="user" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>头像：</label>
                                <input class="form-control" type="file" name="file" style="height:40px;">

                            </div>
                            <div class="form-group">
                                <label>角色：</label>
                                <select  class="form-control" name="roleId" style = "height: 35px;">
                                    <option value="4">学生</option>
                                    <option value="1">班干部</option>
                                </select>

                            </div>
                            <%--<div class="form-group">
                                <label>生日：</label>
                                <input class="form_datetime form-control" name = "birthday" type="text" onclick="getDate()" size="16">

                            </div>--%>
                            <div class="form-group">
                                <label>名称：</label>
                                <input  type="text" name="userName" class = "form-control"/>

                            </div>

                            <div class="form-group">
                                <label >微信：</label>
                                <input  id="wet" type="text" name="weChat" class = "form-control" maxlength="20"/>

                            </div>

                            <div class="form-group">
                                <label>身份证号：</label>
                                <input id="cardId" type="text" name="idCard" class = "form-control" diyCheck="请正确填写您的身份证！" diyRule="^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$"/>

                            </div>

                            <div class="form-group">
                                <label>手机号码：</label>
                                <input id="phone"  type="text" name="phone" class = "form-control" diyCheck="请正确填写您的手机号！" diyRule="^1[3|4|5|6|7|8][0-9]{9}$" />

                            </div>

                            <div class="row">
                                <div class = "col-xs-6">
                                    <label>扣扣：</label>
                                    <input type="text" name="qq" class="form-control">
                                </div>

                                <div class = "col-xs-6">
                                    <label>户口性质：</label>
                                    <select name="residence" class="form-control" style="height:35px;">
                                        <option value="农村">农村</option>
                                        <option value="城市">城市</option>
                                    </select>
                                </div>
                            </div>
                            <p/>
                            <div class="row">
                                <div class = "col-xs-6">
                                    <label>籍贯：</label>
                                    <input type="text" name="nation"  class="form-control"/>
                                </div>

                                <div class = "col-xs-6">
                                    <label >家庭住址：</label>
                                    <input id="address" type="text"name="address" class="form-control"/>
                                </div>
                            </div>

                            <p/>
                            <div class="row">
                                <div class = "col-xs-6">
                                    <label>性别：</label>
                                    <select name="gender" class="form-control" style="height:35px;">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>

                                <div class = "col-xs-6">
                                    <label>家长姓名：</label>
                                    <input type="text" name="parentName"   class="form-control">
                                </div>
                            </div>


                            <p/>
                            <div class="form-group">
                                <label>描述：</label>
                                <textarea class="form-control" rows="3" name="des" maxlength="250"></textarea>

                            </div>

                            <div class="modal-footer" style="overflow:hidden;">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                <input onclick="addMember();"  class="btn btn-primary" value="添加"/>

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

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>

<script src="/js/bootstrap-datetimepicker.min.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="/js/user/users.js"></script>
<script src="/js/layer.min.js"></script>
<script>
    $(document).ready(function () {
        $('.contact-box').each(function () {
            animationHover(this, 'pulse');
        });
    });

    function addMember(){
        if($("#defaultForm").valid()){
            var count = 0;
            layer.confirm('添加新成员成功, 初始密码为123456',{
                btn: ['确认']
                },//按钮
                    function (r) {
                            count++;
                            if (count == 1) {
                                $("#defaultForm").submit();
                            }
                    });
        }
        return false;
    }

    MyValidator.init();

</script>
</body>
</html>
