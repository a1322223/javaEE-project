<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8" />
    <title>category list page</title>
    <script>
        function del() { return confirm('REMOVE?'); }
    </script>
</head>
<body>
<c:import url="add.jsp"/>
<hr/>
<h1>LIST Category</h1>
<hr/>
<table border="1">
    <tr>
        <th>COUNT</th>
        <th>TITLE</th>
        <th>DESC</th>
        <th>CREATETIME</th>
        <th>UPDATETIME</th>
        <th>STATUS</th>
        <th>PARENTID</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <c:forEach var="category" items="${sessionScope.list}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${category.title}</td>
            <td>${category.desc}</td>
            <td>${category.createTime}</td>
            <td>${category.updateTime}</td>
            <td>${category.status}</td>
            <td>${category.parentId}</td>
            <td><a href="${ctx}/category/queryById/${category.id}">EDIT</a></td>
            <td><a class="delete" href="${ctx }/category/remove/${category.id}" onclick="return del()">REMOVE</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
