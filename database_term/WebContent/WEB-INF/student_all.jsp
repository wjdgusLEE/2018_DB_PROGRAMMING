<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../top.jsp"%>
<%@ page import="conn.ConnectionManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!public int getDayValue(String str) {
		if (str.equals("월"))
			return 0;
		else if (str.equals("화"))
			return 1;
		else if (str.equals("수"))
			return 2;
		else if (str.equals("목"))
			return 3;
		else if (str.equals("금"))
			return 4;
		else
			return -1;
	}%>
	<%
		if (session_id == null || type == null)
			response.sendRedirect("login.jsp");
		ConnectionManager conn_manager = new ConnectionManager();
		Connection myConn = conn_manager.getConnection();
		int year = 0;
		int semester = 0;
		String studentID = session_id;
		Statement stmt = myConn.createStatement();
		String mySQL = "select * from enroll where s_id = '" + studentID + "' and e_year = " + year
				+ " and e_semester = " + semester;
		ResultSet rs = stmt.executeQuery(mySQL);
		ResultSet date_rs = stmt.executeQuery("select Date2EnrollYear(sysdate) from dual;");
		if (date_rs != null && date_rs.next())
			year = date_rs.getInt(1);
		ResultSet sem_rs = stmt.executeQuery("select Date2EnrollSemester(sysdate) from dual;");
		if (sem_rs != null && sem_rs.next())
			semester = date_rs.getInt(1);
		int totalEnrolledClass = 0;
		int totalEnrolledUnit = 0;

		int endHr = 14;
		int y = 0;
		while (rs.next() != false) {
			String c_id = "", c_id_no = "", c_name = "", p_id = "", t_day = "", t_time = "", t_room = "",
					p_name = "";
			int c_unit = 0;
			c_id = rs.getString("c_id");
			c_id_no = rs.getString("c_id_no");
			Statement stmt2 = myConn.createStatement();
			String mySQL2 = "select * from course where c_id = '" + c_id + "' and c_id_no = '" + c_id_no + "'";
			ResultSet rs2 = stmt2.executeQuery(mySQL2);
			if (rs2.next()) {
				c_name = rs2.getString("c_name");
				c_unit = rs2.getInt("c_unit");
			} else {
	%>course table을 불러올 수 없음<%
		break;
			}
			mySQL2 = "select * from teach where c_id='" + c_id + "' and c_id_no = '" + c_id_no + "' and t_year = "
					+ year + " and t_semester = " + semester;
			rs2 = stmt2.executeQuery(mySQL2);
			if (rs2.next()) {
				p_id = rs2.getString("p_id");
				t_day = rs2.getString("t_day");
				t_time = rs2.getString("t_time");
				t_room = rs2.getString("t_room");
			} else {
	%>teach table을 불러올 수 없음<%
		break;
			}
			int hr = Integer.parseInt(t_time.substring(0, 2));
			int min = Integer.parseInt(t_time.substring(3, 5));
			int startTime = hr * 4 + min / 15;
			hr = Integer.parseInt(t_time.substring(6, 8));
			min = Integer.parseInt(t_time.substring(9, 11));
			if (endHr < hr)
				endHr = hr;
			int endTime = hr * 4 + min / 15;
			int startPos = (startTime - 36) * 20;
			int height = (endTime - startTime) * 20;
			mySQL2 = "select * from professor where p_id='" + p_id + "'";
			rs2 = stmt2.executeQuery(mySQL2);
			if (rs2.next()) {
				p_name = rs2.getString("p_name");
			} else {
	%>professor table을 불러올 수 없음<%
		break;
			}
			int len = t_day.length();
			for (int i = 0; i < len; i += 2) {
				int dayPos = 20 + 120 * getDayValue(t_day.substring(i, i + 1));
	%>

	<%
		}
			totalEnrolledClass += 1;
			totalEnrolledUnit += c_unit;
		}
		for (int i = 9; i <= endHr; i++) {
	%>

	<%
		y += 80;
		}
	%>

	<table>
		<tr>
			<td width="65%"></td>
			<td>총수강과목: <%=totalEnrolledClass%></td>
			<td>총수강학점: <%=totalEnrolledUnit%></td>
		</tr>
	</table>

</body>
</html>