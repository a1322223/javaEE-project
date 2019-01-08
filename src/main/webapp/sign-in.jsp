<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>
<header class="index jumbotron"></header>
<main class="container">
    <section class="col-md-4 col-md-offset-4">
        <form action="${ctx}/user/signIn" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" value="a">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" class="form-control" value="a">
            </div>
            <button type="submit" class="btn btn-primary btn-block">登录</button>
            <p class="text-right"><a class="text-warning" href="${ctx}/email.jsp">忘记密码？</a></p>
        </form>
        ${requestScope.message}
    </section>
</main>
<footer class="index jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>
