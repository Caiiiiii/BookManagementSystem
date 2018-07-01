<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/8
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书馆</title>
    <link rel="stylesheet" href="css/mdui.css">
    <link rel="stylesheet" href="../../css/bms.css">
    <script src="js/mdui.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body>

<!--应用栏-->
<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-grey">

        <a href="${pageContext.request.contextPath}/login" class="mdui-typo-title mdui-text-color-white" id="login">登录 </a>
        <a href="${pageContext.request.contextPath}/register" class="mdui-typo-title mdui-text-color-white" id="register">注册</a>
        <div class="mdui-toolbar-spacer"></div>
        <div class="mdui-typo-title mdui-text-color-white" id="readerInfo"></div>
        <div id="loginUp" class=" mdui-ripple loginUpDisplay loginUpSize">
            <i class="mdui-icon material-icons iconsPosition">power_settings_new</i>
            <div class="mdui-list-item-content loginUpTextPosition">退出</div>
        </div>
        <a id="shoppingCart" class="mdui-ripple" href="${pageContext.request.contextPath}/toShoppingCart">
            <i class="mdui-icon material-icons mdui-text-color-white">import_contacts</i>
        </a>
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>-->
    </div>
</div>

<div class="mdui-container main-layout1">

    <form action="searchResults.jsp" method="get">
        <div class="mdui-container mdui-valign" style="height: 200px;">
            <h2 class="title-text">查询书籍</h2>

            <select class="mdui-select" mdui-select="{position: 'bottom'}" name="CatalogSelect">
                <option value="1">书名</option>
                <option value="2">作者</option>
            </select>
            <input class="mdui-textfield-input title-input" type="text" name="CatalogInput">
            <input type="hidden" id="url" name="url" value="">
            <button type="submit" class="mdui-btn mdui-color-grey mdui-ripple">检索</button>
        </div>
    </form>
</div>

<div class="mdui-table-fluid table-size">
    <table id="resultTable" width="100%" class="mdui-table mdui-table-hoverable">
        <tr>
            <td>图书ID</td>
            <td>图书名称</td>
            <td>图书作者</td>
            <td>出版社</td>
            <td>出版时间</td>
            <td>操作</td>
        </tr>
    </table>
</div>

<!--对话框-->
<div class="mdui-dialog " id="dialog">
    <div class="mdui-dialog-title">借阅书籍</div>
    <div class="mdui-dialog-content mdui-dialog-content-size">
        <div class="dialogPosition">
            <h4 class="dialog-text-left none-select">借阅</h4>
            <div id="buttonDel" class="none-select"><i class="mdui-icon material-icons dialog-text-del">remove</i></div>
            <p id="borrowNum" class=" dialog-input-width none-select">1</p>
            <div id="buttonAdd" class="none-select"><i class="mdui-icon material-icons dialog-text-add">add</i></div>
            <h4 class="dialog-text-right none-select">个月</h4>
            <br>
        </div>
    </div>
    <div class="mdui-dialog-actions mdui-dialog-actions-stacked">
        <button id="submitOrderButton" class="mdui-btn mdui-ripple" mdui-dialog-confirm>确认</button>
        <button class="mdui-btn mdui-ripple" mdui-dialog-close>取消</button>
    </div>
</div>

</body>


<script type="text/javascript">

    var inst = new mdui.Dialog('#dialog');
    var catalogId = 0;  //初始化

    //获得字符串
    var url = window.location.search;
    url = decodeURI(url);
    url = url.substring(1, url.length);
    //分割
    var arr = url.split("&");
    var arr1 = arr[0].split("=");
    var arr2 = arr[1].split("=");

    var CatalogSelect = arr1[1];
    var CatalogInput = arr2[1];

    // alert(CatalogSelect+"=="+CatalogInput);

    //查询结果
    $.ajax({
        type: 'GET',
        url: '/searchCatalog',
        data: {CatalogSelect: CatalogSelect, CatalogInput: CatalogInput},
        success: function (data) {
            //循环生成列表
            for (var i = 0; i < data.length; i++) {
                var button = null;
                if (data[i].catalogCanLoan == "0") {
                    button = " <button class='mdui-btn mdui-btn-raised'" +
                        " id= '" + data[i].catalogId + "' disabled>无库存</button>";
                } else {
                    button = " <button class='mdui-btn mdui-btn-raised' onclick='addCart(this)'" +
                        " value= '" + data[i].catalogId + "'  id= '" + data[i].catalogId + "'>借书</button>";
                }

                var res = "<tr><td>" + data[i].catalogId + "</td><td>" + data[i].catalogName
                    + "</td><td>" + data[i].catalogAuthor + "</td> " +
                    "<td>" + data[i].catalogPublisher + "</td> " +
                    "<td>" + data[i].catalogPublishTime + "</td> " +
                    "<td>" + button + "</td></tr>";
                $("#resultTable").append(res);

                //给按钮添加对话框弹窗事件
                document.getElementById(data[i].catalogId).addEventListener('click', function () {
                    inst.open();
                });
            }
        },
        error: function (data) {
            alert("失败");
        }
    })

    //订阅月 --- 加
    $("#buttonAdd").click(function () {
        var num = $("#borrowNum").text();
        num++;
        console.log(num);
        $("#borrowNum").text(num);
    })

    //订阅月 --- 减
    $("#buttonDel").click(function () {
        if ($("#borrowNum").text() > 1) {
            var num = $("#borrowNum").text();
            num--;
            console.log(num);
            $("#borrowNum").text(num);
        }
    })


    //用户名
    $.ajax({
        type: 'GET',
        url: '/findReaderPhoneBySession',
        success: function (data) {
            console.log(data);
            if (data != "" && data != null) {
                $("#readerInfo").html(data.readerName);
                $("#loginUp").css("display", "block");
                $("#login").css("display", "none");
                $("#register").css("display", "none");
            } else {
                $("#readerInfo").html("请登录");
                $("#loginUp").css("display", "none");
                $("#login").css("display", "block");
                $("#register").css("display", "block");
            }
        },
        error: function () {
            alert("失败了");
        }
    })

    $(document).ready(function () {
        // $('button').on("click",function () {
        //     console.log(catalogId);
        //     console.log("点击了");
        //     window.location.href = "shoppingCart.jsp?CatalogId="+catalogId;
        // })
    })

    function addCart(data) {
        <%--console.log($("#readerInfo").html());--%>
        <%--if ($("#readerInfo").html() === "请登录"){--%>
            <%--window.location.href = " ${pageContext.request.contextPath}/login";--%>
        <%--}--%>
        $("#borrowNum").text(1);
        catalogId = data.value;

        // $.ajax({
        //     type:'POST',
        //     url:'/submitOrder',
        //     success:function () {
        //
        //     }
        // })
        // window.location.href="shoppingCart.jsp?CatalogId="+catalogId;

        // $("你需要操作的元素").unbind("click");
    }

    $("#submitOrderButton").click(function () {
        var num = $("#borrowNum").text();
        $.ajax({
            type: 'GET',
            url: 'confirmIsLogin',
            success: function (data) {
                if (data.index == '1') {
                    $.ajax({
                        type: 'POST',
                        url: '/submitOrder',
                        data: {CatalogId: catalogId, borrowTime: num},
                        datatype: 'json',
                        success: function (data) {
                            if (data.index == '1') {
                                mdui.snackbar({
                                    message: '借阅成功',
                                    position: 'bottom'
                                });
                                setTimeout("window.location.reload()",1000);

                            } else if (data.index == '3') {
                                mdui.snackbar({
                                    message: '图书已被借完',
                                    position: 'bottom'
                                });
                            }
                        }
                    })
                } else if (data.index == '3') {
                    mdui.snackbar({
                        message: '请先登录',
                        position: 'bottom'
                    });
                    // setTimeout("window.location.reload()",2000);
                    window.location.href = " ${pageContext.request.contextPath}/login";
                }

            }
        })

    })

    $("#loginUp").click(function () {
        $.ajax({
            type: 'GET',
            url: '/loginUp',
            success: function (data) {
                if (data.index == "1") {
                    //成功了再调用一次ajax刷新页面
                    $.ajax({
                        type: 'GET',
                        url: '/findReaderPhoneBySession',
                        success: function (data) {
                            console.log(data);
                            if (data == "" || data == null) {
                                $("#readerInfo").html("请登录");
                                $("#loginUp").css("display", "none");
                                mdui.snackbar({
                                    message: '您已登出',
                                    position: 'bottom'
                                });
                                $("#login").css("display", "block");
                                $("#register").css("display", "block");
                            }
                        },
                        error: function () {
                            alert("失败了");
                        }
                    })

                }
            }
        })
    })
</script>
</html>
