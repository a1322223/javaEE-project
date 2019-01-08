<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/28
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/inc.jsp" %>
<html>
<head>
    <title>product add page</title>
    <style>
        #slide,
        #detail {
            background: #999999;
            cursor: pointer;
        }
        .indent {
            margin-left: 20px;
        }

    </style>
</head>
<body>
<h1>ADD Product</h1>
<form action="${ctx}/product/create" method="post" enctype="multipart/form-data">
    <input name="title" placeholder="TITLE"><br>
    封面图片
    <br>
    <input type="file" name="coverPictureFile"><br>
    滑动图片
    <br>
    <input type="file" name="slidePictureFiles"><br>
    <span id="slide">Add Slide File</span><br>
    详情图片
    <br>
    <input type="file" name="detailPictureFiles"><br>
    <span id="detail">Add Detail File</span><br>
    <input name="desc" placeholder="DESC" value="desc..."><br>
    <input name="price" placeholder="PRICE" value="123.45"><br>
    <input name="originPrice" placeholder="ORIGIN PRICE" value="321"><br>
    <input name="spec" placeholder="SPEC" value="sepc..."><br>
    STATUS
    <select name="status">
        <option value="0">上架</option>
        <option value="1">暂存</option>
    </select>
    <br>
    商品类别

    <select name="categoryId">
        <c:forEach var="category" items="${sessionScope.categories}">
            <option disabled="disabled">${category.title}</option>
            <c:if test="${fn:length(category.categories) > 0}">
                <c:forEach var="subCategory" items="${category.categories}">
                    <option value="${subCategory.id}"><i class="indent">${subCategory.title}</i></option>
                </c:forEach>
            </c:if>
        </c:forEach>
    </select>
    <br>
    <input type="submit" value="ADD">
</form>
<script src="../../assets/scripts/jquery.min.js"></script>
<script>
    $(function () {
        $('#slide,#detail').on('click', function () {
            $('<input type="file" name=" ' + $(this).attr('id') + 'PictureFiles"><br>').insertBefore($(this))
        })
    });
</script>
</body>
</html>
