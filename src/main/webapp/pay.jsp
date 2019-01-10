<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <title>商城首页</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";
        .tupian{
            height: 450px;
            width: 500px;
            margin-top: 200px;
            margin-left: 450px;
            margin-right: 500px;
        }
        .erweima{
            margin-top: 50px;
            margin-left: 150px;
            margin-right: 200px;
        }
        .pay{
            margin-left: 140px;
        }


    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>

<main class="container-fluid">
    <div class="tupian">
        <div class="erweima">
            <img src="${ctx}/avatar/erweima.png">
        </div>
        <div class="pay"><span><h3>一共需要支付${param.payMoney}元</h3></span></div>
    </div>
</main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script src="assets/scripts/vue.min.js"></script>
<script>

</script>
</body>
</html>


