<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>category edit page</title>
</head>
<body>
<h1>EDIT Category</h1>
<form action="${ctx}/category/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.category.id}">
    TITLE: <input name="title" value="${sessionScope.category.title}"><br>
    DESC: <input name="desc" value="${sessionScope.category.desc}"><br>
    CREATETIME: ${sessionScope.category.createTime}<br>
    STATUS: <select name="status" value="${sessionScope.category.status}">
    <c:if test="${sessionScope.category.status eq 0}">
        <option value="0" selected="selected">启用</option>
        <option value="1">停用</option>
    </c:if>
    <c:if test="${sessionScope.category.status eq 1}">
        <option value="0">启用</option>
        <option value="1" selected="selected">停用</option>
    </c:if>
</select><br>
    一级类别：
    <c:forEach var="category" items="${sessionScope.categories}">
        <c:if test="${category.id eq sessionScope.category.parentId}">
            <input type="radio" name="parentId" value="${category.id}" checked="checked"/> ${category.title}
        </c:if>
        <c:if test="${category.id ne sessionScope.category.parentId}">
            <input type="radio" name="parentId" value="${category.id}"/> ${category.title}
        </c:if>
</c:forEach>
    <br>
    <input type="submit" value="SAVE">
</form>
</body>
</html>
