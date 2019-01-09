<%--
  Created by IntelliJ IDEA.
  User: guoyan
  Date: 2018/10/31
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";

        .panel {
            background: #f5f5f5;
            margin-left: 21px;
            font-size: small;
        }

        .address-left {
            margin-left: 20px;
            margin-top: 20px;
            margin-bottom: 20px;
            display: block;
        }

        .address-right {
            display: block;
            float: left;
            margin: 50px 20px 20px 60px;
        }

        .address-right a {

        }

        .button {
            width: 60px;
            margin-left: 20px;
            background-color: #f5f5f5;
            border: 1px solid #c0ae8a;
        }

        .button:hover {
            background-color: #fff;
        }

        ul {
            margin-top: 20px;
        }

        ul li {
            list-style-type: none;
            margin-bottom: 5px;
        }

        ul li span {
            color: #999;

        }

        .change-address {
            width: 80px;
        }

        td img {
            height: 80px;
        }

        .tr-top th {
            text-align: center;
        }

        .tr-data {
            text-align: center;
        }

        #pay {
            background: #b4a078;
            color: #fff;
            cursor: pointer;
            height: 50px;
            text-align: center;
        }

        .tr-bottom {
            line-height: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">

    <table class="table table-bordered">
        <tr>
            <th class="panel">收货信息</th>
        </tr>
        <tr>
            <th>
                <div class="col-md-8 address-left">
                    <c:if test="${sessionScope.address.status eq 1}">
                        默认地址
                    </c:if>
                    <button type="button" class="button"><a href="${ctx}/address/queryById/${sessionScope.address.id}/1"
                                                            style="color: #000000;font-size: small;text-decoration: none">修改</a>
                    </button>
                    <br>
                    <ul>
                        <li><span>收货人：</span>${sessionScope.address.name}</li>
                        <li><span>联系方式：</span>${sessionScope.address.mobile}</li>
                        <li>
                            <span>收货地址：</span>${sessionScope.address.province}${sessionScope.address.city}${sessionScope.address.area}${sessionScope.address.town}${sessionScope.address.detail}
                        </li>
                    </ul>
                </div>
                <div class="col-md-2 address-right">
                    <p><a href="" style="margin-left: 10px;color: #69c;font-size: small"> 地址切换</a></p>
                    <button type="button" class="change-address"><a href="${ctx}/portal/address/add.jsp?isOrder=1"
                                                                    style="color: #000000;font-size: small;text-decoration: none">新建地址</a>
                    </button>
                </div>
            </th>
        </tr>
    </table>
    <table class="table ">
        <tr class="tr-top">
            <th width="35%" colspan="2" class="panel">商品信息</th>
            <th width="15%" class="panel">单价</th>
            <th width="15%" class="panel">数量</th>
            <th width="15%" class="panel">小计</th>
            <th width="20%" class="panel">实付</th>
        </tr>
        <c:forEach var="product" items="${sessionScope.list}">
            <tr class="tr-data">
                <td width="15%" class="picture text-center"
                    data-sup-id="${product.category.categoryId}"
                    data-sub-id="${product.category.id}"
                    data-product-id="${product.productId}"
                    data-cover-picture='${product.coverPicture}'>
                </td>
                <td width="20%"><h4><a style="font-size: small"
                                       href="${ctx}/product/detail/${product.id}">${product.title}</a></h4></td>
                <td width="15%">
                    <span><fmt:formatNumber value="${product.price}" type="currency"/></span>
                    <s><span><fmt:formatNumber value="${product.originPrice}" type="currency"/></span></s>
                </td>
                <td class="text-center" width="15%">${product.cart.number}</td>
                <td class="text-center" width="15%">
                    <fmt:formatNumber value="${product.price * product.cart.number}" type="currency"/>
                </td>
                <td class="text-center" width="20%">
                    <fmt:formatNumber value="${product.price * product.cart.number}" type="currency"/>
                </td>
            </tr>
            <c:set var="totalPrice" value="${totalPrice + product.originPrice * product.cart.number}"/>
            <c:set var="totalDiscount"
                   value="${totalDiscount + (product.originPrice - product.price) * product.cart.number}"/>
        </c:forEach>
        <tr class="tr-bottom">
            <th width="40%" class="panel"></th>
            <th class="panel" width="10%">
                商品合计 : <span id="total-price"><fmt:formatNumber value="${totalPrice}" type="currency"/></span>
            </th>
            <th class="panel" width="20%">
                活动优惠 : <span id="total-discount">-<fmt:formatNumber value="${totalDiscount}" type="currency"/></span>
            </th>
            <th width="30%" class="panel">
                应付总额 ：<span><fmt:formatNumber value="${totalPrice - totalDiscount}" type="currency"/></span>
            </th>
            <th id="pay" width="35%" colspan="2">去付款</th>
        </tr>

    </table>
</main>
<footer class="jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script>
    $(function () {
        $.each($('.picture'), function (index, item) {
            var supId = $(this).attr('data-sup-id');
            var subId = $(this).attr('data-sub-id');
            var productId = $(this).attr('data-product-id');
            var coverPicture = $(this).attr('data-cover-picture');
            $(this).append('<img src="${img}cover_picture/' + supId + '/' + subId + '/' + productId + '/' + coverPicture + '"/>')
        });
    });
</script>
</body>
</html>
