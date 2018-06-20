<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/12
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书馆</title>
    <link rel="stylesheet" href="../../css/mdui.css">
    <script src="../../js/mdui.js"></script>
    <script src="../../js/jquery-3.3.1.js"></script>
</head>
<body>

<!--应用栏-->
<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-grey">

        <a href="${pageContext.request.contextPath}/login" class="mdui-typo-title mdui-text-color-white">登录 </a>
        <a href="${pageContext.request.contextPath}/register" class="mdui-typo-title mdui-text-color-white">注册</a>
        <div class="mdui-toolbar-spacer"></div>
        <div class="mdui-typo-title mdui-text-color-white" id="readerInfo"></div>
        <a><i class="mdui-icon material-icons mdui-text-color-white">shopping_cart</i></a>
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>-->
    </div>
</div>

<table id="resultTable" width="100%" border="1" >
    <tr>
        <td>订单号</td>
        <td>书本号</td>
        <td>书名</td>
        <td>借阅人电话</td>
        <td>借阅时间</td>
        <td>应归还时间</td>
        <td>是否通过允许</td>
    </tr>
</table>

</body>

<script type="text/javascript">
    $.ajax({
        type:'POST',
        url:'',
        success:function (data) {
            for(var i=0; i<data.length;i++){
                if (data[i].isAdopt = "0")
                {
                    var status = "否";
                }
                else{
                    var status = "是";
                }
                var res = " <tr><td>" +
                    data[i].orderId+"</td><td>" +
                    data[i].bookId+"</td><td>" +
                    data[i].readerPhone+"</td><td>" +
                    data[i].catalogName+"</td><td>" +
                    data[i].bookLendTime+"</td><td>" +
                    data[i].bookReturnTime+"</td><td>" +
                    status+"</td></tr> "

                $("#resultTable").append(res);
            }
        }
    })
</script>
</html>
