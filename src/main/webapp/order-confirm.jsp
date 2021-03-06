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
        .list-style{
            width: 500px;
            height: 100px;
            border: 1px solid #0f0f0f;
            cursor: pointer;
            margin-top: 20px;
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
                        <li><span>收货人：</span><span id="consignee">${sessionScope.address.name}</span></li>
                        <li><span>联系方式：</span><span id="mobilephone">${sessionScope.address.mobile}</span></li>
                        <li>
                            <span>收货地址：</span>
                            <span id="deliveryAddress">${sessionScope.address.province}${sessionScope.address.city}${sessionScope.address.area}${sessionScope.address.town}${sessionScope.address.detail}</span>
                        </li>
                    </ul>
                </div>
                <div class="col-md-2 address-right">
                    <p><a href="" style="margin-left: 10px;color: #69c;font-size: small" data-toggle="modal" data-target="#myModal"> 地址切换</a></p>
                    <button type="button" class="change-address"><a href="${ctx}/portal/address/add.jsp?isOrder=1"
                                                                    style="color: #000000;font-size: small;text-decoration: none">新建地址</a>
                    </button>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">选择地址</h4>
                                </div>
                                <div class="modal-body">
                                    <div id="list">



                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary change-address change" data-dismiss="modal">提交更改</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
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
        var addressId = 0;
        $.each($('.picture'), function (index, item) {
            var supId = $(this).attr('data-sup-id');
            var subId = $(this).attr('data-sub-id');
            var productId = $(this).attr('data-product-id');
            var coverPicture = $(this).attr('data-cover-picture');
            $(this).append('<img src="${img}cover_picture/' + supId + '/' + subId + '/' + productId + '/' + coverPicture + '"/>')
        });
        $.ajax({
            url:'${ctx}/address/queryAllList',
            type:'post',
            dataType:'json',
            success:function (data) {
                $.each(data,function (i,address) {
                    var id = address.id;
                    var name = address.name;
                    var mobile = address.mobile;
                    var detailAddress = address.province+address.city+address.area+address.town+address.detail;
                    $('#list').append('<div id="'+id+'" class="list-style changeAddress">' +
                        '<ul>' +
                        '<li><span>收货人：</span>' +name+ '</li>' +
                        '<li><span>联系方式：</span>' +mobile+ '</li>' +
                        '<li><span>收货地址：</span>' +detailAddress+ '</li>'+
                        '</ul>' +
                        '</div>');
                })
            }
        });
        $(document).on('click', '.changeAddress', function () {
            addressId = $(this).attr('id');
            $('#'+addressId).css("background", "");
            $(this).css("background", "#4444");


        });
        $(document).on('click', '.change', function () {
            $.ajax({
                url:'${ctx}/address/queryById/'+addressId,
                type:'post',
                dataType:'json',
                success:function (data) {
                    $('#consignee').text(data.name);
                    $('#mobilephone').text(data.mobile);
                    $('#deliveryAddress').text(data.province+data.city+data.area+data.town+data.detail);
                }
            });
        });
        $(document).on('click', '#pay', function () {
            var outTradeNo = addressId+123;
            var subject = '商品支付';
            var totalAmount = "${totalPrice - totalDiscount}";
            window.location.href = '/trade_precreate.jsp?outTradeNo='+outTradeNo+'&subject="'+subject+'"&totalAmount='+totalAmount;
        });
        $(document).on('click', '#pay', function () {
            var payMoney = ${totalPrice - totalDiscount};
            window.location.href = '/pay.jsp?payMoney='+payMoney;
        });
    });

</script>
</body>
</html>
