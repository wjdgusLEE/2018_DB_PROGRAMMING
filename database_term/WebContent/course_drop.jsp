<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>

	<%
	if (session_id == null)
			response.sendRedirect("login.jsp");
	ResultSet myResultSet = null;
	int totalEnrolledClass = 0;
	int totalEnrolledUnit = 0;
	ConnectionManager conn_manager = new ConnectionManager();
	Connection myConn = conn_manager.getConnection();
	String sql = "{? = call Date2EnrollYear(SYSDATE)}";
	CallableStatement cstmt = myConn.prepareCall(sql);
	cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
	cstmt.execute();
	int nYear = cstmt.getInt(1);
	sql = "{? = call Date2EnrollSemester(SYSDATE)}";
	cstmt = myConn.prepareCall(sql);
	cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
	cstmt.execute();
	int nSemester = cstmt.getInt(1);
	%>

<h3 align="center"> <%=nYear%>년도 <%=nSemester%>학기</h3>
	<table class="table table-hover">
		<tr>
			<th>과목 번호</th>
			<th>과목명</th>
			<th>교수명</th>
			<th>학점</th>
			<th>요일</th>
			<th>시간</th>
			<th>장소</th>
			<th>관리</th>
		</tr>
		<%
		Statement stmt = null;
			try {
				stmt = myConn.createStatement();
			
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
				System.out.println("course : " + c_id);
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
				href="drop_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>&year=<%=nYear%>&semester=<%=nSemester%>">삭제</a></td>
		</tr>
		<%
			}
			} catch (SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			} finally {
				cstmt.close();
				myConn.commit();
				stmt.close();
				myConn.close();			
			}
		%>

	<tr align="center">
			<td colspan="4" style="text-align:right">총 수강 과목 : <%=totalEnrolledClass%> </td>
			<td colspan="4">총 수강 학점 : <%=totalEnrolledUnit%> </td>
	</tr>
	</table>

 <script src="http://code.jquery.com/jquery.js"></script>
 <script src="js/bootstrap.min.js"></script>
</body>
</html>