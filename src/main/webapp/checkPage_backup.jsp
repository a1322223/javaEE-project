<%@ page import="lombok.var" %><%--
  User: LiQingsong
  Date: 2019/1/3
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <title>EC</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";

        section {
            margin-bottom: 30px;
        }

        article {
            background: #f4f4f4 no-repeat center center;
            height: 245px;
        }

        article:hover {
            opacity: .8;
        }

        p.t {
            margin-top: 5px;
            font-weight: bolder;
            white-space: nowrap;
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        p.t:hover {
            color: #2aabd2;
        }

        p.p b {
            color: #d4282d;
            margin-right: 20px;
        }

        p.p s {
            color: #999;
            text-decoration: line-through;
        }

        p.p b:before,
        p.p s:before {
            content: '￥';
        }

        p.t,
        p.p {
            text-align: center;
        }

        article,
        p.t {
            cursor: pointer;
            background-size: contain;
        }

        .cate-product-wrapper {
            margin: auto;
        }

        .cate-bar {
            margin: 20px 0;
        }

        .cate-bar a {
            text-decoration: none;
        }

        .cate-bar .sup-cate {
            font-size: 30px;
            padding-left: 0;
        }

        .cate-bar .sub-cate {
            text-align: right;
            padding-top: 18px;
            padding-right: 0;
        }

        .breadcrumb {
            margin: 0;
            padding: 0;
            background: transparent;
        }

        .breadcrumb ol {
            margin: 14px 0;
        }

        .video {
            position: absolute;
            top: 190px;
            left: 20px;
            cursor: pointer;
            width: 60px;
        }
        #errorInfo {
            padding-top: 60px;
            padding-left: 20px;
        }
    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>

<c:if test="${not empty sessionScope.notFoundMessage}">
<div id="errorInfo">${sessionScope.notFoundMessage}</div>
</c:if>

<main class="container-fluid" style="background: #f4f0ea;">
    <div class="cate-product-wrapper row container" id="root">
        <%--<section class="col-md-3" v-for="(item, index) of productList" :key="index" :id="item.id">--%>
            <%--<article :style="'background-image:url('+item.background+')'">--%>
            <%--<img class="video" src="${ctx}/assets/images/video.svg">--%>
            <%--</article>--%>
            <%--<p class="t" :title="item.title">{{item.title}}</p>--%>
            <%--<p class="p"><b>{{item.price}}</b><s>{{item.originalPrice}}</s></p>--%>
        <%--</section>--%>
            <section v-for="product in products" class="col-md-3" :id="product.id">
                <article :style="{backgroundImage: 'url('+ product.coverPictureUrl +')'}">
                    <img v-if="product.mp4Url != null || product.webmUrl != null" class="video"
                         src="${ctx}/assets/images/video.svg">
                </article>
                <p class="t" :title="product.title">{{product.title}}</p>
                <p class="p"><b>{{product.price}}</b><s>{{product.originPrice}}</s></p>
            </section>
    </div>
</main>

<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script src="assets/scripts/vue.min.js"></script>
<script type="text/javascript">
    var productlist = '${productList}';
    var jsonObj = JSON.parse(productlist);
    var jsonArray = [];
    var notFoundMessage = '${notFoundMessage}';
    for (var i = 0; i < jsonObj.length; i++) {
        jsonArray[i] = jsonObj[i];
    }
    console.log(typeof(jsonArray));
    console.log(jsonArray);
    new Vue({
        el: "#root",
        data: {
            "products": jsonArray,
            "notFoundMessage":notFoundMessage
        }
    });


    // future element: jQuery
    $(document).on('click', 'article, p.t', function () {
        var id = $(this).parent('section').attr('id');
        window.open(
            '${ctx}/product/detail/' + id,
            '_blank'
        );
    });
</script>