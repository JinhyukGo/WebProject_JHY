<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>

<%@ page import="common.JDBConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Search</title>
</head>
<body>
	<h2>Member Search</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT id, password, email, name, phone, regidate FROM membership";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		String id = rs.getString(1);
		String password = rs.getString(2);
		String email = rs.getString(3);
		String name = rs.getString(4);
		String phone = rs.getString(5);
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s %s %s", id, password, email, name, phone, regidate) + "<br/>");
	}
	
	jdbc.close();
	%>
</body>
</html>