<%--
  Created by IntelliJ IDEA.
  User: joe
  Date: 2020/5/12
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>

<ol class="breadcrumb">
    <li><a href="/home">HOME</a></li>
    <li><a href="/user-index">INDEX</a></li>
    <li class="active">DETAIL</li>
</ol>

<form class="form-horizontal">

    <div class="form-group">
        <label for="nickname" class="col-sm-2 control-label">NICKNAME</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="nickname" placeholder="NICKNAME">
        </div>
    </div>

    <div class="form-group">
        <label for="email" class="col-sm-2 control-label">EMAIL</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="email" placeholder="EMAIL">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div onclick="handleEdit()" class="btn btn-default">EDIT</div>
        </div>
    </div>
</form>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

<script>
    $(function () {
        // INIT PARAM
        $("#nickname").val(getQueryVariable('nickname'))
        $("#email").val(getQueryVariable('email'))
    });

    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return (false);
    }

    function handleEdit() {
        var param = {}
        param.id = getQueryVariable('id')
        param.nickname = $("#nickname").val()
        param.email = $("#email").val()
        $.ajax({
            url: "http://localhost:8080/api/vi/customers/" + param.id,//ajax的请求地址
            type: "post",//请求方式
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify(param),
            async: false, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                console.log(data)
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });
    }

</script>

</body>
</html>
