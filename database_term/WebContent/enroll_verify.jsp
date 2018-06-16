<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>
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
		int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
		int year = Integer.parseInt(yearStr);
		int semester = Integer.parseInt(semesterStr);
		String s_id = session_id;
		String result = null;
		Connection myConn = null;
		Statement stmt = null;
		String mySQL = null;
		ConnectionManager conn_manager = new ConnectionManager();
		myConn = conn_manager.getConnection();
		
		CallableStatement cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
		cstmt.setString(1, s_id);
		cstmt.setString(2, c_id);
		cstmt.setInt(3, c_id_no);
		cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		try {
			cstmt.execute();
			result = cstmt.getString(4);
	%>
	<script>
	alert("<%=result%>");
		location.href = "course_enroll.jsp";
	</script>
	<%
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		} finally {
			if (cstmt != null)
				try {
					myConn.commit();
					cstmt.close();
					myConn.close();
				} catch (SQLException ex) {
				}
		}
	%>
</body>
</html>