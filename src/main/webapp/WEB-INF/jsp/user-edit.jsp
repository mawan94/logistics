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
        <label for="inputEmail3" class="col-sm-2 control-label">NICKNAME</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail3" placeholder="NICKNAME">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail5" class="col-sm-2 control-label">ACCOUNT</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail5" placeholder="ACCOUNT">
        </div>
    </div>

    <div class="form-group">
        <label for="inputEmail5" class="col-sm-2 control-label">EMAIL</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="inputEmail25" placeholder="EMAIL">
        </div>
    </div>



    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">EDIT</button>
        </div>
    </div>
</form>


<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
