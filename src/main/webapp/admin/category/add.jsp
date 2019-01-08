<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/28
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/inc.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${ctx}/category/create" method="post">
    <input name="title" placeholder="TITLE"><br>
    <input name="desc" placeholder="DESC" value="desc..."><br>
    <select name="status" placeholder="STATUS">
        <option value="0">启用</option>
        <option value="1">停用</option>
    </select><br>
    一级类别
    <c:forEach var="category" items="${sessionScope.categories}">
        <input type="radio" name="parentId" value="${category.id}"/> ${category.title}
    </c:forEach>
    <br>
    <input type="submit" value="ADD">
</form>
</body>
</html>
