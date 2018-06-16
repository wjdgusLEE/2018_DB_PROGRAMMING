<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>

<html>
<head>

</head>
<body>
	<%

		String s_id = (String) session.getAttribute("user");
		String c_id = request.getParameter("c_id");
		String c_id_no = request.getParameter("c_id_no");
		
		String myResultSet = null;

		ConnectionManager conn_manager = new ConnectionManager();
		Connection myConn = conn_manager.getConnection();
		Statement stmt = null;
		CallableStatement cstmt = null;

		cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
		cstmt.setString(1, s_id);
		cstmt.setString(2, c_id);
		cstmt.setString(3, c_id_no);
		cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		try {
			cstmt.execute();
			myResultSet = cstmt.getString(4);
	%>
	<script>	
		alert("<%=myResultSet%>");
		location.href = "/course_enroll.jsp";
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
