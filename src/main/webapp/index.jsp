<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书馆</title>
    <link rel="stylesheet" href="css/mdui.css">
    <link rel="stylesheet" href="css/bms.css">
    <script src="js/mdui.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body >

<!--应用栏-->
<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-grey">

        <a href="/login" class="mdui-typo-title mdui-text-color-white">登录 </a>
        <a href="/register" class="mdui-typo-title mdui-text-color-white">注册</a>
        <div class="mdui-toolbar-spacer"></div>
        <div class="mdui-typo-title mdui-text-color-white" id="readerInfo"></div>
        <!--退出按钮-->
        <div id="loginUp" class=" mdui-ripple loginUpDisplay loginUpSize">
            <i class="mdui-icon material-icons iconsPosition">power_settings_new</i>
            <div class="mdui-list-item-content loginUpTextPosition">退出</div>
        </div>
        <a id="shoppingCart" class="mdui-ripple" href="${pageContext.request.contextPath}/toShoppingCart">
            <i class="mdui-icon material-icons mdui-text-color-white">shopping_cart</i>
        </a>
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>-->
    </div>
</div>
<div class="mdui-container main-layout-index">

        <form action="searchResults.jsp" method="get">
            <div class="mdui-container mdui-valign" style="height: 200px;">
                <h2 class="title-text">查询书籍</h2>

                    <select class="mdui-select" mdui-select="{position: 'bottom'}" name="CatalogSelect">
                        <option value="1">书名</option>
                        <option value="2">作者</option>
                    </select>
                    <input class="mdui-textfield-input title-input"  type="text" name="CatalogInput">
                    <input type="hidden" id="url" name="url" value="">
                <button type="submit" class="mdui-btn mdui-color-grey mdui-ripple">检索</button>
            </div>
        </form>
</div>


</body>

<script>

</script>


<script type="text/javascript">
    // $("searchSubmit").click(function (){
    //     window.location.href = "searchResults.jsp?CatalogSelect= "
    //         +$("CatalogSelect")+"&CatalogInput="+$("CatalogInput");
    // })

    $.ajax({
        type:'GET',
        url:'/findReaderPhoneBySession',
        success:function (data) {
            console.log(data);
            if(data != "" && data != null)
            {
            $("#readerInfo").html(data.readerName);
            $("#loginUp").css("display","block");
             }else
                 {
                $("#readerInfo").html("请登录");
                     $("#loginUp").css("display","none");
                 }
        },
        error:function () {
            alert("失败了");
        }
    })

     //获取url
    $(function() {
        var url = window.location.href;/* 获取完整URL */
        var index = url.lastIndexOf("\/");
        url = url.substring(index + 1, url.length);
        $("#url").val(url);
        console.log(url);
    });
    
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

    //确认是否登录
    <%--$("#shoppingCart").click(function () {--%>
        <%--$.ajax({--%>
            <%--type:'GET',--%>
            <%--url:'/confirmIsLogin',--%>
            <%--success:function (data) {--%>
                  <%--if (data.index == '1'){--%>
                      <%--window.location.href = "${pageContext.request.contextPath}/toShoppingCart";--%>
                  <%--} else if (data.index == '3'){--%>

                  <%--}--%>
            <%--}--%>
        <%--})--%>
    <%--})--%>
</script>
</html>
