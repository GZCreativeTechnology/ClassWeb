<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="signin">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title> - 用户登录</title>
    <link rel="shortcut icon" href="/css/ico.ico">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <link href="/css/login.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/layer.min.js"></script>
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }

        function checkLogin() {
            $("#loginInput").attr('disabled','disabled');
            var phone = document.getElementById("phone").value;
            var password = document.getElementById("password").value;
            var error = document.getElementById("error");
            if (phone != null && phone != "" && password != null && password != "") {
                if (phone.length == 11) {
                    return true;
                } else {
                    error.innerHTML = "请输入正确的手机号";
                    return false;
                }
            }
            error.innerHTML = "手机号和密码都不能为空";
            return false;
        }
    </script>

</head>

<body class="signin" style="height:500px;">
<c:if test="${login == 1}">
    <script>
        layer.confirm("<span style='color:black'>请先登录</span>",{
                btn: ['确定']});
    </script>
</c:if>
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-12">
            <form method="post" onsubmit="return checkLogin()" action="/users/login">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">欢迎回来</p>
                <p style="color: red;" id="error">${error}</p>
                <input type="text" id="phone" name="phone" class="form-control uname" placeholder="手机号"/>
                <input type="password" id="password" name="password" class="form-control pword m-b" placeholder="密码"/>
                <a href="/index" style="text-align: right;">直接访问</a>
                <button id="loginInput" class="btn btn-success btn-block">登录</button>
            </form>
        </div>
    </div>
</div>
</body>

</html>
