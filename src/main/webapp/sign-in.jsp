<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ include file="commons/inc.jsp" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--<title>index page</title>--%>
<%--<style>--%>
<%--@import "${ctx}/assets/bootstrap/css/bootstrap.css";--%>
<%--@import "${ctx}/assets/styles/global.css";--%>

<%--#header {--%>
<%--height: 300px;--%>
<%--background-color: #ffffff;--%>
<%--}--%>
<%--#footer{--%>
<%--background-color: #ffffff;--%>
<%--}--%>
<%--</style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>--%>
<%--<header class="index jumbotron" id="header"></header>--%>
<%--<main class="container">--%>
<%--<section class="col-md-4 col-md-offset-4">--%>
<%--<form action="${ctx}/user/signIn" method="post">--%>
<%--<div class="form-group">--%>
<%--<label for="email">Email</label>--%>
<%--<input id="email" name="email" class="form-control" value="a">--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<label for="password">Password</label>--%>
<%--<input id="password" type="password" name="password" class="form-control" value="a">--%>
<%--</div>--%>
<%--<button type="submit" class="btn btn-primary btn-block">登录</button>--%>
<%--<p class="text-right"><a class="text-warning" href="${ctx}/email.jsp">忘记密码？</a></p>--%>
<%--</form>--%>
<%--${requestScope.message}--%>
<%--</section>--%>
<%--</main>--%>
<%--<footer class="index jumbotron" id="footer"></footer>--%>
<%--<script src="${ctx}/assets/scripts/jquery.min.js"></script>--%>
<%--<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>--%>
<%--<script src="${ctx}/assets/scripts/global.js"></script>--%>
<%--</body>--%>
<%--</html>--%>

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
                    <h1>Sign In Page</h1>
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
                            <h3>欢迎来到登录界面</h3>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="${ctx}/user/signIn" method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="email">Email</label>
                                <input type="text" name="email" placeholder="Email" class="form-username form-control"
                                       id="email">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">Password</label>
                                <input type="password" name="password" placeholder="Password"
                                       class="form-password form-control" id="password">
                            </div>
                            <button type="submit" class="btn">登录</button>
                            <p class="text-right"><a class="text-warning" href="${ctx}/email.jsp">忘记密码？</a></p>
                        </form>
                        ${requestScope.message}
                    </div>
                </div>
            </div>
            <%--<div class="row">--%>
            <%--<div class="col-sm-6 col-sm-offset-3 social-login">--%>
            <%--<h3>...or login with:</h3>--%>
            <%--<div class="social-login-buttons">--%>
            <%--<a class="btn btn-link-2" href="#">--%>
            <%--<i class="fa fa-facebook"></i> Facebook--%>
            <%--</a>--%>
            <%--<a class="btn btn-link-2" href="#">--%>
            <%--<i class="fa fa-twitter"></i> Twitter--%>
            <%--</a>--%>
            <%--<a class="btn btn-link-2" href="#">--%>
            <%--<i class="fa fa-google-plus"></i> Google Plus--%>
            <%--</a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
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
</body>

</html>
