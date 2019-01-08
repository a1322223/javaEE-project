<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
    <style>
        h3,
        b {
            color: #900;
        }
    </style>
</head>
<body>
<h3>Error.</h3>
<pre>
        <b>requestURI</b> ${pageContext.errorData.requestURI}
        <b>statusCode</b> ${pageContext.errorData.statusCode}
        <b>cause</b> ${pageContext.exception.cause}
        <b>message</b> ${pageContext.exception.message}

        <b>stackTrace</b>
        <c:forEach var="trace" items="${pageContext.exception.stackTrace}">
            ${trace}
        </c:forEach>
</pre>
</body>
</html>
