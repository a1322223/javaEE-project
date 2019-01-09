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
    <link rel="stylesheet" href="${ctx}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/assets/css/form-elements.css">
    <link rel="stylesheet" href="${ctx}/assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${ctx}/assets/ico/favicon.png">
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
                        <span style="color: red;font-size: 20px;font-weight: 500;">${requestScope.message}</span>
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
<script>
    $(function () {
        $('nav').load('/nav.jsp');
    })
</script>
</body>
</html>
