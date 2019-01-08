<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8" />
    <title>product list page</title>
    <style>
        table {
            width: 100%;
        }

        th,
        td {
            word-break: break-all;
        }
    </style>
    <script>
        function del() { return confirm('REMOVE?'); }
    </script>
</head>
<body>
<c:import url="add.jsp"/>
<hr/>
<h1>LIST Product</h1>
<hr/>
<table border="1">
    <tr>
        <th>COUNT</th>
        <th>TITLE</th>
       <%-- <th>COVERPICTURE</th>
        <th>SLIDEPICTURES</th>
        <th>DETAILPICTURES</th>--%>
        <th>DESC</th>
        <th>PRICE</th>
        <th>ORIGINPRICE</th>
        <%--<th>SPEC</th>
        <th>CREATETIME</th>
        <th>UPDATETIME</th>--%>
        <th>STATUS</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <c:forEach var="product" items="${sessionScope.pagination.list}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${product.title}</td>
           <%-- <td>${product.coverPicture}</td>
            <td>${product.slidePictures}</td>
            <td>${product.detailPictures}</td>--%>
            <td>${product.desc}</td>
            <td>${product.price}</td>
            <td>${product.originPrice}</td>
           <%-- <td>${product.spec}</td>
            <td>${product.createTime}</td>
            <td>${product.updateTime}</td>--%>
            <td>${product.status}</td>
            <td><a href="${ctx}/product/queryById/${product.id}">EDIT</a></td>
            <td><a class="delete" href="${ctx }/product/remove/${product.id}" onclick="return del()">REMOVE</a></td>
        </tr>
    </c:forEach>
</table>
<c:import url="${ctx}/commons/page.jsp">
    <c:param name="path" value="product/${sessionScope.pagination.sqlId}"/>
</c:import>
</body>
</html>
