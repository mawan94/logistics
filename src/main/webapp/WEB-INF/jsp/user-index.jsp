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


<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/home">HOME</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">CUSTOMER</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>


<table id="user-table" class="table table-striped">
    <caption>ORDER_LIST</caption>  <!--标题标签，居中显示，仅有一个标题-->
    <tr>
        <th>ID</th>
        <th>NICKNAME</th>
        <th>ACCOUNT</th>
        <th>EMAIL</th>
        <th>CUSTOMER_TYPE</th>
        <th>ACTION</th>
    </tr>

</table>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

<script>

    $(function () {
        <%-- LOAD DATA LIST --%>
        $.ajax({
            url: "http://localhost:8080/api/vi/customers?type=0",//ajax的请求地址
            type: "get",//请求方式
            async: true, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                var DOMStr = "";
                if (data && data.length) {
                    data.map(function (item) {
                        var itemDOMStr =
                            "<tr><td>" + item.id + "</td>" +
                            "<td>" + item.nickname + "</td>" +
                            "<td>" + item.account + "</td>" +
                            "<td>" + item.email + "</td>" +
                            "<td>" + (item.type == 1 ? 'ADMIN' : 'CUSTOMER') + "</td>" +
                            "<td>" +
                            "<button onclick='handle2Detail(" + JSON.stringify(item) + ")'  type='button' class='btn btn-default'>EDIT</button>" +
                            "</td></tr>";
                        DOMStr = DOMStr + itemDOMStr;
                    })
                }
                if (DOMStr) {
                    document.getElementById('user-table').innerHTML =
                        "<caption>ORDER_LIST</caption>  \n" +
                        "    <tr>\n" +
                        "        <th>ID</th>\n" +
                        "        <th>NICKNAME</th>\n" +
                        "        <th>ACCOUNT</th>\n" +
                        "        <th>EMAIL</th>\n" +
                        "        <th>CUSTOMER_TYPE</th>\n" +
                        "        <th>ACTION</th>\n" +
                        "    </tr>"
                        + DOMStr
                }
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });

    });

    function handle2Detail(item) {
        window.location = '/user-edit?id=' + item.id + "&nickname=" + item.nickname + "&email=" + item.email
    }

</script>

</body>
</html>
