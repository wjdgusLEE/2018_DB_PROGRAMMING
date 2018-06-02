<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강신청 입력</title>
</head>
<body>
	<%@ include file="student_top.jsp"%>
	
<br>2018년도 1학기 수강신청 홈페이지입니다.<br>

	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
	%>

	<table width="75%" align="center" border>
		<br>
		<tr>
			<th>과목번호</th>
			<th>과목명</th>
			<th>교수님</th>
			<th>학점</th>
			<th>시간(교시)</th>
			<th>수강신청</th>
		</tr>
		<%
			Connection myConn = null;
			Statement stmt = null;
			ResultSet myResultSet = null;
			String mySQL = "";
			String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "db1512173";
			String passwd = "wjdgus12";
			String dbdriver = "oracle.jdbc.driver.OracleDriver";

			try {
				Class.forName(dbdriver);
				myConn = DriverManager.getConnection(dburl, user, passwd);
				stmt = myConn.createStatement();
			} catch (SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
			mySQL = "select c_id,c_name,p_name,c_unit,c_time from course, professor where course.p_id = professor.p_id and c_id not in (select c_id from enroll where s_id='"
					+ session_id + "')";

			myResultSet = stmt.executeQuery(mySQL);

			if (myResultSet != null) {
				while (myResultSet.next()) {
					String c_id = myResultSet.getString("c_id");
					String p_name = myResultSet.getString("p_name");
					String c_name = myResultSet.getString("c_name");
					int c_unit = myResultSet.getInt("c_unit");
					int c_time = myResultSet.getInt("c_time");
		%>
		<tr>
			<td align="center"><%=c_id%></td>
			<td align="center"><%=c_name%></td>
			<td align="center"><%=p_name%></td>
			<td align="center"><%=c_unit%></td>
			<td align="center"><%=c_time%></td>
			
			<td align="center"><a
				href="insert_verify.jsp?c_id=<%=c_id%>&c_name=<%=c_name%>">신청</a></td>
		</tr>
		<%
			}
			}
			stmt.close();
			myConn.close();
		%>
	</table>
</body>
</html>