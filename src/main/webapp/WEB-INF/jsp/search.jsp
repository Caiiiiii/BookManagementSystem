<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/5
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${msg}
<form action="${pageContext.request.contextPath}/searchCatalogName" method="get">
    查询你要借阅的书籍：  <input type="text" name="CatalogName"><br>
    <input type="submit" value="查询">
</form>


<form action="${pageContext.request.contextPath}/createOrder" method="get">
    添加你要借阅的书籍：  <input type="text" name="CatalogName"><br>
    借阅的时间<input type="text" name="borrowTime">
    <input type="submit" value="查询">
</form>

${msg1}
</body>
</html>