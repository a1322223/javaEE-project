<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/29/2018
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <title>upload test page</title>
    <style>
        span {
            color: #fff;
            font-size: 30px;
            background: #900;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>upload</h1>
<pre>
    1. 单个文件上传 coverPicture 1
    2. 固定数量文件上传 slidePictures 5
    3. 任意数量文件上传 detailPictures N
</pre>
<form action="${ctx}/upload/test" method="post" enctype="multipart/form-data">
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <p><input type="file" name="photoFiles"></p>
    <span id="addUpload">+</span>
    <br>
    <input type="submit" value="Upload">
</form>
<script src="assets/scripts/jquery.min.js"></script>
<script>
    $(function () {
        console.log('test');
        $('span#addUpload').on('click', function () {
            $('<p><input type="file" name="photoFiles"></p>').insertBefore($(this));
        });
    });
</script>
</body>
</html>
