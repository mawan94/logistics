<%--
  Created by IntelliJ IDEA.
  User: joe
  Date: 2020/5/12
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOGIN/REGISTER</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="content">

    <div class="form sign-in">
        <h2>WELCOME BACK</h2>
        <label>
            <span>Account</span>
            <input id="account" type="text"/>
        </label>
        <label>
            <span>Password</span>
            <input id="pwd" type="password"/>
        </label>
        <button id="login" onclick="handleLogin()" type="button" class="submit">Sign in</button>
    </div>


    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>Not registered yet？</h2>
                <p>Sign up now and discover plenty of opportunities！</p>
            </div>
            <div class="img__text m--in">
                <h2>Existing account？</h2>
                <p>Log in if you have an account, long time no see！</p>
            </div>
            <div class="img__btn">
                <span class="m--up">Sign up</span>
                <span class="m--in">Sign in</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>Sign up now</h2>
            <label>
                <span>Account</span>
                <input id="account1" type="text"/>
            </label>
            <label>
                <span>Email</span>
                <input id="email1" type="email"/>
            </label>
            <label>
                <span>Password</span>
                <input id="pwd1" type="password"/>
            </label>
            <label>
                <span>Nickname</span>
                <input id="nickname" type="password"/>
            </label>
            <button id="register" type="button" onclick="handleRegister()" class="submit">Sign up</button>
        </div>
    </div>
</div>

<script src="/js/script.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>


    $(function () {

    });

    function handleLogin() {
        var param = {}

        param.account = $("#account").val();
        param.pwd = $("#pwd").val();
        if (param.account && param.pwd) {


            $.ajax({
                url: "http://localhost:8080/api/vi/customers/login",//ajax的请求地址
                type: "post",//请求方式
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify(param),
                async: false, //是否异步 true为异步,false为同步
                success: function (data) { //异步成功回调
                    if (data) {
                        window.location = '/home'
                    } else {
                        alert('用户名/密码错误')
                    }
                },
                error: function (msg) { //ajax失败回调
                    alert("ajax发送失败:" + msg);
                }
            });
        }
    }

    function handleRegister() {
        // $("#register").click(function () {
        var param = {}
        param.account = $("#account1").val();
        param.pwd = $("#pwd1").val();
        param.email = $("#email1").val();
        param.nickname = $("#nickname").val();
        param.type = 1;

        for (k in param) {
            if (!param[k]) {
                return
            }
        }

        $.ajax({
            url: "http://localhost:8080/api/vi/customers",//ajax的请求地址
            type: "post",//请求方式
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify(param),
            async: false, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                window.location = '/home'
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });
        // })
    }


</script>

</body>
</html>
