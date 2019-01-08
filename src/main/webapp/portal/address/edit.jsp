<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../../commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑地址</title>
    <style>
        @import "${ctx}/assets/bootstrap/css/bootstrap.css";
        @import "${ctx}/assets/styles/global.css";
        .input-group,
        .form-check {
            margin-bottom: 20px;
        }
        #avatar {
            height: 20px;
        }
    </style>
</head>
<body>
<nav id="nav" class="navbar navbar-inverse"></nav>
<header class="jumbotron"></header>
<main class="container">

    <section class="col-md-2">
        <article>left</article>
    </section>
    <section class="col-md-10">
        <article>
            <h1 class="col-md-6 col-md-offset-2">编辑地址</h1>
            <form action="${ctx}/address/modify" method="post">
                <input type="hidden" name="id" value="${sessionScope.address.id}">
                <div id="address" class="input-group input-inline col-md-6 col-md-offset-2">
                    <label for="detail">所在地区</label>
                    <select id="province" class="form-control col-sm-3" name="province" title="${sessionScope.address.province}"></select>
                    <select id="city" class="form-control col-sm-3" name="city" title="${sessionScope.address.city}"></select>
                    <select id="area" class="form-control col-sm-3" name="area" title="${sessionScope.address.area}"></select>
                    <select id="town" class="form-control col-sm-3" name="town" title="${sessionScope.address.town}"></select>
                </div>
                <div class="input-group col-md-6 col-md-offset-2">
                    <label for="detail">详细地址</label>
                    <textarea id="detail" class="form-control" name="detail">${sessionScope.address.detail}</textarea>
                </div>
                <div class="input-group col-md-6 col-md-offset-2">
                    <label for="name">收货人姓名</label>
                    <input id="name" class="form-control" name="name" value="${sessionScope.address.name}"><br>
                </div>
                <div class="input-group col-md-6 col-md-offset-2">
                    <label for="mobile">联系方式</label>
                    <input id="mobile" class="form-control" name="mobile" value="${sessionScope.address.mobile}"><br>
                </div>
                <div class="form-check col-md-6 col-md-offset-2">
                  <%--  <c:choose>
                        <c:when test="${sessionScope.address.status eq 1}">
                            <input type="checkbox" class="form-check-input" id="status" name="status"  checked="checked" value="1">
                            <label class="form-check-label" for="status">设为默认地址</label>
                        </c:when>
                        <c:otherwise>
                            <input type="checkbox" class="form-check-input" id="status" name="status"  value="1">
                            <label class="form-check-label" for="status">设为默认地址</label>
                        </c:otherwise>
                    </c:choose>--%>
                    <c:if test="${sessionScope.address.status eq 1} ">
                        <input type="checkbox" class="form-check-input" id="status" name="status"  checked="checked" value="1">
                        <label class="form-check-label" for="status">设为默认地址</label>
                    </c:if>
                    <c:if test="${sessionScope.address.status eq 0} ">
                        <input type="checkbox" class="form-check-input" id="status" name="status" value="1">
                        <label class="form-check-label" for="status">设为默认地址</label>
                    </c:if>
                </div>
                <button class="btn btn-success btn-sm  col-md-6 col-md-offset-2" type="submit">保存</button>
            </form>
        </article>
    </section>
</main>
<footer class="jumbotron"></footer>
<script src="${ctx}/assets/scripts/jquery.min.js"></script>
<script src="${ctx}/assets/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/assets/scripts/global.js"></script>
<script src="${ctx}/assets/scripts/jquery.citys.js"></script>
<script type="text/javascript">
    var $town = $('#address select[name="town"]');
    var townFormat = function (info) {
        $town.hide().empty();
        if (info['code'] % 1e4 && info['code'] < 7e5) {	//是否为“区”且不是港澳台地区
            $.ajax({
                url: '${ctx}/assets/data/town/' + info['code'] + '.json',
                dataType: 'json',
                success: function (town) {
                    $town.show();
                    for (i in town) {
                        $town.append('<option value="' + town[i] + '">' + town[i] + '</option>');
                    }
                }
            });
        }
    };
    $('#address').citys({
        province:$('#province').attr('title'),
        city:$('#city').attr('title'),
        area:$('#area').attr('title'),
        town:$('#town').attr('title'),
        onChange: function (info) {
            townFormat(info);
        }
    }, function (api) {
        var info = api.getInfo();
        townFormat(info);
    });
</script>
</body>
</html>