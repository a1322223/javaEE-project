<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/17
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "../assets/bootstrap/css/bootstrap.css";
        @import "../assets/styles/global.css";
        #avatar {
            height: 20px;
        }
        #avatar-big {
            height: 100px;
        }
    </style>
</head>
<body>
<nav id="nav" class=" navbar navbar-inverse"></nav>
<header class=" jumbotron"></header>
<main class="container">
    <h1>home</h1>
    <img class="img-circle" id="avatar-big" src="/avatar/${sessionScope.user.userInfo.avatar}" alt="${sessionScope.user.userInfo.username}">
    ${sessionScope.user.email}
</main>
<footer class=" jumbotron"></footer>
<script src="../assets/scripts/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.js"></script>
<script src="../assets/scripts/global.js"></script>
</body>
</html>
