<%--
  Created by IntelliJ IDEA.
  User: CYQ
  Date: 2018/6/3
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    hello
    <table border=1>
        <tr>
            <td>phone</td>
            <td>name</td>
            <td>Loan</td>
        </tr>
        <tr>
            <td>${reader.readerPhone}</td>
            <td>${reader.readerName}</td>
            <td>${reader.readerHadLoan}</td>

        </tr>
    </table>
</body>
</html>
