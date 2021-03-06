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
            color: white;
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
            margin: 10px;
            padding: 0;
            background: transparent;
            font-weight: bolder;
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

        .avatar {
            height: 20px;
        }

        #carousel img {
            margin: auto;
            margin-top: 80px;
        }
        .navbar-inverse {
            background-color: #d9edf7;
            border-color: #fdf8f8;
        }
        #footer2 {
            padding-top: 30px;
            height: 120px;
            background-color: #d9edf7;
            color: #fff;
            text-align: center;
        }

    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>
<div id="carousel">

</div>
<main class="container-fluid"></main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script src="assets/scripts/vue.min.js"></script>
<script>
    $(function () {
        $.ajax({
            url: '${ctx}/category/index',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                // category = data[1]
                // console.log(category.id);
                $.each(data, function (index, c) {
                    $('main').append('<div id="wrapper-' + c.id + '" class="cate-product-wrapper row container">');

                    // 1. cate
                    var cateArr = [
                        '<div id="' + c.id + '" class="cate-bar col-md-12">',
                        '<div class="sup-cate col-md-3"><a class="sup-title" href="${ctx}/category.jsp?supId=' + c.id + '&subId=0"></a></div>',
                        '<div class="sub-cate col-md-9"><ol class="breadcrumb"></ol></div></div>'
                    ];

                    $('#wrapper-' + c.id).append(cateArr.join(''));

                    var cateBar = $('#' + c.id);
                    cateBar.find('.sup-title').text(c.title);
                    // console.log(c.categories)
                    $.each(c.categories, function (index, sub) {
                        // console.log(sub.id)
                        if (index < 8) {
                            cateBar.find('ol.breadcrumb').append('<li><a href="${ctx}/category.jsp?supId=' +c.id + '&subId=' + sub.id + '#tagname=' + sub.id + '">' + sub.title + '</a></li>');
                        }
                    });
                    cateBar.find('ol.breadcrumb').append('<li><a href="${ctx}/category.jsp?supId=' + c.id + '&subId=0">查看更多 &gt;</a></li>');

                    // 2. product
                    $.each(c.products, function (index, p) {
                        var productArr = [
                            '<section id="' + p.id + '" class="col-md-3"><article><img class="video" src="${ctx}/assets/images/video.svg"></article>',
                            '<p class="t"></p><p class="p"><b></b><s></s></p></section>'
                        ];

                        $('#wrapper-' + c.id).append(productArr.join(''));

                        var section = $('#' + p.id);
                        section.find('article').css('background-image', 'url(${img}' + 'cover_picture/' + c.id + '/' + p.categoryId + '/' + p.productId + '/' + p.coverPicture + ')');
                        section.find('p.t').attr('title', p.title);
                        section.find('p.t').text(p.title);
                        section.find('p.p b').text(p.price);
                        section.find('p.p s').text(p.originPrice);
                        if (p.mp4 === null && p.webm === null) {
                            section.find('img').hide();
                        }
                    })
                });
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

        $(window).on('load', function () {
            $('.cate-product-wrapper:even').css('background', '#ffffff');
        });
    });
</script>
<script>
    $(function () {
        $('#carousel').load('/carousel.jsp');
    })
</script>
</body>
</html>


