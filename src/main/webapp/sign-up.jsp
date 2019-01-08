<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="commons/inc.jsp"%>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--<title>index page</title>--%>
<%--<style>--%>
<%--@import "assets/bootstrap/css/bootstrap.css";--%>
<%--@import "assets/styles/global.css";--%>
<%--</style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>--%>
<%--<header class="index jumbotron"></header>--%>
<%--<main class="container">--%>
<%--<section class="col-md-4 col-md-offset-4">--%>
<%--<form action="${ctx}/user/signUp" method="post">--%>
<%--<div class="form-group">--%>
<%--<label for="email">Email</label>--%>
<%--<input id="email" name="email" class="form-control">--%>
<%--<span id="hint">${requestScope.message}</span>--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="password">Password</label>--%>
<%--<input id="password" type="password" name="password" class="form-control">--%>
<%--</div>--%>
<%--<button id="signUp" type="submit" class="btn btn-success btn-block">注册</button>--%>
<%--</form>--%>
<%--</section>--%>
<%--</main>--%>
<%--<footer class="index jumbotron"></footer>--%>
<%--<script src="assets/scripts/jquery.min.js"></script>--%>
<%--<script src="assets/bootstrap/js/bootstrap.js"></script>--%>
<%--<script src="assets/scripts/global.js"></script>--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="commons/inc.jsp" %>
    <title>商城登录界面</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${ctx}/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${ctx}/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${ctx}/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>
<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>
<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1>Sign Up Page</h1>
                    <div class="description">
                        <%--<p>--%>
                        <%--This is a free responsive login form made with Bootstrap.--%>
                        <%--Download it on <a href="#"><strong>AZMIND</strong></a>, customize and use it as you like!--%>
                        <%--</p>--%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>欢迎来到注册界面</h3>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="${ctx}/user/signUp" method="post" class="login-form"
                              onsubmit="return check()">
                            <div class="form-group">
                                <label class="sr-only" for="email">Email</label>
                                <input type="text" name="email" placeholder="Email" class="form-username form-control"
                                       id="email">
                                <span id="hint">${sessionScope.message}</span>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <input type="password" name="password" placeholder="Password"
                                       class="form-password form-control" id="password">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="confirm">Confirm Password</label>
                                <input type="password" name="confirm" placeholder="Confirm Password"
                                       class="form-password form-control" id="confirm">
                            </div>
                            <button type="submit" id="signUp" class="btn">注册!</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- Javascript -->
<script src="${ctx}/assets/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/jquery.backstretch.min.js"></script>
<script src="${ctx}/assets/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="assets/js/placeholder.js"></script>
<![endif]-->
<%--<script src="${ctx}/assets/scripts/jquery.min.js"></script>--%>
<script>
    $(function () {
        $('nav').load('/nav.jsp');
    })
</script>

<script>
    function check() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var repass = document.getElementById("confirm").value;
        if (email == "") {
            alert("用户名不能为空");
            return false;
        }
        if (password == "") {
            alert("密码不能为空");
            return false;
        }
        if (password != repass){
            alert("两次密码不一致，请重新输入！");
            return false;
        }
        return true;
    }

    $(function () {
        $('#email').on('blur', function () {
            var email = $(this).val();
            $.ajax({
                url: ${ctx}'/user/checkEmail',
                type: 'post',
                data: {'email': email},
                dataType: 'json',
                success: function (data) {
                    console.log(data.emailExisted);
                    if (data.emailExisted) {
                        $('#hint').text("Email is existed.").css('color', '#900');
                        $('#signUp').prop('disabled', true);
                    } else {
                        $('#hint').text("Email is not existed.").css('color', '#090');
                        $('#signUp').prop('disabled', false);
                    }
                },
                error: function (a, b, c) {
                    console.log((a + ', ' + b + ', ' + c));
                }
            });
        });
    });
</script>
</body>
</html>
