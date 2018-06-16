
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><center>수강삭제 시스템</center></title>
</head>
<body>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");

		ResultSet myResultSet = null;

		ConnectionManager conn_manager = new ConnectionManager();
		Connection myConn = conn_manager.getConnection();
		Statement stmt = null;
		CallableStatement cstmt = null;

		String sql = "{? = call Date2EnrollYear(SYSDATE)}";
		cstmt = myConn.prepareCall(sql);
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		int nYear = cstmt.getInt(1);

		sql = "{? = call Date2EnrollSemester(SYSDATE)}";
		cstmt = myConn.prepareCall(sql);
		cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
		cstmt.execute();
		int nSemester = cstmt.getInt(1);

		String c_id = request.getParameter("c_id");
		String c_id_no = request.getParameter("c_id_no");

		System.out.println(session_id);
		System.out.println(c_id);
		System.out.println(c_id_no);

		String mySQL = "DELETE FROM enroll WHERE s_id='" + session_id + "' and c_id='" + c_id + "' and c_id_no='"
				+ c_id_no + "'";
		myResultSet = stmt.executeQuery(mySQL);
	%>


	<script>
		alert("수강취소가 완료 되었습니다.");
		window.location.href = "./course_drop.jsp";
	</script>

</body>
</html>