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
    <title>Title</title>
</head>
<body>
${msg}
<form action="${pageContext.request.contextPath}/register" method="post">
    电话：<input type="text" name="readerPhone"> <br>
    姓名：<input type="text" name="readerName">
    密码：<input type="password" name="readerPassword"><br>

    <input type="submit" value="登录">
</form>
</body>
</html>

