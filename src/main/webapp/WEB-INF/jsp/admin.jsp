<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/7
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书馆</title>
    <link rel="stylesheet" href="../../css/mdui.css">
    <link rel="stylesheet" href="../../css/bms.css">
    <script src="../../js/mdui.js"></script>
    <script src="../../js/jquery-3.3.1.js"></script>
</head>
<body>

<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-grey">
        <a href="javascript:void(0);" onclick="confirmButton()" class="mdui-typo-title mdui-text-color-white">申请列表</a>
        <a href="javascript:void(0);" onclick="returnButton()" class="mdui-typo-title mdui-text-color-white">归还列表</a>
        <a href="/toStudentInfo" class="mdui-typo-title mdui-text-color-white">查询学生信息</a>

        <div class="mdui-toolbar-spacer"></div>
        <div class="mdui-typo-title mdui-text-color-white" id="readerInfo">管理员</div>
        <!--退出按钮-->
        <div id="loginUp" class=" mdui-ripple loginUpDisplay loginUpSize">
            <i class="mdui-icon material-icons iconsPosition">power_settings_new</i>
            <div class="mdui-list-item-content loginUpTextPosition">退出</div>
        </div>
        <%--<a id="shoppingCart" class="mdui-ripple" href="${pageContext.request.contextPath}/toShoppingCart">--%>
        <%--<i class="mdui-icon material-icons mdui-text-color-white">shopping_cart</i>--%>
        <%--</a>--%>
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>-->
    </div>
</div>

<div  class="mdui-container main-layout confirmTabel" id="confirmTabelDiv">
    <h1 style="text-align: center">借书申请名单</h1>
    <table id="confirmTabel" width="100%" class="mdui-table mdui-table-hoverable">
        <tr>
            <td>订单号</td>
            <td>书本号</td>
            <td>书名</td>
            <td>借阅人</td>
            <td>借阅时间</td>
            <td>应归还时间</td>
            <td>是否允许</td>
        </tr>

    </table>
</div>

<div  class="mdui-container main-layout confirmTabel" id="returnTabelDiv">
    <h1 style="text-align: center">归还申请名单</h1>
    <table id="returnTabel" width="100%" class="mdui-table mdui-table-hoverable">
        <tr>
            <td>订单号</td>
            <td>书本号</td>
            <td>书名</td>
            <td>借阅人</td>
            <td>借阅时间</td>
            <td>应归还时间</td>
            <td>是否归还</td>
        </tr>

    </table>
</div>

</body>

<script type="text/javascript">
    $("#loginUp").click(function () {
        $.ajax({
            type:'GET',
            url:'/loginUp',
            success:function (data) {
                if (data.index == "1"){
                    //成功了再调用一次ajax刷新页面
                    $.ajax({
                        type:'GET',
                        url:'/findReaderPhoneBySession',
                        success:function (data) {
                            console.log(data);
                            if(data == "" || data == null)
                            {
                                $("#readerInfo").html("请登录");
                                $("#loginUp").css("display","none");
                                mdui.snackbar({
                                    message: '您已登出',
                                    position: 'bottom'
                                });
                                window.location.href = 'index.jsp';
                            }
                        },
                        error:function () {
                            alert("失败了");
                        }
                    })

                }
            }
        })
    })

    function confirmButton() {
        $.ajax({
            type:'GET',
            url:'/findOrdersNoAdopt',
            success:function (data) {
                $("#confirmTabel").empty();
                $("#returnTabelDiv").css("display","none");
                $("#confirmTabelDiv").css("display","block");
                for(var i=0; i<data.length;i++){
                var TwoButton =" <button class='mdui-btn mdui-btn-raised' onclick='confirmSubmit(this)'" +
                "value = "+data[i].orderId+">允许</button>" +
                    "<button class='mdui-btn mdui-btn-raised' onclick='refuseSubmit(this)'" +
                    "value = "+data[i].orderId+">拒绝</button>";

                    var res = "<tr><td>"+data[i].orderId+"</td>" +
                        "<td>"+data[i].bookId+"</td>" +
                        "<td>"+data[i].catalogName+"</td>" +
                        "<td>"+data[i].readerName+"</td>" +
                        "<td>"+data[i].bookLendTime+"</td>" +
                        "<td>"+data[i].bookReturnTime+"</td>" +
                        "<td>"+TwoButton+"</td></tr>";

                    $("#confirmTabel").append(res);
                }
            }
        })
    }

    function returnButton() {
        $.ajax({
            type:'GET',
            url:'/findOrdersNoReturn',
            success:function (data) {
                $("#returnTabel").empty();
                $("#confirmTabelDiv").css("display","none");
                $("#returnTabelDiv").css("display","block");
                for(var i=0; i<data.length;i++){
                    var TwoButton =" <button class='mdui-btn mdui-btn-raised' onclick='returnSubmit(this)'" +
                        "value = "+data[i].orderId+">确认归还</button>" ;

                    var res = "<tr><td>"+data[i].orderId+"</td>" +
                        "<td>"+data[i].bookId+"</td>" +
                        "<td>"+data[i].catalogName+"</td>" +
                        "<td>"+data[i].readerName+"</td>" +
                        "<td>"+data[i].bookLendTime+"</td>" +
                        "<td>"+data[i].bookReturnTime+"</td>" +
                        "<td>"+TwoButton+"</td></tr>";

                    $("#returnTabel").append(res);
                }
            }
        })
    }

    function confirmSubmit(data) {
           var orderId = data.value;
           $.ajax({
               type:'GET',
               url:'/confirmAdopt',
               data:{orderId:orderId},
               success:function (data) {
                     if (data.index == '1'){
                         mdui.snackbar({
                             message: '确认成功',
                             position: 'bottom'
                         });
                         setTimeout(1000);
                         confirmButton();
                     }
               }
           })
    }

    function refuseSubmit(data) {
        var orderId = data.value;
        $.ajax({
            type:'GET',
            url:'/cancelOrder',
            data:{orderId:orderId},
            success:function (data) {
                if (data.index == '1'){
                 confirmButton();
                    mdui.snackbar({
                        message: '拒绝成功',
                        position: 'bottom'
                    });
                    setTimeout(1000);
                }
            }
        })
    }
    function returnSubmit(data) {
        var orderId = data.value;
        $.ajax({
            type:'GET',
            url:'/cancelOrder',
            data:{orderId:orderId},
            success:function (data) {
                if (data.index == '1'){
                    mdui.snackbar({
                        message: '归还成功',
                        position: 'bottom'
                    });
                    setTimeout(1000);
                    returnButton();
                }
            }
        })
    }
</script>

<style type="text/css">
    .confirmTabel{
      display: none;
    }
</style>
</html>
