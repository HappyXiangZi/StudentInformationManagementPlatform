<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session"/>
<%
	String user=request.getParameter("user");
	String pw=request.getParameter("pw");
	String sql="select * from user where name='"+user+"' and password='"+pw+"'";
	ResultSet rs=db.executeQuery(sql);
	if(rs.next())
	{
		rs.close();
		db.close();
		session.setAttribute("admin","ok");
%>
	<jsp:forward page="manage.jsp"/>
<%
	}
	else
	{
		rs.close();
		db.close();
%>
    <jsp:forward page="login.jsp">
     <jsp:param name="warning" value="对不起，您的用户名或密码不正确 !"/>
	</jsp:forward>
<%
	}
%>