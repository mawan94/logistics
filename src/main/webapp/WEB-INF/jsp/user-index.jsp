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


<table class="table table-striped">
    <caption>ORDER_LIST</caption>  <!--标题标签，居中显示，仅有一个标题-->
    <tr>
        <th>ID</th>
        <th>NICKNAME</th>
        <th>ACCOUNT</th>
        <th>EMAIL</th>
        <th>CUSTOMER_TYPE</th>
        <th>ACTION</th>
    </tr>
    <tr>
        <td>12345</td>  <!--td标签：普通表格，内容左对齐-->
        <td>2333</td>
        <td>sdjhbgns</td>
        <td>5153@qq.com</td>
        <td>CUSTOMER</td>
        <td>
            <button onclick="window.location = '/user-edit'" type="button" class="btn btn-default">EDIT</button>
        </td>

    </tr>
</table>

<div style="display: flex;align-items: center;justify-content: center;width: 100%">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>


</body>
</html>
