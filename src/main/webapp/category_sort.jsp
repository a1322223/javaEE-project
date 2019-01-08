<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <title>类别</title>
    <%--<link rel="stylesheet" type="text/css" href="extract/bootstrap3/css/bootstrap.min.css"/>--%>
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

<main class="container">
    <ul class="breadcrumb cate-product-wrapper row container">
        <li>排序:</li>
        <li><a role="button" id="sortDefault" href="category.jsp?supId=${param.supId}&subId=${param.subId}">默认</a></li>
        <li><a role="button" id="sortBy" onclick="changeSort()">价格 ↑</a></li>
        <!-- <li class="active">十一月</li> -->
    </ul>
</main>
<main class="container-fluid">
    <br>
    <div id="data">

    </div>
</main>
<footer class="jumbotron"></footer>

<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>

<%--<script src="extract/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>--%>
<script>
    sort = -1;
    productArraySortList = []

    $(function () {
        supId = ${param.supId};
        subId = ${param.subId};
        productArrayList = []
        $.ajax({
            // url: '/market_test1/temp/test1.json',
            url: '${ctx}/category/list/' + supId,
            type: 'get',
            dataType: 'json',
            success: function (data) {

                console.log(data)
                var supId = data.id;
                // $('title').text(data.title);
                $('#data').append('<div id="productList" class="cate-product-wrapper row container">');

                $.each(data.categories, function (index, c) {
                    // 2. product
                    $.each(c.products, function (index, p) {
                        p.coverPicture = supId + '/' + c.id + '/' + p.productId + '/' + p.coverPicture
                        productArrayList.push(p)
                    })
                });

                productArraySortList = [];

                for (var i = productArrayList.length-1; i >0 ;i--){
                    index = i;
                    for (var j =productArrayList.length -2; j >= 0; j--) {
                        if(productArrayList[j]["price"]<productArrayList[index]["price"]){
                            index = j
                        }
                    }
                    productArraySortList.push(productArrayList[index]);

                    productArrayList.splice(index, 1);
                }

                console.log('after', productArraySortList);
                htmlContent()
            },
            complete: function (data) {
                // console.log(data)
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

    function changeSort(){
        sort = - sort;
        htmlContent();
    }

    function htmlContent(){
        // alert("list : "+productArraySortList.length+", sort:"+sort)
        $('#productList').html("");
        l = productArraySortList;
        if(sort >0 ){
            $("#sortBy").html("价格 ↓")
            for (i=l.length - 1; i >= 0 ; i--) {
                addHtml(l[i])
            }
        }else{
            $("#sortBy").html("价格 ↑")
            for (i=0;  i< l.length; i++) {
                addHtml(l[i])
            }
        }
    }


    function addHtml(p){
        var productArr = [
            '<section id="' + p.id + '" class="col-md-3"><article><img class="video" src="http://10.2.29.119:81/static/assets/images/video.svg"></article>',
            '<p class="t"></p><p class="p"><b></b><s></s></p><hr><p class="d"></p></section>'
        ];

        $('#productList').append(productArr.join(''));

        var section = $('#' + p.id);
        section.find('article').css('background-image', 'url(http://10.2.29.119:81/static/' + 'cover_picture/' + p.coverPicture + ')');
        section.find('p.t').attr('title', p.title);
        section.find('p.t').text(p.title);
        section.find('p.p b').text(p.price);
        section.find('p.p s').text(p.originPrice);
        section.find('p.d').text(p.desc);
        if (p.mp4 === null && p.webm === null) {
            section.find('img').hide();
        }
    }
</script>
</body>
</html>
