<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../../commons/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加地址</title>
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
            <h1 class="col-md-6 col-md-offset-2">添加地址</h1>
            <form action="${ctx}/address/create?isOrder=${param.isOrder}" method="post">
                <div id="address" class="input-group input-inline col-md-6 col-md-offset-2">
                    <label for="detail">所在地区</label>
                    <select id="province" class="form-control col-sm-3" name="province"></select>
                    <select id="city" class="form-control col-sm-3" name="city"></select>
                    <select id="area" class="form-control col-sm-3" name="area"></select>
                    <select id="town" class="form-control col-sm-3" name="town"></select>
                </div>
                <div class="input-group col-md-6 col-md-offset-2">
                    <label for="detail">详细地址</label>
                    <textarea id="detail" class="form-control" name="detail">xxx小区1号楼1单元1101</textarea>
                </div>
                <div class="input-group col-md-6 col-md-offset-2">
                    <label for="name">收货人姓名</label>
                    <input id="name" class="form-control" name="name"><br>
                </div>
                <div class="input-group col-md-6 col-md-offset-2">
                    <label for="mobile">联系方式</label>
                    <input id="mobile" class="form-control" name="mobile" value="18666666666"><br>
                </div>
                <div class="form-check col-md-6 col-md-offset-2">

                    <input type="checkbox" class="form-check-input" id="status" name="status" value="1" checked="checked">
                    <label class="form-check-label" for="status">设为默认地址</label>
                </div>
                <button class="btn btn-success btn-sm  col-md-6 col-md-offset-2" type="submit">添加地址</button>
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
        // province:'--',
        // city:'--',
        // area:'--',
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