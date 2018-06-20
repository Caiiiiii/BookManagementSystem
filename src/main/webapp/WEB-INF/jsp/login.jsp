<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/5
  Time: 15:16
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
        <a><i class="mdui-icon material-icons mdui-text-color-white">shopping_cart</i></a>
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>-->
        <!--<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">more_vert</i></a>-->
    </div>
</div>


<form>
    <div class="div-layout">
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">电话</label>
            <input class="mdui-textfield-input" type="text" name="readerPhone" id="readerPhone"/>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">密码</label>
            <input class="mdui-textfield-input" type="password" name="readerPassword" id="readerPassword"/>
        </div>
        <div class="login-button">
            <button id="submitButton" type="button" class="mdui-btn mdui-btn-raised mdui-ripple login-button-width">登录</button>
        </div>
    </div>
</form>

</body>
    <style type="text/css">
        .div-layout{
            width: 100%;
            max-width: 700px;
            margin: auto;
            position: relative;
        }
        .login-button{

           position: relative;
           top: 20px;
            text-align: center;
        }
        .login-button-width{
            width: 150px;
            height: 50px;
        }
    </style>

    <script type="text/javascript">
        $("#submitButton").click(function () {
            var readerPhone = $("#readerPhone").val();
            var readerPassword = $("#readerPassword").val();
            
            if (!isNaN(readerPhone)){
            }else {
                return false;
            }

            if (readerPassword != ""){
            } else{
                return false;
            }

            $.ajax({
                type:'POST',
                url:'/loginIn',
                dataType:"json",
                data:{readerPhone:readerPhone,readerPassword:readerPassword},
                success:function (result) {
                if (result.index == '1'){window.location.href = result.url;}
                else if (result.index == '2'){}
                else if (result.index == '3'){console.log("账号或密码错误");}

                }
            })
            
        })
    </script>
</html>

