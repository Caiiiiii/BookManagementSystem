<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/28
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>图书馆</title>
    <link rel="stylesheet" href="../../css/mdui.css">
    <link rel="stylesheet" href="../../css/bms.css" charset="UTF-8">
    <script src="../../js/mdui.js"></script>
    <script src="../../js/jquery-3.3.1.js"></script>
</head>
<body>

<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-grey">
        <a href="/toAdmin" class="mdui-typo-title mdui-text-color-white">返回</a>

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

<div class="mdui-container main-layout-index">
    <form >
        <div class="mdui-container mdui-valign" style="height: 200px;">
            <h2 class="title-text">输入电话查询用户信息</h2>
            <input class="mdui-textfield-input title-input"  type="text" id="ReaderPhone">
            <!--<input type="hidden" id="url" name="url" value="">-->
            <button id="searchbtn" type="button" class="mdui-btn mdui-color-grey mdui-ripple">查询</button>
        </div>
    </form>
</div>
</body>

<div  class="mdui-container main-layout-stuInfo hiddenStyle" id="ReaderTableDiv">
    <h4>学生基本信息</h4>
    <table id="ReaderTable" width="100%" class="mdui-table mdui-table-hoverable">
        <tr>
            <td>姓名</td>
            <td>电话</td>
            <td>性别</td>
        </tr>
    </table>
</div>
<h3 class="NoInfoMessage" id="NoInfoMessage">查无此人</h3>

<div  class="mdui-container main-layout stuInfoRestabel hiddenStyle" id="resultTableDiv">
    <h4>订单信息</h4>
    <table id="resultTable" width="100%" class="mdui-table mdui-table-hoverable">
        <tr>
            <td>订单号</td>
            <td>书本号</td>
            <td>书名</td>
            <td>作者</td>
            <td>出版商</td>
            <td>出版时间</td>
            <td>借阅时间</td>
            <td>应归还时间</td>
        </tr>
    </table>
</div>
<h3 class="NoInfoMessage" id="NoOrderMessage"></h3>


<script type="text/javascript">
    $("#searchbtn").click(function () {
        var readerPhone = $("#ReaderPhone").val();

        $.ajax({
            type:'POST',
            url:'/searchReader',
            data:{readerPhone:readerPhone},
            success:function (data) {
                console.log(data);
                if (data != ""){
                    $("#ReaderTable  tr:not(:first)").html("");
                    $("#ReaderTableDiv").css("display","block");
                    $("#NoInfoMessage").css("display","none");
                    var res = "<tr><td>"+data.readerName+"</td>" +
                        "<td>"+data.readerPhone+"</td>" +
                        "<td>"+data.readerSex+"</td></tr>";
                    $("#ReaderTable").append(res);
                }else{
                    $("#ReaderTable  tr:not(:first)").html("");
                    $("#ReaderTableDiv").css("display","none");
                    $("#NoInfoMessage").css("display","block");
                }

            }
        })


        $.ajax({
            type:'POST',
            url:'/findOrdersByPhoneAndAdopt',
            data:{readerPhone:readerPhone},
            success:function (data) {
                if (data != ""){
                    $("#resultTable  tr:not(:first)").html("");
                    $("#resultTableDiv").css("display","block");
                    $("#NoOrderMessage").css("display","none");
                    for(var i=0; i<data.length;i++){
                        var res = "<tr><td>"+data[i].orderId+"</td>" +
                            "<td>"+data[i].bookId+"</td>" +
                            "<td>"+data[i].catalogName+"</td>" +
                            "<td>"+data[i].bookLendTime+"</td>" +
                            "<td>"+data[i].bookReturnTime+"</td></tr>";

                        var res = "<tr><td>" + data[i].orderId + "</td>" +
                            "<td>" + data[i].bookId + "</td>" +
                            "<td>" + data[i].catalogName + "</td>" +
                            "<td>" + data[i].catalogAuthor + "</td>" +
                            "<td>" + data[i].catalogPublisher + "</td>" +
                            "<td>" + data[i].catalogPublishTime + "</td>" +
                            "<td>" + data[i].bookLendTime + "</td>" +
                            "<td>" + data[i].bookReturnTime + "</td></tr>";

                        $("#resultTable").append(res);
                    }
                }else{
                    $("#resultTable  tr:not(:first)").html("");
                    $("#resultTableDiv").css("display","none");
                    $("#NoOrderMessage").css("display","block");
                }
            }
        })
    })


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
                                window.location.href="index.jsp";
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
    .stuInfoRestabel{
        position: relative;
        top:50px;
    }
    .main-layout-stuInfo{
        /*top: 40px;*/
        width: 100%;
        max-width: 500px;
        margin: auto;
        position: relative;
    }
    .hiddenStyle{
        display: none;
    }
    .NoInfoMessage{
        text-align: center;
        display: none;
    }
</style>
</html>
