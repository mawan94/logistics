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
        <input type="text" class="form-control" placeholder="order id" aria-describedby="sizing-addon1">
    </div>
    </p>
    <p>
    <div style="display: flex;justify-content: center;align-items: center">
        <a class="btn btn-primary btn-lg" href="#" role="button">Search</a>
    </div>
    </p>
</div>


<table class="table">
    <tr>
        <th>ORDER_ID</th>
        <th>SENDER</th>
        <th>DELIVERY_PERSON</th>
        <th>RECIPIENT</th>
        <th>RECIPIENT_PHONE</th>
        <th>RECIPIENT_ADDRESS</th>
        <th>ORDER_STATUS</th>
        <th>COURIER_FEE</th>
        <th>RATE</th>
    </tr>

    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        <td>7</td>
        <td>8</td>
        <td>
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                Rate
            </button>
        </td>
    </tr>
</table>

<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">--%>
<%--Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">RATE</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="status">
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
                <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
