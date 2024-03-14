<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="common.JDBConnect" %>
<%@ page import="common.DBConnPool" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JDBConncetionTest</title>
</head>
<body>
	<h2>JDBConnection Test1</h2>
	<%
	JDBConnect jdbc1 = new JDBConnect();
	jdbc1.close();
	%>

	<h2>JDBConnection Test2</h2>
	<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");
	
	JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
	jdbc2.close();
	%>

	<h2>JDBConnection Test3</h2>
	<%
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();
	%>
	
	<h2>DBConnPool Test</h2>
	<%
	DBConnPool pool = new DBConnPool();
	pool.close();
	%>
</body>
</html>