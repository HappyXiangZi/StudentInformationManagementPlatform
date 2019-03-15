<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body {
	background-image: url("images/image1.jpg");
	background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>学生信息管理平台</title>
</head>
<body >

	<%
		String username = "";
		String password = "";
		Cookie[] c = request.getCookies();
		if (c != null) {
			for (int i = 0; i < c.length; i++) {
				if ("mid".equals(c[i].getName())) {
					username = c[i].getValue();
				} else if ("pass".equals(c[i].getName())) {
					password = c[i].getValue();
				}
			}
		} else {
			username = " ";
			password = " ";
		}
	%>

<div style="align-content: center;margin-top: 20%;" align="center">
	<h2>学生信息管理平台登录</h2>
	<form action="check.jsp" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="mid" id="mid" value="<%= username%>"></td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;码:</td>
				<td><input type="password" name="pass" id="pass" value="<%=password %>"></td>
			</tr>
			<tr>
				<td colspan="2">记住密码<input type="radio" value="jizhu" name="passCookies">
			<tr>
				<td><input type="submit" value="登录"></td>
				<td><input type="button" value="注册" onclick="window.location='register.jsp'"></td>
			</tr>
			
		</table>
	</form>
	<%
		if (request.getParameter("error") != null){
			String err = request.getParameter("error");
			if("loginError".equals(err)){			
	%>
		<h2>登录失败，错误的用户名或密码</h2>
	<%}
			if("dataerror".equals(err)){			
				%>
					<h2>请输入正确的登录信息！</h2>
				<%}
			} %>
</div>
</body>
</html>