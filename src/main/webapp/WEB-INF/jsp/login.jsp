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
        <h2>欢迎回来</h2>
        <label>
            <span>用户名</span>
            <input id="account" type="text"/>
        </label>
        <label>
            <span>密码</span>
            <input id="pwd" type="password"/>
        </label>
        <button id="login" type="button" class="submit">登 录</button>
    </div>


    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>还未注册？</h2>
                <p>立即注册，发现大量机会！</p>
            </div>
            <div class="img__text m--in">
                <h2>已有帐号？</h2>
                <p>有帐号就登录吧，好久不见了！</p>
            </div>
            <div class="img__btn">
                <span class="m--up">注 册</span>
                <span class="m--in">登 录</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>立即注册</h2>
            <label>
                <span>用户名</span>
                <input id="account1" type="text"/>
            </label>
            <label>
                <span>邮箱</span>
                <input id="email1" type="email"/>
            </label>
            <label>
                <span>密码</span>
                <input id="pwd1" type="password"/>
            </label>
            <button id="register" type="button" class="submit">注 册</button>
        </div>
    </div>
</div>

<script src="/js/script.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script>


    $(function () {

        <%-- LOGIN --%>
        $("#login").click(function () {
            var account = $("#account").val();
            var pwd = $("#pwd").val();
            if (account && pwd) {
                alert(${pageContext.request})
                return;
                $.ajax({
                    url: "${pageContext.request.contextPath}/staff-login",//ajax的请求地址
                    type: "post",//请求方式
                    dataType: "json",//返回数据为json
                    data: $("#form").serialize(), //$("#loginForm").serialize() 序列化
                    async: true, //是否异步 true为异步,false为同步
                    success: function (data) { //异步成功回调
                        console.log(data);
                    },
                    error: function (msg) { //ajax失败回调
                        alert("ajax发送失败:" + msg);
                    }
                });
            }
        })

        <%-- REGISTER --%>
        $("#register").click(function () {
            var account = $("#account1").val();
            var pwd = $("#pwd1").val();
            var email = $("#email1").val();

            if (account && pwd && email)  {

            }
        })


        <%--$("#btn").click(function(){--%>
        <%--var $_login = $("#loginForm").get(0);--%>
        <%--var $_tip = $("#tip").get(0);--%>
        <%--/* --%>
        <%--*/--%>
        <%--var userName = $(".userName");--%>
        <%--var password = $(".password");--%>
        <%--var tip = "";--%>
        <%--if( $.trim( userName.val() ) == "" ){--%>
        <%--tip = "帐号不能为空";--%>
        <%--userName.focus();--%>
        <%--}else if( !/^\w{5,20}$/.test( userName.val() ) ){--%>
        <%--tip = "帐号长度必须5-20之间";--%>
        <%--userName.focus();--%>
        <%--}else if($.trim( password.val() ) == ""){--%>
        <%--tip = "密码不能为空";--%>
        <%--password.focus();--%>
        <%--}--%>
        <%--if(tip != ""){ //如果tip有值提示错误信息--%>
        <%--alert(tip);--%>
        <%--}else{ //发送ajax请求--%>
        <%--$.ajax({--%>
        <%--url:"${pageContext.request.contextPath}/loginAjax.action",//ajax的请求地址--%>
        <%--type:"post",//请求方式--%>
        <%--dataType:"json",//返回数据为json--%>
        <%--data:$("#form").serialize(), //$("#loginForm").serialize() 序列化--%>
        <%--async:true, //是否异步 true为异步,false为同步--%>
        <%--success:function(data){ //异步成功回调--%>
        <%--console.log(data);--%>
        <%--if(data.success == "1"){--%>
        <%--alert(data.tip);--%>
        <%--window.location = "${pageContext.request.contextPath}/index.action";--%>

        <%--}else if(data.success == "0"){--%>
        <%--antMove($_login,{top:60},1000,"elasticOut",function(){--%>
        <%--$(".tip").css("display","block");--%>
        <%--antMove($_tip,{top:0},1000,"elasticOut");});--%>
        <%--}--%>
        <%--},--%>
        <%--error:function(msg){ //ajax失败回调--%>
        <%--alert("ajax发送失败:"+msg);--%>
        <%--}--%>
        <%--});--%>
        <%--}--%>
        <%--});--%>
    });


</script>

</body>
</html>
