<%--
  Created by IntelliJ IDEA.
  User: joe
  Date: 2020/5/13
  Time: 4:30 PM
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

<div class="jumbotron">
    <h2>Enter the ID to query logistics information</h2>
    <p>
    <div class="input-group input-group-lg" style="padding: 0 50px;width: 100%">
        <input id="order-id" type="text" class="form-control" placeholder="order id" aria-describedby="sizing-addon1">
    </div>
    </p>
    <p>
    <div style="display: flex;justify-content: center;align-items: center">
        <a class="btn btn-primary btn-lg" onclick="handleFindOrderId()" role="button">Search</a>
    </div>
    </p>
</div>


<table class="table" id="tab"></table>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Modal</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">RATE</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="rate">
                                <option value="1">✨</option>
                                <option value="2">✨✨</option>
                                <option value="3">✨✨✨</option>
                                <option value="4">✨✨✨✨</option>
                                <option value="5">✨✨✨✨✨</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">REMARK</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="remark" placeholder="REMARK">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" onclick="ratingAndRemark()" class="btn btn-primary" data-dismiss="modal">Save
                    changes
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
<script>
    var enableOrderId = "" // 当前的orderId
    var currentRate = "" //
    var currentRemark = "" //

    function handleFindOrderId() {
        enableOrderId = ""
        currentRate = ""
        currentRemark = ""

        var orderId = $('#order-id').val();
        if (orderId) {
            $.ajax({
                url: "http://localhost:8080/api/v1/orders/" + orderId,//ajax的请求地址
                type: "get",//请求方式
                async: true, //是否异步 true为异步,false为同步
                success: function (data) { //异步成功回调
                    console.log(data)
                    if (data) {
                        enableOrderId = data.orderId
                        currentRate = data.rate
                        currentRemark = data.remark
                        $('#rate').val(currentRate)
                        $('#remark').val(currentRemark)
                        // 拼接DOM
                        setData(data)
                    } else {
                        $('#data-tab').html('')
                        enableOrderId = ""
                        currentRate = ""
                        currentRemark = ""
                        $('#rate').val('')
                        $('#remark').val('')
                    }

                },
                error: function (msg) { //ajax失败回调
                    // alert("ajax发送失败:" + msg);
                }
            });
        }

    }

    function ratingAndRemark() {
        var param = {}
        param.rate = $('#rate').val()
        param.remark = $('#remark').val()
        param.orderId = enableOrderId

        $.ajax({
            url: "http://localhost:8080/api/v1/feedback/" + param.orderId,//ajax的请求地址
            type: "post",//请求方式
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify(param),
            async: false, //是否异步 true为异步,false为同步
            success: function (data) { //异步成功回调
                $('#order-id').val(enableOrderId)
                handleFindOrderId()
            },
            error: function (msg) { //ajax失败回调
                alert("ajax发送失败:" + msg);
            }
        });
    }

    function setData(data) {
        var dataDOM = "<tr>\n" +
            "        <td>" + data.orderId + "</td>\n" +
            "        <td>" + data.sender + "</td>\n" +
            "        <td>" + data.deliveryPerson + "</td>\n" +
            "        <td>" + data.recipient + "</td>\n" +
            "        <td>" + data.recipientPhone + "</td>\n" +
            "        <td>" + data.recipientAddress + "</td>\n" +
            "        <td>" + (data.orderStatus == 1 ? 'WAIT_FOR_DELIVERY' : data.orderStatus == 2 ? 'SHIPPING' : 'ARRIVED') + "</td>\n" +
            "        <td>" + data.courierFee + "</td>\n" +
            "<td>\n" +
            "            <button type=\"button\" class=\"btn btn-primary btn-lg\" data-toggle=\"modal\" data-target=\"#myModal\">\n" +
            "                Rate\n" +
            "            </button>\n" +
            "        </td>" +
            "    </tr>"

        $('#tab').html("<tr>\n" +
            "        <th>ORDER_ID</th>\n" +
            "        <th>SENDER</th>\n" +
            "        <th>DELIVERY_PERSON</th>\n" +
            "        <th>RECIPIENT</th>\n" +
            "        <th>RECIPIENT_PHONE</th>\n" +
            "        <th>RECIPIENT_ADDRESS</th>\n" +
            "        <th>ORDER_STATUS</th>\n" +
            "        <th>COURIER_FEE</th>\n" +
            "        <th>RATE</th>\n" +
            "    </tr>" + dataDOM)
    }

</script>
</body>
</html>
