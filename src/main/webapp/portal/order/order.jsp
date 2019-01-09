<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
        @import "${ctx}/assets/styles/portal.css";
    </style>
    <script>
    </script>
</head>
<body>
<nav id="nav" class=" address navbar navbar-inverse"></nav>
<header class=" address jumbotron"></header>
<main class="container">
    <section class="col-md-2">
        <hr/><h3>全部功能</h3><hr/>
        <ul>
            <li class="sticker"><a href="../info/info.jsp">信息管理</a></li>
            <li class="sticker"><a href="../address/list.jsp">地址管理</a></li>
            <li class="sticker"><a href="order.jsp">我的订单</a></li>
        </ul>
    </section>
    <section class="col-md-10">
        <article>
            <h2>订单列表</h2>
            <table class="table table-striped table-hover table-bordered table-responsive">
                <tr>
                    <th class="text-center" width="35%" colspan="2">商品</th>
                    <th class="text-center" width="15%">单价</th>
                    <th class="text-center" width="10%">数量</th>
                    <th class="text-center" width="10%">实付款</th>
                    <th class="text-center" width="15%">操作</th>
                </tr>
                <%--<c:forEach var="address" items="${sessionScope.list}" varStatus="vs">--%>
                <%--<tr>--%>
                <%--<td width="10%">${vs.count}</td>--%>
                <%--<td width="10%">${address.name}</td>--%>
                <%--<td>--%>
                <%--${address.province}--%>
                <%--${address.city}--%>
                <%--${address.area}--%>
                <%--${address.town}--%>
                <%--${address.detail}--%>
                <%--</td>--%>
                <%--<td>${address.mobile}</td>--%>
                <%--<td><a href="${ctx}/address/queryById/${address.id}">编辑</a></td>--%>
                <%--<td><a class="delete" href="${ctx }/address/remove/${address.id}"--%>
                <%--onclick="return del()">删除</a></td>--%>
                <%--<td>--%>
                <%--<c:if test="${address.status eq 1}">--%>
                <%--<button class="btn btn-warning btn-sm">默认地址</button>--%>
                <%--</c:if>--%>
                <%--<c:if test="${address.status eq 0}">--%>
                <%--<a href="${ctx}/address/setDefault/${address.id}">设为默认地址</a>--%>
                <%--</c:if>--%>
                <%--</td>--%>
                <%--</tr>--%>
                <%--</c:forEach>--%>
            </table>
        </article>
    </section>
</main>
<footer class=" address jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>
