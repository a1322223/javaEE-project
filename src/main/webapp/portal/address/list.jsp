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
        function del() {
            return confirm("确认删除这条地址？")
        }
    </script>
</head>
<body>
<nav id="nav" class=" address navbar navbar-inverse"></nav>
<header class=" address jumbotron"></header>
<main class="container">
    <section class="col-md-2">
        <hr/>
        <h3>全部功能</h3><hr/>
        <ul>
            <li class="sticker"><a href="../info.jsp">信息管理</a></li>
            <li class="sticker"><a href="list.jsp">地址管理</a></li>
            <li class="sticker"><a href="../order.jsp">我的订单</a></li>
        </ul>
    </section>
    <section class="col-md-10">
        <article>
            <c:choose>
                <c:when test="${fn:length(sessionScope.list) eq 0}">
                    <p class="text-warning">您还没有收货地址</p>
                    <a class="btn btn-success btn-sm" href="add.jsp">新建地址</a>
                </c:when>
                <c:otherwise>
                    <h1>地址列表</h1>
                    <table class="table table-striped table-hover table-bordered table-responsive">
                        <tr>
                            <th>序号</th>
                            <th>收货人</th>
                            <th>地址</th>
                            <th>联系方式</th>
                            <th colspan="2">操作</th>
                            <th>默认地址</th>
                        </tr>
                        <c:forEach var="address" items="${sessionScope.list}" varStatus="vs">
                            <tr>
                                <td width="10%">${vs.count}</td>
                                <td width="10%">${address.name}</td>
                                <td>
                                        ${address.province}
                                        ${address.city}
                                        ${address.area}
                                        ${address.town}
                                        ${address.detail}
                                </td>
                                <td>${address.mobile}</td>
                                <td><a href="${ctx}/address/queryById/${address.id}/0">编辑</a></td>
                                <td><a class="delete" href="${ctx }/address/remove/${address.id}"
                                       onclick="return del()">删除</a></td>
                                <td>
                                    <c:if test="${address.status eq 1}">
                                        <button class="btn btn-warning btn-sm">默认地址</button>
                                    </c:if>
                                    <c:if test="${address.status eq 0}">
                                        <a href="${ctx}/address/setDefault/${address.id}">设为默认地址</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7" id="button">
                                <a class="btn btn-success btn-sm" href="add.jsp">添加地址</a>
                            </td>
                        </tr>
                    </table>
                </c:otherwise>
            </c:choose>
        </article>
    </section>
</main>
<footer class=" address jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
</body>
</html>