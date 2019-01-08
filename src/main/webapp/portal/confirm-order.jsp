<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>detail page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
        #avatar{
            height: 20px;
        }
        .table {
            /*margin-bottom: 0;*/
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse navbar-fixed-top"></nav>
<header class="jumbotron"></header>
<main class="container">
    <c:set var="a" value="${sessionScope.address}"/>
    <h1>订单确认</h1>
    <table class="table table-striped">
        <tr>
            <th>收货信息</th>
        </tr>
    </table>
    <div>
        <div class="col-md-10">
            <p class=""><span class="glyphicon glyphicon-map-marker"></span>默认地址
                <button class="btn btn-default text-warning">修改</button>
            </p>
            <p class="text-warning">收货人：${a.name}</p>
            <p class="text-warning">联系方式：${a.mobile}</p>
            <p class="text-warning">收货地址：${a.province}${a.city}${a.area}${a.town}${a.detail}</p>
        </div>
        <div class="col-md-2">
            <p><a href="">地址切换</a></p>
            <button class="btn btn-default">新建地址</button>
        </div>

    </div>
    <table class="table table-striped">
        <tr>
            <th colspan="2">商品信息</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
            <th>实付</th>
        </tr>
        <c:forEach var="p" items="${sessionScope.list}">
            <tr>
                <td>${p.coverPicture}</td>
                <td>${p.title}</td>
                <td>${p.price}</td>
                <td>${p.cart.number}</td>
                <td>${p.price * p.cart.number}</td>
                <td>${p.price * p.cart.number}</td>
            </tr>
        </c:forEach>
    </table>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>
