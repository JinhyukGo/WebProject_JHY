<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MemberAuth</title>
</head>
<body>
	<h2>MVC �������� ȸ�� �����ϱ�</h2>
	<p>
		<strong>${ authMessage }</strong>
		<br />
		<a href="./MemberAuth.mvc?id=myartmemadmin&pass=art">ȸ������(������)</a>
		<a href="./MemberAuth.mvc?id=test&pass=test">ȸ������(ȸ��)</a>
		<a href="./MemberAuth.mvc?id=stranger&pass=str">ȸ������(��ȸ��)</a>
	</p>
</body>
</html>