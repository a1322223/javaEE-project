<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detail page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";

        .input-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse navbar-fixed-top"></nav>
<header class="jumbotron"></header>
<main class="container">
    <section class="col-md-6 col-md-offset-3">
        <article>
            <h1>重置密码</h1>
            <form action="${ctx}/user/checkEmailForReset" method="post">
                <div class="input-group" style="min-width: 100%;">
                    <label for="email">请填写注册邮箱</label>
                    <input id="email" name="email" class="form-control input-lg" style="min-width: 100%;">
                </div>
                <button class="btn btn-primary btn-lg">提交</button>
            </form>
            <p class="text-danger">${requestScope.errorMessage}</p>
            <p class="text-success">${sessionScope.message}</p>
        </article>
    </section>

</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>
