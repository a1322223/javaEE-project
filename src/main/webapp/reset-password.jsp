<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/31
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <section>
        <article>
            <form action="${ctx}/user/resetPassword" method="post">
                <div class="input-group col-md-6 col-md-offset-3">
                    <label for="password">请填写密码:</label>
                    <input id="password" name="password" class="form-control input-lg style='min-width: 100%;'">
                </div>
                <button type="submit" class=" btn btn-primary btn-lg col-md-6 col-md-offset-3">提交</button>
            </form>
        </article>
    </section>
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
</body>
</html>
