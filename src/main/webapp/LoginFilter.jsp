<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Page</title>
<link rel="stylesheet" href="Login/login.css" />
</head>
<body>
	<div class="logo">
		<a href="/src/index.jsp"><img src="images/logo.png" /></a>
	</div>
		<p class="ErrMsg" style="color : red; font-size : 15px;">
			<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
		</p>
	
	<% if(session.getAttribute("UserId") == null) {
		
	%>
	<script>
		function validateForm(form) {
			if(!form.user_id.value) {
				alert("���̵� �Էµ��� �ʾҽ��ϴ�.");
				return false;
			} if(!form.user_pw.value) {
				alert("�н����尡 �Էµ��� �ʾҽ��ϴ�.");
				return false;
			}
		}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginfrm" onsubmit="return validateForm(this);">
	<section class="login">
		<div class="loginarea">
			<input class="loginbox" type="text" placeholder="ID" name="user_id" /><br />
			<input class="loginbox" type="password" placeholder="Password" name="user_pw" /><br />
		</div>
		<div class="savearea">
			<input class="save" type="checkbox" />
			<p class="savetext">Don't ask me again</p>
		</div>
		<div class="buttonarea">
			<button>Log in</button>
		</div>
		<div class="forgot">
			<p><a href="#">Forgot your Password?</a></p>
		</div>
		<div class="buttonarea signup">
			<button>Sign up</button>
		</div>
	</section>
	</form>
	<%
	} else {
	%>
		<div class=login>
			<p><%= session.getAttribute("UserId") %>�������� �α��εǾ����ϴ�.</p>
			<p><a href="Logout.jsp">Log out</a></p>
		</div>
	<%
	}
	%>
</body>
</html>