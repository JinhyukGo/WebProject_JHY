<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JDBC 회원 추가</title>
</head>
<body>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	String id = "test";
	String password = "test";
	String email = "tester@test.com";
	String name = "테스터";
/* 	Date birth = "2024/03/14"; */
	String phone = "010-1234-5678";
	
	String sql = "INSERT INTO membership VALUES (?, ?, ?, ?, ?, sysdate)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, password);
	psmt.setString(3, email);
	psmt.setString(4, name);
	psmt.setString(5, phone);
	
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력되었습니다.");
	
	jdbc.close();		
	%>
</body>
</html>