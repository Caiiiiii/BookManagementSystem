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
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/findOrdersByPhone" method="get">
    查询你要借阅的书籍：  <input type="text" name="readerPhone"><br>
    <input type="submit" value="查询">
</form>
</body>
</html>
