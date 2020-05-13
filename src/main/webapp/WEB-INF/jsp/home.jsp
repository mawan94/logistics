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
                <li><a href="/user-index">USER</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>


<table class="table table-striped" id="data-list"></table>


<div style="display: flex;align-items: center;justify-content: center;width: 100%">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="page-bar">
        </ul>
    </nav>
</div>


<div class="page-header">
    <h1>Data Entry
        <small>Input order here</small>
    </h1>
</div>

<form class="form-horizontal">

    <div class="form-group">
        <label for="sender" class="col-sm-2 control-label">SENDER</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="sender" placeholder="SENDER">
        </div>
    </div>

    <div class="form-group">
        <label for="recipient" class="col-sm-2 control-label">RECIPIENT</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="recipient" placeholder="RECIPIENT">
        </div>
    </div>

    <div class="form-group">
        <label for="recipientPhone" class="col-sm-2 control-label">RECIPIENT_PHONE</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="recipientPhone" placeholder="RECIPIENT_PHONE">
        </div>
    </div>

    <div class="form-group">
        <label for="recipientAddress" class="col-sm-2 control-label">RECIPIENT_ADDRESS</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="recipientAddress" placeholder="RECIPIENT_ADDRESS">
        </div>
    </div>

    <div class="form-group">
        <label for="courierFee" class="col-sm-2 control-label">COURIER_FEE(CNY)</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="courierFee" placeholder="COURIER_FEE">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">ORDER STATUS</label>
        <div class="col-sm-10">
            <select class="form-control" id="status">
                <option value="1">WAIT_FOR_DELIVERY</option>
                <option value="2">SHIPPING</option>
                <option value="3">ARRIVED</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">DELIVERY PERSON</label>
        <div class="col-sm-10">
            <select class="form-control" id="deliveryPerson">
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div onclick="handleInsertData()" class="btn btn-default">SAVE</div>
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
        handleLoadPageData(0);
        handleLoadAdminUser()
    });

    function handleLoadAdminUser() {
        $.ajax({
            url: "http://localhost:8080/api/vi/customers?type=1",//ajax的请求地址
            type: "get",//请求方式
            async: true, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                var DOMStr = "";
                if (data) {
                    data.map(function (item) {
                        DOMStr = DOMStr + "<option value='" + item.id + "'>" + item.nickname + "</option>"
                    });
                    $('#deliveryPerson').html(DOMStr)
                }
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });
    }

    function handleLoadPageData(page) {
        var pageSize = 10
        $.ajax({
            url: "http://localhost:8080/api/v1/orders/page?page=" + page + "&size=" + pageSize,//ajax的请求地址
            type: "get",//请求方式
            async: true, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                var totalPage = data.totalPages;
                var content = data.content;
                resetPageBar(page, totalPage)
                resetPageList(page, content)
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });
    }


    function resetPageBar(current, totalPage) {
        var pageBarDOM = "";
        for (var i = 0; i < totalPage; i++) {
            if (current == i) {
                pageBarDOM = pageBarDOM + "<li class='active' >" +
                    "<a onclick='handleLoadPageData(" + i + ")'>" + (i + 1) + "</a>" +
                    "</li>"
            } else {
                pageBarDOM = pageBarDOM + "<li>" +
                    "<a onclick='handleLoadPageData(" + i + ")'>" + (i + 1) + "</a>" +
                    "</li>"
            }
        }
        $("#page-bar").html(pageBarDOM)
    }

    function changeOrderStatus(order) {
        console.log(order)
        // TODO MODIFY ORDER STATUS
    }

    function resetPageList(page, content) {
        var pageListDOM = "";
        content.map(function (item) {
            pageListDOM = pageListDOM + "<tr>\n" +
                "        <td>" + item.orderId + "</td>\n" +
                "        <td>" + item.sender + "</td>\n" +
                "        <td>" + item.deliveryPerson + "</td>\n" +
                "        <td>" + item.recipient + "</td>\n" +
                "        <td>" + item.recipientPhone + "</td>\n" +
                "        <td>" + item.recipientAddress + "</td>\n" +
                "        <td>\n" +
                "            <div class=\"dropup\">\n" +
                "                <button class=\"btn btn-default dropdown-toggle\" type=\"button\" id=\"dropdownMenu3\" data-toggle=\"dropdown\"\n" +
                "                        aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                (item.orderStatus == 1 ? 'WAIT_FOR_DELIVERY' : item.orderStatus == 2 ? 'SHIPPING' : 'ARRIVED') +
                "                    <span class=\"caret\"></span>\n" +
                "                </button>\n" +
                "                <ul class=\"dropdown-menu\" aria-labelledby=\"dropdownMenu2\">\n" +
                "                    <li><a onclick='changeOrderStatus( " + JSON.stringify({
                    page: page,
                    orderId: item.orderId,
                    orderStatus: 1
                }) + " )'>WAIT_FOR_DELIVERY</a></li>\n" +
                "                    <li><a onclick='changeOrderStatus( " + JSON.stringify({
                    page: page,
                    orderId: item.orderId,
                    orderStatus: 2
                }) + " )'>SHIPPING</a></li>\n" +
                "                    <li><a onclick='changeOrderStatus( " + JSON.stringify({
                    page: page,
                    orderId: item.orderId,
                    orderStatus: 3
                }) + " )'>ARRIVED</a></li>\n" +
                "                </ul>\n" +
                "            </div>\n" +
                "        </td>\n" +
                "        <td>" + item.courierFee + "</td>\n" +
                "        <td>" + (item.rate ? item.rate + '✨' : '') + "</td>\n" +
                "        <td>" + (item.remark ? item.remark : '') + "</td>\n" +
                "    </tr>"
        })

        $('#data-list').html(
            "<caption>ORDER_LIST</caption>   \n" +
            "    <tr>\n" +
            "        <th>ORDER_ID</th>\n" +
            "        <th>SENDER</th>\n" +
            "        <th>DELIVERY_PERSON</th>\n" +
            "        <th>RECIPIENT</th>\n" +
            "        <th>RECIPIENT_PHONE</th>\n" +
            "        <th>RECIPIENT_ADDRESS</th>\n" +
            "        <th>ORDER_STATUS</th>\n" +
            "        <th>COURIER_FEE</th>\n" +
            "        <th>RATE</th>\n" +
            "        <th>REMARK</th>\n" +
            "    </tr>" + pageListDOM
        )
    }

    function handleInsertData() {
        var param = {}
        param.sender = $('#sender').val();
        param.recipient = $('#recipient').val();
        param.recipientPhone = $('#recipientPhone').val();
        param.recipientAddress = $('#recipientAddress').val();
        param.courierFee = $('#courierFee').val();
        param.status = $('#status').val();
        param.deliveryPerson = $('#deliveryPerson').val();
        console.log(param)

        for (k in param) {
            if (!param[k]) {
                alert('请完善表单字段')
                return;
            }
        }

        $.ajax({
            url: "http://localhost:8080/api/v1/orders",//ajax的请求地址
            type: "post",//请求方式
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify(param),
            async: false, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                console.log(data)
                clearInsertForm()
                handleLoadPageData()
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });
    }

    function clearInsertForm() {
        $('#sender').val('');
        $('#recipient').val('');
        $('#recipientPhone').val('');
        $('#recipientAddress').val('');
        $('#courierFee').val('');
        $('#status').val('');
        $('#deliveryPerson').val('');
    }
</script>
</body>
</html>
