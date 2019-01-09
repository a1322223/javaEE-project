<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/17
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/inc.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";

        #avatar {
            height: 20px;
        }

        #avatar-big {
            height: 100px;
        }

        table td {

        }
    </style>
</head>
<body>
<nav id="nav" class=" navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">
    <h1>个人中心</h1>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-8">
            ${sessionScope.userInfo}
            <form action="${ctx}/userInfo/modify" method="post" enctype="multipart/form-data">
                用户名：<input type="text" name="username"><br><br>
                头　像：
                <img class="img-circle" id="avatar-big" src="/avatar/${sessionScope.user.userInfo.avatar}"
                     alt="${sessionScope.user.userInfo.username}">
                <input type="file" name="avatar"><br><br>
                电　话: <input type="text" name="mobile"><br><br>
                <input type="submit" value="修改">
            </form>
        </div>
    </div>
    <%--${sessionScope.user.email}--%>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script src="${ctx}/assets/scripts/vue.min.js"></script>
</body>
</html>
