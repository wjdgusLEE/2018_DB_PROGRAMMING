
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<center>수강삭제 시스템</center>

</head>
<body>

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
			<th>강의시간</th>
			<th>강의장소</th>
			<th>수강신청</th>
		</tr>
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
		%>

		<br>
		<center><%=nYear%>년도<%=nSemester%>학기 수강신청 입니다.
		</center>
		<br>

		<%
			try {

				stmt = myConn.createStatement();
			} catch (SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}

			String mySQL = "select * from course where c_id in (select c_id from enroll where s_id = '" + session_id
					+ "')";
			myResultSet = stmt.executeQuery(mySQL);

			while (myResultSet.next() != false) {
				
				String c_id = "", c_id_no = "", c_name = "", c_major = "", p_id = "", p_name = "";
				String t_day = "", t_time = "", t_room = "";
				int t_max = 0, c_unit = 0, studentNum = 0;
				
				c_id = myResultSet.getString("c_id");
				c_id_no = myResultSet.getString("c_id_no");

				System.out.println(c_id);

				c_name = myResultSet.getString("c_name");
				c_unit = myResultSet.getInt("c_unit");
				c_major = myResultSet.getString("c_major");

				Statement stmt2 = myConn.createStatement();
				String mySQL2 = "select * from teach where c_id='" + c_id + "' and c_id_no = '" + c_id_no
						+ "' and t_year = " + nYear + " and t_semester = " + nSemester;
				ResultSet myResultSet2 = stmt2.executeQuery(mySQL2);
				if (myResultSet2.next()) {
					p_id = myResultSet2.getString("p_id");
					t_day = myResultSet2.getString("t_day");
					t_time = myResultSet2.getString("t_time");
					t_room = myResultSet2.getString("t_room");
					t_max = myResultSet2.getInt("t_max");
				}

				System.out.println(t_time + " " + t_room);

				mySQL2 = "select * from professor where p_id='" + p_id + "'";
				myResultSet2 = stmt2.executeQuery(mySQL2);
				if (myResultSet2.next()) {
					p_name = myResultSet2.getString("p_name");
				}

				totalEnrolledClass += 1;
				totalEnrolledUnit += c_unit;

				mySQL2 = "select COUNT(*) from enroll where c_id = '" + c_id + "' and c_id_no = '" + c_id_no
						+ "' and e_year = " + nYear + " and e_semester = " + nSemester;
				myResultSet2 = stmt2.executeQuery(mySQL2);
				if (myResultSet2.next()) {
					studentNum = myResultSet2.getInt(1);
				}
		%>


		<tr>

			<td><%=c_id%></td>
			<td><%=c_name%></td>
			<td><%=p_name%></td>
			<td><%=c_unit%></td>
			<td><%=t_day%></td>
			<td><%=t_time%></td>
			<td><%=t_room%></td>

			<td align="center"><a
				href="/drop_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">삭제</a></td>
		</tr>
		<%
			}

			stmt.close();
			myConn.close();
		%>
	</table>
	<br>
	<br>
	<table>
		<tr>
			<td width="65%"></td>
			<td align="center">총수강과목: <%=totalEnrolledClass%></td>
			<td align="center">총수강학점: <%=totalEnrolledUnit%></td>
		</tr>
	</table>
</body>
</html>