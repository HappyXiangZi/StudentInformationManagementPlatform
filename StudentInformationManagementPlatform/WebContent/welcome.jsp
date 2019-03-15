<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>登录成功，欢迎光临</h1>
<font>当前的登录名为：<%=session.getAttribute("name") %></font>
</body>
</html>