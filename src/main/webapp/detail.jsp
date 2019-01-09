<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<c:set var="p" value="${sessionScope.product}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <title>${p.title} - ${p.desc} - EC</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";
        @import "assets/styles/lightslider.css";

        #detail,
        #hot {
            border-top: 5px solid #f4f4f4;
        }

        #image-gallery {
            background-color: #f4f4f4;
        }

        #image-gallery img {
            width: 428px;
            height: 428px;
        }

        .lSGallery {
            background-color: #f4f4f4;
        }

        div.lSSlideOuter {
            width: 533px;
        }

        .number input {
            border: none;
            padding: 0;
            margin: 0;
        }

        .number span,
        .number input {
            vertical-align: middle;
            display: inline-block;
            width: 25px;
            text-align: center;
            border: 1px solid #ddd;
            height: 25px;
        }

        .number input {
            border-left: none;
            border-right: none;
            width: 40px;
        }

        .number input:focus {
            outline-width: 0;
        }

        .number span {
            font-size: 18px;
            line-height: 25px;
            user-select: none;
        }

        .cursor-disabled {
            cursor: not-allowed;
            color: #ddd;
        }

        .cursor-enabled {
            cursor: pointer;
            color: #333;
        }

        #detail img {
            width: 100%;
        }

        div.row {
            margin-bottom: 30px;
        }

        p.title {
            font-weight: bolder;
            font-size: 1.4em;
        }

        span.price:before {
            content: '￥';
            color: #f00;
        }

        span.price {
            color: #f00;
            font-size: 1.2em;
            font-weight: bolder;
        }

        span.originPrice {
            text-decoration: line-through;
        }

        span.originPrice:before {
            content: '￥';
        }

        #info {
            background: #f5f3ef;
            padding: 10px;
            margin: 20px 0;
        }

        div.number {
            padding: 10px;
        }

        i.number-text {
            margin-right: 10px;
            font-style: normal;
        }

        div.action {
            margin-top: 20px;
            padding-left: 10px;
        }

        .action button {
            margin-right: 10px;
        }

        video {
            width: 428px;
            height: 428px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 999
        }

        #play {
            position: absolute;
            top: 360px;
            left: 20px;
            cursor: pointer;
        }

        .hot-product {
            border-bottom: 1px solid #e8e8e8;
            margin: 10px 24px 0;
            text-align: center;
            cursor: pointer;
        }

        .hot-product:hover {
            opacity: .8;
        }

        .hot-product p span:before {
            content: '￥';
        }

        .hot-product p span:first-of-type {
            color: #d62525;
        }

        .hot-product p span:last-of-type {
            color: #666;
            text-decoration: line-through;
        }

        .hot-product img {
            width: 60%;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse navbar-fixed-top"></nav>
<header class="jumbotron"></header>
<main class="container">

    <div class="row">
        <section class="col-md-6">
            <article id="slider-pictures" style="position: relative">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden"
                    data-sup-id="${p.category.categoryId}"
                    data-sub-id="${p.category.id}"
                    data-picture-id="${p.productId}"
                    data-slide-pictures='${p.slidePictures}'
                    data-cover-picture='${p.coverPicture}'
                >
                </ul>
                <c:if test="${p.webm ne null or p.mp4 ne null}">
                    <img id="play" src="${ctx}/assets/images/play.svg">
                    <%--disablepictureinpicture--%>
                    <video id="product-show" controls autoplay
                           controlsList="nodownload noremoteplayback nofullscreen" oncontextmenu="return false">
                        <c:if test="${p.webm ne null}">
                            <source src="${img}webm/${p.category.categoryId}/${p.category.id}/${p.productId}/${p.webm}"
                                    type="video/webm">
                        </c:if>
                        <c:if test="${p.mp4} ne null}">
                            <source src="${img}mp4/${p.category.categoryId}/${p.category.id}/${p.productId}/${p.mp4}"
                                    type="video/mp4">
                        </c:if>
                        您的浏览器不支持视频播放
                    </video>
                </c:if>
            </article>
        </section>
        <section class="col-md-6">
            <article id="product" data-product-id="${p.id}">
                <p class="title">${p.title}</p>
                <p class="desc text-warning">${p.desc}</p>
                <div id="info">
                    <p class="price">
                        活动价 <span class="price">${p.price}</span>
                        <c:if test="${p.originPrice ne 0}">
                            <span class="originPrice">${p.originPrice}</span>
                        </c:if>
                    </p>
                    <p>限制 特价商品不可与优惠券叠加使用</p>
                    <p class="service">服务</p>
                    <ul>
                        <li>支持30天无忧退换货</li>
                        <li>48小时快速退款</li>
                        <li>满88元免邮费</li>
                        <li>网易自营品牌</li>
                        <li>国内部分地区无法配送</li>
                    </ul>
                </div>
                <div class="number">
                    <i class="number-text">数量</i>
                    <span id="sub">-</span><input id="num" name="number" value="1" pattern="\d{1,2}"><span
                        id="add">+</span>
                </div>
                <div class="action">
                    <c:if test="${sessionScope.user eq null}">
                        <button  id="buy-goods" class="btn btn-danger btn-lg" ><a href="${ctx}/sign-in.jsp">立即购买</a></button>
                        <button href="${ctx}/sign-in.jsp" id="add-cart" class="btn btn-warning btn-lg"><span
                            class="glyphicon glyphicon-shopping-cart"></span> <a href="${ctx}/sign-in.jsp">加入购物车</a>
                        </button>
                    </c:if>
                    <c:if test="${sessionScope.user ne null}">
                        <button id="buy-goods" class="btn btn-danger btn-lg" ><a href="${ctx}/order-confirm.jsp">立即购买</a></button>
                        <button href="${ctx}/cart.jsp" id="add-cart" class="btn btn-warning btn-lg"><span
                                class="glyphicon glyphicon-shopping-cart"></span> <a>加入购物车</a>
                        </button>
                    </c:if>
                </div>
            </article>
        </section>
    </div>
    <div class="row">
        <section class="col-md-8">
            <article id="detail" data-detail-pictures='${p.detailPictures}'></article>
        </section>
        <section class="col-md-4">
            <article id="hot">
                <c:forEach var="product" items="${sessionScope.hotProducts}">
                    <div class="hot-product" data-product-id="${product.id}">
                        <p>
                            <img src="${img}cover_picture/${product.category.categoryId}/${product.category.id}/${product.productId}/${product.coverPicture}">
                        </p>
                        <p>${product.title}</p>
                        <p>
                            <span>${product.price}</span>
                            <span>${product.originPrice}</span></p>
                    </div>
                </c:forEach>
            </article>
        </section>
    </div>
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script src="assets/scripts/lightslider.min.js"></script>
<script>
    $(document).ready(function () {

        var imageGallery = $('#image-gallery');
        var supId = imageGallery.attr('data-sup-id');
        var subId = imageGallery.attr('data-sub-id');
        var pId = imageGallery.attr('data-picture-id');
        var slidePictures = imageGallery.attr('data-slide-pictures');
        var coverPicture = imageGallery.attr('data-cover-picture');
        $.each($.parseJSON(slidePictures), function (index, slidePicture) {
            var list = '<li data-thumb=" ${img}' + 'slide_pictures/' + supId + '/' + subId + '/' + pId + '/' + slidePicture + ' ">' +
                <%--'<img src=" ${img}' + 'cover_picture/' + supId + '/' + subId + '/' + pId + '/' + coverPicture + ' "/>' +--%>
                '<img src=" ${img}' + 'slide_pictures/' + supId + '/' + subId + '/' + pId + '/' + slidePicture + ' "/>' +
                '</li>';
            imageGallery.append(list);
        });

        $("#content-slider").lightSlider({
            loop: true,
            keyPress: true
        });

        imageGallery.lightSlider({
            gallery: true,
            item: 1,
            thumbItem: 5,
            slideMargin: 0,
            auto: false,
            loop: true,
            vertical: true,
            verticalHeight: 428,
            onSliderLoad: function () {
                $('#image-gallery').removeClass('cS-hidden');
            }
        });

        /* number begin */
        var sub = $('#sub');
        var add = $('#add');
        var num = $('#num');

        sub.addClass('cursor-disabled');
        add.addClass('cursor-enabled');

        add.on('click', function () {
            var number = num.val();
            if (number < 99) {
                num.val(++number);
                sub.removeClass('cursor-disabled').addClass('cursor-enabled');
            } else {
                add.removeClass('cursor-enabled').addClass('cursor-disabled')
            }
        });

        num.on('keyup', function () {
            var number = num.val();
            if (number <= 0) {
                sub.removeClass('cursor-enabled').addClass('cursor-disabled');
            } else if (number < 99) {
                sub.removeClass('cursor-disabled').addClass('cursor-enabled');
                add.removeClass('cursor-disabled').addClass('cursor-enabled');
            } else {
                add.removeClass('cursor-enabled').addClass('cursor-disabled');
            }
        });

        sub.on('click', function () {
            var number = parseInt($(this).next().val());
            if (number > 1) {
                $(this).next().val(--number);
                $(this).removeClass('cursor-disabled').addClass('cursor-enabled');
                $(this).prop('enabled', true);
            } else {
                $(this).removeClass('cursor-enabled').addClass('cursor-disabled');
                $(this).prop('disabled', true);
            }
        });
        /* number end */

        var detail = $('#detail');
        var detailPictures = detail.attr('data-detail-pictures');

        $.each($.parseJSON(detailPictures), function (index, detailPicture) {
            var img = '<img src="${img}'+'detail_pictures/' + supId + '/' + subId + '/' + pId + '/' + detailPicture + '"/>';
            detail.append(img);
        });

        $('#add-cart').on('click', function () {
            var productId = $('#product').attr('data-product-id');
            var number = $('#num').val();
            $.ajax({
                url: '${ctx}/cart/create',
                type: 'post',
                data: {'productId': productId, 'number': number},
                dataType: 'json',
                success: function (data) {
                    if (data.result) {
                        var cartNumber = $('#cart-number');
                        var currentCartNumber = cartNumber.text();
                        cartNumber.text(parseInt(currentCartNumber) + parseInt(number));
                    }
                }
            });
        });

        $('.hot-product').on('click', function () {
            productId = $(this).attr('data-product-id');
            window.location.href = '${ctx}/product/detail/' + productId;
        });

        var video = $('#product-show');
        $('#play').on('click', function () {
            console.log('play');
            video.show();
            video.get(0).play();
        });

        if (video.get(0)) {
            video.get(0).onended = function () {
                $(this).hide()
            };
        }

    });
</script>
</body>
</html>
