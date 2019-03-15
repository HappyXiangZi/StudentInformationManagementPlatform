<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册界面</title>
		<script>
			function showTips(spanID,msg){
				var span = document.getElementById(spanID);
				span.innerHTML = msg;
			}
			/*
			 * 用户名校验
			 */
			function checkUserName(){
				var uValue = document.getElementById("usename").value;
				var span = document.getElementById("span_username");
				if(uValue.length<6){
					span.innerHTML="您输入的用户名少于6位！";
					return false;
				}else{
					span.innerHTML="用户名符合规则！";		
					return true;
				}
			}
			/*
			 * 密码校验
			 */
			function checkPassword(){
				//获取密码输入
				var uPass = document.getElementById("password").value;
				var span = document.getElementById("span_password");
				//对密码输入进行校验
				if(uPass.length<6){
					span.innerHTML = "<font size='2' color='red'>密码小于6位</font>"
				}else{
					span.innerHTML = "<font size='2' color='red'>密码可用！</font>"
				}
			}
			/*
			 * 确认密码校验
			 */
			function checkRePassword(){
				var uPass = document.getElementById("password").value;
				var rePass = document.getElementById("repassword").value;
				var span = document.getElementById("span_repassword");	
				if(uPass==rePass){
					span.innerHTML = "";
					return true;
				}else{
					span.innerHTML="<font color='red'>两次密码输入不一致!</font>";
					return false;
				}
			}
			function checkForm(){
				var flag = checkUserName()&&checkRePassword();
				return flag;
			}
		</script>
	</head>
	<body style="background-image: url('images/image1.jpg');background-size: cover;">
		<div align="center" style="margin-top: 20%">
		<h2>用户注册</h2>
		<form action="./AddUser" onsubmit="return checkForm()">
		<table>
			<tr>
				<td>用户名：
				<td><input id="usename" type="text" name="usename" onblur="checkUserName()" onfocus="showTips('span_username','用户名长度不能小于6位')" onkeyup="checkUserName()"/>
				<td><span id="span_username"></span>
			<tr>
				<td>密 &nbsp;&nbsp;码：
				<td><input type="password" id="password" name="password" onfocus="showTips('span_password','密码长度不能小于6位')" onblur="checkPassword()" onkeyup="checkPassword()"/>
				<td><span id="span_password"></span>
			<tr>
				<td>确认密码:
				<td><input type="password" id="repassword" onfocus="showTips('span_password','请再次输入密码')" onblur="checkRePassword()" onkeyup="checkRePassword()"/>
				<td><span id="span_repassword"></span>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="提交" />
		</table>
		</form>
		
		</div>
	</body>
</html>
