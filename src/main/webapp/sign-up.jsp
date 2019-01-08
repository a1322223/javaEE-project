<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="commons/inc.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index page</title>
    <style>
        @import "assets/bootstrap/css/bootstrap.css";
        @import "assets/styles/global.css";
    </style>
</head>
<body>
<nav id="nav" class="index navbar navbar-inverse navbar-fixed-top"></nav>
<header class="index jumbotron"></header>
<main class="container">
    <section class="col-md-4 col-md-offset-4">
        <form action="${ctx}/user/signUp" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control">
                <span id="hint">${requestScope.message}</span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" class="form-control">
            </div>
            <button id="signUp" type="submit" class="btn btn-success btn-block">注册</button>
        </form>
    </section>
</main>
<footer class="index jumbotron"></footer>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/scripts/global.js"></script>
<script>
    $(function () {
        $('#email').on('blur', function () {
            var email = $(this).val();
            $.ajax({
                url: ${ctx}'/user/checkEmail',
                type: 'post',
                data: {'email': email},
                dataType: 'json',
                success: function (data) {
                    if (data.isEmailExisted) {
                        $('#hint').text("Email is existed.").css('color', '#900');
                        $('#signUp').prop('disabled', true);
                    } else {
                        $('#hint').text("Email is not existed.").css('color', '#090');
                        $('#signUp').prop('disabled', false);
                    }
                },
                error: function (a, b, c) {
                    console.log((a + ', ' + b + ', ' + c));
                }
            });
        });
    });
</script>
</body>
</html>
