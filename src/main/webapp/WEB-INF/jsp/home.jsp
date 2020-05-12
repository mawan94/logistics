<%--
  Created by IntelliJ IDEA.
  User: joe
  Date: 2020/5/12
  Time: 10:19 AM
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
<%--Hi JSP. 现在时间是 ${now}--%>


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
            <a class="navbar-brand" href="#">HOME</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/user-index" >USER</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>


<table class="table table-striped">
    <caption>ORDER_LIST</caption>  <!--标题标签，居中显示，仅有一个标题-->
    <tr>
        <th>ORDER_ID</th>
        <th>CUSTOMER_NAME</th>
        <th>CUSTOMER_EMAIL</th>
        <th>DELIVERY_PERSON</th>
        <th>ORDER_STATUS</th>
        <th>RATE</th>
        <th>REMARK</th>
    </tr>
    <tr>
        <td>8000</td>  <!--td标签：普通表格，内容左对齐-->
        <td>10000</td>
        <td>123@qq.com</td>
        <td>
            <div class="dropup">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                    Tom
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
        </td>
        <td>
            <div class="dropup">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu3" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                    SHIPPING
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
            </div>
        </td>
        <td>5</td>
        <td>THANK YOU</td>
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


<div class="page-header">
    <h1>Data Entry
        <small>Input order here</small>
    </h1>
</div>

<form class="form-horizontal">
    <%--<div class="form-group">--%>
    <%--<label for="inputEmail3" class="col-sm-2 control-label">Email</label>--%>
    <%--<div class="col-sm-10">--%>
    <%--<input type="email" class="form-control" id="inputEmail3" placeholder="Email">--%>
    <%--</div>--%>
    <%--</div>--%>

    <div class="form-group">
        <label class="col-sm-2 control-label">ORDER STATUS</label>
        <div class="col-sm-10">
            <select class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">CUSTOMER</label>
        <div class="col-sm-10">
            <select class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">DELIVERY PERSON</label>
        <div class="col-sm-10">
            <select class="form-control">
                <option>1</option>
                <option>2</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">SAVE</button>
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
