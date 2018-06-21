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
        <a href="index.jsp" class="mdui-typo-title mdui-text-color-white">首页</a>
        <div class="mdui-toolbar-spacer"></div>
        <div class="mdui-typo-title mdui-text-color-white" id="readerInfo"></div>
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

<div  class="mdui-container main-layout">
    <table id="resultTable" width="100%" class="mdui-table mdui-table-hoverable">
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
</div>

</body>

<script type="text/javascript">
    var readerPhone = null;
    $.ajax({
        type:'GET',
        url:'/findReaderPhoneBySession',
        success:function (data) {
            console.log(data);
            if(data != "" && data != null)
            {
                readerPhone = data.readerPhone;
                $("#readerInfo").html(data.readerName);
                $("#loginUp").css("display","block");
            }
        },

    })

    $.ajax({
        type:'POST',
        url:'/findOrdersByPhone',
        data:{readerPhone:readerPhone},
        success:function (data) {
            for(var i=0; i<data.length;i++){
                console.log(data.orderId);
            }
        }
    })
    // $.ajax({
    //     type:'POST',
    //     url:'',
    //     success:function (data) {
    //         for(var i=0; i<data.length;i++){
    //             if (data[i].isAdopt = "0")
    //             {
    //                 var status = "否";
    //             }
    //             else{
    //                 var status = "是";
    //             }
    //             var res = " <tr><td>" +
    //                 data[i].orderId+"</td><td>" +
    //                 data[i].bookId+"</td><td>" +
    //                 data[i].readerPhone+"</td><td>" +
    //                 data[i].catalogName+"</td><td>" +
    //                 data[i].bookLendTime+"</td><td>" +
    //                 data[i].bookReturnTime+"</td><td>" +
    //                 status+"</td></tr> "
    //
    //             $("#resultTable").append(res);
    //         }
    //     }
    // })


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

</script>
<style type="text/css">
    .main-layout{
        top: 40px;
        width: 100%;
        max-width: 1200px;
        margin: auto;
        position: relative;
    }
    .loginUpSize{
        width: 70px;
        position: relative;

    }
    .loginUpDisplay{
        display: block;
    }
    .iconsPosition{
        position: absolute;
        float: left;
        top:12px;
    }
    .loginUpTextPosition{
        position: relative;
        left: 25px;

    }
</style>
</html>
