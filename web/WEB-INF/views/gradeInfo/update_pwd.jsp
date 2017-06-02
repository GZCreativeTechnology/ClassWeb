<%--
  Created by IntelliJ IDEA.
  User: xiao-kang
  Date: 2017/2/16
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="/favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div id="pwd-form" class="modal fade" aria-hidden="true" data-backdrop="static" keyboard:false>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">修改密码</h3>
                        <form role="form" id="updatePwdForm" method="post" action="/users/update_pwd">
                           <%-- <div id="errMsg" style="color: red; text-align: left;">${requestScope.error}</div>--%>
                            <div class="form-group">
                                <label>旧密码：</label>
                                <input type="password" placeholder="请输入旧密码" id = "pwd" name="pwd" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label>新密码：</label>
                                <input type="password" placeholder="请输入新密码" id = "newPwd" name="newPwd"
                                       class="form-control"/>

                            </div>

                            <div class="form-group">
                                <label>确认密码：</label>
                                <input type="password" placeholder="请确认新密码" id = "conPwd" name="conPwd"
                                       class="form-control"/>
                            </div>
                               <label>密码强度：</label>
                            <div class="btn-group" id = "checkPwd" data-toggle="buttons" style = "display: none;">

                                   <label class="btn btn-primary" id = "weak" style ="background:darkgray;">
                                       <input type="checkbox" autocomplete="off" > 弱
                                   </label>
                                   <label class="btn btn-primary" id = "centre" style ="background:darkgray;">
                                       <input type="checkbox" autocomplete="off"> 中
                                   </label>
                                   <label class="btn btn-primary" id = "strong" style ="background:darkgray;">
                                       <input type="checkbox" autocomplete="off"> 强
                                   </label>
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
<script src="/js/jquery.validate.js"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="/js/content.js?v=1.0.0"></script>
<script src="/js/user/update-pwd.js"></script>
<script>
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

    $(function () {
        $("#pwd-form").modal('show');
        checkPwd();
    });

    $("#updatePwdForm").submit(function(){
        $(":submit",this).attr("disabled","disabled");
    });
    MyValidator.init();


</script>
</body>
</html>
