<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	if(memberDTO.getId() != null) {
		session.setAttribute("UserId", memberDTO.getId());
		response.sendRedirect("LoginForm.jsp");
	} else {
		request.setAttribute("LoginErrMsg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}	
%>