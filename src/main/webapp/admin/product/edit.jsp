<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/28
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/inc.jsp"%>

<html>
<head>
    <title>Title</title>
    <style>
        img {
            height: 50px;
        }
    </style>
</head>
<body>
<c:set var="p" value="${sessionScope.product}"/>
<h1>EDIT Product</h1>
<form action="${ctx}/product/modify" method="post"  enctype="multipart/form-data">
    <input type="hidden" name="id" value="${p.id}">
    <p>商品名称:<input name="title" value="${p.title}"></p>
    <hr>
    <p>封面图片:</p>
    <div id="cover" title='${p.coverPicture}'></div>
    <hr>
    <p>滑动图片：</p>
    <div id="slide" title='${p.slidePictures}'></div>
    <hr>
    <p>详情图片：</p>
    <div id="detail" title='${p.detailPictures}'></div>
    <hr>
    产品描述: <input name="desc" value="${sessionScope.product.desc}"><br>
    产品价格: <input name="price" value="${sessionScope.product.price}"><br>
    产品原价: <input name="originPrice" value="${sessionScope.product.originPrice}"><br>
    产品规格: <input name="spec" value="${sessionScope.product.spec}"><br>
    创建时间: ${sessionScope.product.createTime}<br>
    产品状态: <input name="status" value="${sessionScope.product.status}"><br>
    <input type="submit" value="保存">
</form>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script>
    // 封面图片
    var cover = $('#cover');
    var coverPicture = cover.attr('title');
    var coverPictureArray = coverPicture.replace(/([\[\]"])/g, '').split(',');
    cover.before('<input type="file" name="coverPictureFile" value="' + coverPictureArray[0] + '"><img src="${ctx}/pictures/cover/' + coverPictureArray[0] + '"/><br>');
    // 滑动图片组
    var slidePictures = $('#slide').attr('title');
    var slidePicturesArray = slidePictures.replace(/([\[\]"])/g, '').split(',');
    $.each(slidePicturesArray, function (index, item) {
        $('#slide').before('<input type="file" name="slidePictureFiles" value="' + item + '"><img src="${ctx}/pictures/slide/' + item + '"/><br>');
    });
    // 详情图片组
    var detailPictures = $('#detail').attr('title');
    var detailPicturesArray = detailPictures.replace(/([\[\]"])/g, '').split(',');
    $.each(detailPicturesArray, function (index, item) {
        $('#detail').before('<input type="file" name="detailPictureFiles" value="' + item + '"><img src="${ctx}/pictures/detail/' + item + '"/><br>');
    })
</script>
</body>
</html>
