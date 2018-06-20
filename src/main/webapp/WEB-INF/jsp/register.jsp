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
    <link rel="stylesheet" href="../../css/mdui.css">
    <script src="../../js/mdui.js"></script>
    <script src="../../js/jquery-3.3.1.js"></script>
</head>
<body >

<!--应用栏-->
<div class="mdui-appbar">
    <div class="mdui-toolbar mdui-color-grey">

        <a href="index.jsp" class="mdui-typo-title mdui-text-color-white">首页</a>

        <div class="mdui-toolbar-spacer"></div>
        <div class="mdui-typo-title mdui-text-color-white" id="readerInfo"></div>
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
            <label class="mdui-textfield-label">姓名</label>
            <input class="mdui-textfield-input" type="text" name="readerName" id="readerName"/>
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

</body>
<script type="text/javascript">
    $("#registerButton").click(function () {
        var phone = $("#readerPhone").val();
        var password = $("#readerPassword").val();
        var rePassword = $("#readerRePassword").val();
        var readerName = $("#readerName").val();

        if (phone == ""){
            mdui.snackbar({
                message: '电话号码不能为空',
                position: 'bottom'
            });
            return false;
        }

        if (!isNaN(phone)){
            console.log("电话ok");
        } else{
                mdui.snackbar({
                    message: '电话号码只能填数字',
                    position: 'bottom'
                });
            return false;
        }

        if (readerName == ""){
            mdui.snackbar({
                message: '姓名不能为空',
                position: 'bottom'
            });
            return false;
        }

        if (password == "" || rePassword == ""){
            mdui.snackbar({
                message: '密码不能为空',
                position: 'bottom'
            });
            return false;
        }


        if (password == rePassword && password != ""  && rePassword != ""){
            console.log("密码ok");
        }else{
            mdui.snackbar({
                message: '两次密码不相同',
                position: 'bottom'
            });
            return false;
        }

        $.ajax({
            type:'POST',
            url:'/register',
            data:{readerPhone:phone,readerName:readerName,readerPassword:password},
            success:function (data) {
               window.location.href = data.url;
            }
        })
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

