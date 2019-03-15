<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<<jsp:useBean id="db" class="bean.DBcon"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");
		String pass = request.getParameter("pass");
		String remember = request.getParameter("passCookies");
		boolean flag = false;
		if(mid == null || pass == null){	
	%>
		<jsp:forward page="index.jsp">
		<jsp:param value="dataerror" name="error"/>
		</jsp:forward>
	<%
		}
		Connection conn =db.getConnection();
		PreparedStatement psmt =null;
		ResultSet re =null;
		String sql = "select count(mid) from member where mid=? and password = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,mid);
		psmt.setString(2,pass);
		re = psmt.executeQuery();
		if(re.next()){
			if(re.getInt(1)==1) //登录成功
				flag = true;
			if(remember!=null){
				Cookie c1 = new Cookie("mid", mid);
				Cookie c2 = new Cookie("pass", pass);
				c1.setMaxAge(1000);
				c2.setMaxAge(1000);//这里设置保存这条Cookie的时间
				response.addCookie(c1);//添加Cookie
				response.addCookie(c2);
			}
		}
		conn.close();
	%>
	<%
	if (flag){ //如果登录成功，跳转到welcome.jsp 
		session.setAttribute("name", mid);
	%>
	<jsp:forward page="welcome.jsp"></jsp:forward>
	
	<% 
	
		}else{ //表示失败
	%>	
	<jsp:forward page="login.jsp">
		<jsp:param value="loginError" name="error"/>
	</jsp:forward>
	<%
		}
	%>	
</body>
</html>