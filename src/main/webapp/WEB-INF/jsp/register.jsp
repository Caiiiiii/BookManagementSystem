<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/4
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书馆</title>
    <link rel="stylesheet" href="css/mdui.css">
    <script src="js/mdui.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body >

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

<form method="POST">
    <div class="div-layout">
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">电话</label>
            <input class="mdui-textfield-input" type="text" name="readerPhone" id="readerPhone"/>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">姓名</label>
            <input class="mdui-textfield-input" type="text" name="readerName"/>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">密码</label>
            <input class="mdui-textfield-input" type="password" name="readerPassword" id="readerPassword"/>
        </div>
        <div class="mdui-textfield mdui-textfield-floating-label">
            <label class="mdui-textfield-label">确认密码</label>
            <input class="mdui-textfield-input" type="password" name="readerRePassword" id="readerRePassword"/>
        </div>
        <div class="register-button">
            <button id="registerButton" type="button" class="mdui-btn mdui-btn-raised mdui-ripple register-button-width">注册</button>
        </div>
    </div>
</form>

<form action="${pageContext.request.contextPath}/register" method="post">
    电话：<input type="text" name="readerPhone"> <br>
    姓名：<input type="text" name="readerName">
    密码：<input type="password" name="readerPassword"><br>

    <input type="submit" value="登录">
</form>
</body>
<script type="text/javascript">
    $("#registerButton").click(function () {
        var phone = $("#readerPhone").val();
        var password = $("#readerPassword").val();
        var rePassword = $("#readerRePassword").val();

        if (!isNaN(phone)){
            console.log("数字");
        } else{
            console.log("非数字");
        }

        if (password == rePassword && password != ""  && rePassword != ""){
            console.log("ok");
        }
        else{
            console.log("密码不正确");
        }
    })

</script>

<style type="text/css">
    .div-layout{
        width: 100%;
        max-width: 700px;
        margin: auto;
        position: relative;
    }
    .register-button{

        position: relative;
        top: 20px;
        text-align: center;
    }
    .register-button-width{
        width: 150px;
        height: 50px;
    }
</style>
</html>

