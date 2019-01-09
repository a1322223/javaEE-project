<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp" %>
<c:set var="lists" value="[3413004,3413005,1636009,3406013,1110003]"/>
<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->

    <div class="carousel-inner">
        <div class="item active">
            <a href="${ctx}/category.jsp?supId=1005000&subId=0">
                <img src="avatar/1.jpg" alt="First slide"></a>
        </div>
        <div class="item">
            <a href="${ctx}/category.jsp?supId=1008000&subId=0">
                <img src="avatar/2.jpg" alt="Second slide"></a>
        </div>
        <div class="item">
            <a href="${ctx}/category.jsp?supId=1043000&subId=0">
                <img src="avatar/3.jpg" alt="Third slide"></a>
        </div>
        <div class="item">
            <a href="${ctx}/category.jsp?supId=1005002&subId=0">
                <img src="avatar/4.jpg" alt="fourth slide"></a>
        </div>
    </div>


    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<script>
    $(function () {
        $.ajax({
            url: '${ctx}/product/queryProductByList',
            type: 'post',
            data: {lists:${lists}},
            dataType: 'json',
            success: function (data) {
                console.log(data);
            }

        });
    })
</script>




