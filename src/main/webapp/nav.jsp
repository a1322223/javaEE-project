<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="commons/inc.jsp" %>
<style>
    .badge {
        position: absolute;
        top: 5px;
        right: 2px;
        background: #f00;
        color: #fff;
    }

    .dropdown-menu {
        width: 190px !important;
        /*height: 400px !important;*/
    }

    .nav ul {
        padding-top: 9px;
    }

    .nav ul li a {
        display: inline-block;
        width: 150px;
    }

    .nav ul li:first-of-type a {
        width: 100%;
        text-align: center;
        color: #2aabd2;
    }

    .nav ul li img {
        width: 30px;
        display: inline-block;
        margin-left: 8px;
    }
    .avatar{
        height: 20px;
    }

    .navbar-inverse {
        background-color: #d9edf7;
        border-color: #fdf8f8;
    }
</style>
<div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand active" href="/">首页</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <%--<li class="dropdown">--%>
            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"--%>
            <%--aria-expanded="false">${sup.title} <span class="caret"></span></a>--%>
            <%--<ul class="dropdown-menu">--%>
            <%--<li><a href="#">${sub.title}</a></li>--%>
            <%--&lt;%&ndash;<li role="separator" class="divider"></li>&ndash;%&gt;--%>
            <%--</ul>--%>
            <%--</li>--%>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <form class="navbar-form navbar-left" action="/product/find">
                <div class="form-group">
                    <input type="text" class="form-control" name="likeName" placeholder="女式运动上装">
                </div>
                <button type="submit" class="btn btn-default">搜！</button>
            </form>
            <%-- todo --%>
            <c:if test="${sessionScope.user eq null}">
                <li><a href="${ctx}/sign-up.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="${ctx}/sign-in.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </c:if>
            <c:if test="${sessionScope.user ne null}">
                <li>
                    <a href="${ctx}/cart/queryAll">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span id="cart-number" class="badge">${sessionScope.cartNumber}</span>
                    </a>
                </li>
                <li><a class="pop" href="#" data-toggle="popover" data-container="body" data-trigger="hover"
                       data-placement="bottom" title="Header..."
                       data-content="<p><a href=&quot;/address/queryAll&quot;>个人信息</a></p><p><a href=&quot;/user/signOut&quot;>退出</a></p>">
                    <img id="avatar" class="avatar img-circle"
                         src="${ctx}/avatar/${sessionScope.user.userInfo.avatar}"> ${sessionScope.user.email}</a></li>
            </c:if>
        </ul>
    </div>
</div>
<script>
    $(function () {
        $(".pop").popover({trigger: "manual", html: true, animation: false})
            .on("mouseenter", function () {
                var _this = this;
                $(this).popover("show");
                $(".popover").on("mouseleave", function () {
                    $(_this).popover('hide');
                });
            }).on("mouseleave", function () {
            var _this = this;
            setTimeout(function () {
                if (!$(".popover:hover").length) {
                    $(_this).popover("hide");
                }
            }, 300);
        });

        $.ajax({
            url: '${ctx}/cart/queryCartNumber',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                $('#cart-number').text(data.cartNumber);

                $.each(data.categories, function (index, sup) {
                    $('.nav:first').append('<li id="sup-' + sup.id + '" class="dropdown">');
                    var supList = $('#sup-' + sup.id);
                    supList.append('<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"\n' +
                        '                   aria-expanded="false">' + sup.title + ' <span class="caret"></span></a>');
                    supList.append('<ul id="ul-' + sup.id + '" class="dropdown-menu">');
                    var subList = $('#ul-' + sup.id);
                    subList.append('<li><a href="${ctx}/category.jsp?supId=' + sup.id + '&subId=0" target="_blank">' + sup.title + '</a></li>');
                    subList.append('<li role="separator" class="divider"></li>');
                    subList.append('');
                    $.each(sup.categories, function (index, sub) {
                        $('#ul-' + sup.id).append('<li><img src="${img}category_icons/' + sub.icon + '"><a href="${ctx}/category.jsp?supId=' + sup.id + '&subId=' + sub.id + '" target=""_blank>' + sub.title + '</a></li>')
                    });
                })
            }
        });
    });
</script>