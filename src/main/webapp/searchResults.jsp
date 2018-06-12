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
    <script src="js/mdui.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
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
        <td>书ID</td>
        <td>书名</td>
        <td>书作者</td>
        <td></td>
    </tr>
</table>
</body>


<script type="text/javascript">
    //获得字符串
    var url = window.location.search;
    url = decodeURI(url);
    url = url.substring(1,url.length);
    //分割
    var arr = url.split("&");
    var arr1 = arr[0].split("=");
    var arr2 = arr[1].split("=");

    var CatalogSelect = arr1[1];
    var CatalogInput = arr2[1];

    // alert(CatalogSelect+"=="+CatalogInput);

    //查询结果
    $.ajax({
        type:'GET',
        url:'/searchCatalog',
        data:{CatalogSelect:CatalogSelect,CatalogInput:CatalogInput},
        success:function (data) {
            for(var i=0; i<data.length;i++){
                var res = "<tr><td>"+data[i].catalogId+"</td><td>"+data[i].catalogName
                           +"</td><td>"+data[i].catalogAuthor+"</td> " +
                           "<td><button  value= "+data[i].catalogId+">添加到购物车</button></td></tr>";
                $("#resultTable").append(res);

            }
         },
         error:function (data) {
             alert("失败");
         }
    })

    //用户名
    $.ajax({
        type:'GET',
        url:'/findReaderPhoneBySession',
        success:function (data) {
            console.log(data);
            if(data != "" && data != null)
            {
                $("#readerInfo").html(data.readerName);
            }else
            {
                $("#readerInfo").html("请登录");
            }
        },
        error:function () {
            alert("失败了");
        }
    })

    $(document).ready(function () {
        $('button').on("click",function () {
            var catalogId = $(this).val();
            window.location.href = "shoppingCart.jsp?CatalogId="+catalogId;
        })

    })

</script>
</html>
