<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <title>类别</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";

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
        p.p,
        p.d {
            text-align: center;
            width: 100%;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        p.d {
            color: #999;
        }

        article,
        p.t {
            cursor: pointer;
            background-size: contain;
        }

        .cate-product-wrapper {
            margin: auto;
        }

        .cate-bar h1,
        .cate-bar p {
            text-align: center;
        }

        .cate-bar h1 {
            font-size: 24px;
            font-weight: bolder;
        }

        .cate-bar p {
            color: #999;
            font-size: 14px;
            margin-bottom: 20px;
        }

        section hr {
            width: 60%;
            margin: 10px auto;
        }

        .video {
            position: absolute;
            top: 190px;
            left: 20px;
            cursor: pointer;
            width: 60px;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse navbar-fixed-top"></nav>
<header class="jumbotron"></header>
<main class="container-fluid">
    <%--<div class="cate-product-wrapper row container">--%>
    <%--<div class="cate-bar col-md-12">--%>
    <%--<h1>居家</h1>--%>
    <%--<p>asdf...</p>--%>
    <%--</div>--%>
    <%--<section class="col-md-3">--%>
    <%--<article--%>
    <%--style="background-image: url(http://localhost:81/static/slide_pictures/1005000/1008002/1522005/67002f942a34488893335529fe9c926e.png);">--%>
    <%--</article>--%>
    <%--<img id="play" src="${ctx}/assets/images/play.svg">--%>
    <%--<p class="t" title="韩国制造 14k金除氯增压花洒">韩国制造 14k金除氯增压花洒</p>--%>
    <%--<p class="p"><b>239</b><s>299</s></p>--%>
    <%--<hr>--%>
    <%--<p class="d">asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf...</p>--%>
    <%--</section>--%>
    <%--</div>--%>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script>
    $(function () {
        supId = ${param.supId};
        subId = ${param.subId};
        $.ajax({
            url: '${ctx}/category/list/' + supId,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var supId = data.id;
                $('title').text(data.title);
                $.each(data.categories, function (index, c) {
                    $('main').append('<div id="wrapper-' + c.id + '" class="cate-product-wrapper row container">');

                    // 1. cate
                    var cateArr = [
                        '<div id="' + c.id + '" class="cate-bar col-md-12"><h1></h1><p></p>'
                    ];

                    $('#wrapper-' + c.id).append(cateArr.join(''));

                    var cateBar = $('#' + c.id);
                    cateBar.find('h1').text(c.title).attr('id', c.id);
                    cateBar.find('p').text(c.desc);

                    // 2. product
                    $.each(c.products, function (index, p) {
                        var productArr = [
                            '<section id="' + p.id + '" class="col-md-3"><article><img class="video" src="${ctx}/assets/images/video.svg"></article>',
                            '<p class="t"></p><p class="p"><b></b><s></s></p><hr><p class="d"></p></section>'
                        ];

                        $('#wrapper-' + c.id).append(productArr.join(''));

                        var section = $('#' + p.id);
                        section.find('article').css('background-image', 'url(${img}' + 'cover_picture/' + supId + '/' + c.id + '/' + p.productId + '/' + p.coverPicture + ')');
                        section.find('p.t').attr('title', p.title);
                        section.find('p.t').text(p.title);
                        section.find('p.p b').text(p.price);
                        section.find('p.p s').text(p.originPrice);
                        section.find('p.d').text(p.desc);
                        if (p.mp4 === null && p.webm === null) {
                            section.find('img').hide();
                        }
                    })
                });
            },
            complete: function () {
                if (subId !== 0) {
                    $('html, body').animate({
                        scrollTop: $('#' + ${param.subId}).offset() - 80
                    }, 0);
                }
            }
        });

        $(document).on('click', 'article, p.t', function () {
            var id = $(this).parent('section').attr('id');
            window.open(
                '${ctx}/product/detail/' + id,
                '_blank'
            );
        });
    });
</script>
</body>
</html>
