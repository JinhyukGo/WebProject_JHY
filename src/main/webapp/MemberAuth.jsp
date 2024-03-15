<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MemberAuth</title>
</head>
<body>
	<h2>MVC 패턴으로 회원 인증하기</h2>
	<p>
		<strong>${ authMessage }</strong>
		<br />
		<a href="./MemberAuth.mvc?id=myartmemadmin&pass=art">회원인증(관리자)</a>
		<a href="./MemberAuth.mvc?id=test&pass=test">회원인증(회원)</a>
		<a href="./MemberAuth.mvc?id=stranger&pass=str">회원인증(비회원)</a>
	</p>
</body>
</html>