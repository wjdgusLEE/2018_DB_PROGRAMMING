<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
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
		ResultSet myResultSet = null;

		int totalEnrolledClass = 0;
		int totalEnrolledUnit = 0;

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
		
		String session_id = (String) session.getAttribute("userID");
		String s_id = session_id;

		String mySQL = null;
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db1512173";
		String passwd = "wjdgus12";
		String dbdriver = "oracle.jdbc.driver.OracleDriver";
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement();
		mySQL = "DELETE FROM enroll WHERE s_id='" + s_id + "' and c_id='" + c_id + "' and c_id_no='" + c_id_no
				+ "'";
		myResultSet = stmt.executeQuery(mySQL);
	%>

	<script>
		alert("수강취소가 완료 되었습니다.");
		window.location.href = "./course_drop.jsp?year=";
	</script>

</body>
</html>