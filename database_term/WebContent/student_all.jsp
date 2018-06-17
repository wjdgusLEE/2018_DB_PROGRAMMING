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

<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>���� ����</title>
</head>
<body>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else if (!isStudent) {
	%>
	<script>
		alert("������ �����ϴ�.");
		location.href = "main.jsp";
	</script>
	<%
		}
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
	<h3 align="center"> <%=nYear%> �⵵ <%=nSemester%>�б�</h3>
	<table class="table table-hover">
		<tr>
			<th>�����ȣ</th>
			<th>�й�</th>
			<th>���Ǹ�</th>
			<th>����</th>
			<th>�г�</th>
			<th>����</th>
			<th>���ǽ�</th>
			<th>����</th>
			<th>�б�</th>
			<th>����</th>
			<th>�ð�</th>
		</tr>
		<%
		Statement stmt = null;
		try {
			stmt = myConn.createStatement();
			System.out.println(nSemester);
		
			String mySQL = "select c_id, c_id_no from enroll where s_id = '" + session_id+"'";

			mySQL = "select * from course where c_id in (select c_id from enroll where s_id = '" + session_id + "')";

			ResultSet myResultSet = stmt.executeQuery(mySQL);

			while (myResultSet.next() != false) {

				String c_id = "", c_name = "", c_major = "", p_id = "", p_name = "";
				String t_day = "", t_time = "", t_room = "";
				int c_id_no=0, t_max = 0, c_unit = 0, c_grade = 0, studentNum = 0, t_year = 0, t_semester = 0;

				c_id = myResultSet.getString("c_id");
				c_id_no = myResultSet.getInt("c_id_no");

				Statement stmt2 = myConn.createStatement();
				sql = "select * from course where c_id='"+c_id+"' and c_id_no="+c_id_no;
				ResultSet rs = stmt2.executeQuery(sql);
				
				if (rs.next()) {
					c_name = rs.getString("c_name");
					c_grade = rs.getInt("c_grade");
					c_unit = rs.getInt("c_unit");
					c_major = rs.getString("c_major");
				}
				rs.close();
				stmt2.close();

				stmt2 = myConn.createStatement();
				String mySQL2 = "select * from teach where c_id='" + c_id + "' and c_id_no = " + c_id_no
						+ " and t_year = " + nYear + " and t_semester = " + nSemester;
				ResultSet myResultSet2 = stmt2.executeQuery(mySQL2);
				if (myResultSet2.next()) {
					p_id = myResultSet2.getString("p_id");
					t_day = myResultSet2.getString("t_day");
					t_time = myResultSet2.getString("t_time");
					t_room = myResultSet2.getString("t_room");
					t_year = myResultSet2.getInt("t_year");
					t_semester = myResultSet2.getInt("t_semester");
					t_max = myResultSet2.getInt("t_max");
				}

				mySQL2 = "select * from professor where p_id='" + p_id + "'";
				myResultSet2 = stmt2.executeQuery(mySQL2);
				if (myResultSet2.next()) {
					p_name = myResultSet2.getString("p_name");
				}

				mySQL2 = "select COUNT(*) from enroll where c_id = '" + c_id + "' and c_id_no = '" + c_id_no
						+ "' and e_year = " + nYear + " and e_semester = " + nSemester;
				myResultSet2 = stmt2.executeQuery(mySQL2);
				if (myResultSet2.next()) {
					studentNum = myResultSet2.getInt(1);
				}
				
		%>
		<tr>
			<td><%=c_id%></td>
			<td><%=c_id_no%></td>
			<td><%=c_name%></td>
			<td><%=c_unit %></td>
			<td><%=c_grade%></td>
			<td><%=c_major%></td>
			<td><%=t_room%></td>
			<td><%=t_year%></td>
			<td><%=t_semester %></td>
			<td><%=t_day%></td>
			<td><%=t_time%></td>
		</tr>
		<%
	}
	String countClass = "SELECT COUNT(*), SUM(C.C_UNIT) FROM ENROLL E, COURSE C WHERE S_ID="+session_id + "AND E.C_ID = C.C_ID AND E.C_ID_NO = C.C_ID_NO" ;		
	Statement stmt2 = myConn.createStatement();
	ResultSet rs2 =  stmt2.executeQuery(countClass);
	int total_unit = 0, total_enroll = 0;
	if(rs2!=null && rs2.next()) {
		total_enroll = rs2.getInt(1);
		total_unit = rs2.getInt(1);%>
	<tr align="center">
			<td colspan="4" style="text-align:right">�� ���� ���� : <%=total_enroll%> </td>
			<td colspan="4">�� ���� ���� : <%=total_unit%> </td>
	</tr>	
	
	<% }
	
} catch (SQLException ex) {
	System.err.println("SQLException: " + ex.getMessage());
}finally {
	cstmt.close();
	stmt.close();
	myConn.close();		
}
		%>
	</table>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>