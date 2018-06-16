<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강신청</title>
</head>
<body>
	<%

		String yearStr = request.getParameter("year");
		String semesterStr = request.getParameter("semester");
		String c_id = request.getParameter("c_id");
		String c_id_no = request.getParameter("c_id_no");
		int year = Integer.parseInt(yearStr);
		int semester = Integer.parseInt(semesterStr);
		
		String s_id = session_id;
		Connection myConn = null;
		Statement stmt = null;
		String mySQL = null;
		ConnectionManager conn_manager = new ConnectionManager();
		myConn = conn_manager.getConnection();
		stmt = myConn.createStatement();

		System.out.println(session_id);
		mySQL = "DELETE FROM enroll WHERE s_id='" + s_id + "' and c_id='" + c_id + "' and c_id_no='" + c_id_no
				+ "'";
		ResultSet myResultSet = stmt.executeQuery(mySQL);
	%>

	<script>
		alert("수강취소가 완료 되었습니다.");
		window.location.href = "./course_drop.jsp?year";
	</script>
	<%
		mySQL = "commit";
		myResultSet = stmt.executeQuery(mySQL);
	%>
</body>
</html>