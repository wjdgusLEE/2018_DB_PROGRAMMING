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
<title>���� ����</title>
  </head>
  <body>
    	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else if (!isProfessor) {
	%>
	<script>
		alert("������ �����ϴ�.");
		location.href = "main.jsp";
	</script>
	<%
		}
  %>
  
<table width="75%" align="center" border>   
	<tr>
		<th><div align="center">�����ȣ</div></th>
		<th><div align="center">�й�</div></th>
		<th><div align="center">���Ǹ�</div></th>
		<th><div align="center">����</div></th>
		<th><div align="center">����</div></th>
		<th><div align="center">�г�</div></th>
		<th><div align="center">�б�</div></th>
		<th><div align="center">����</div></th>
		<th><div align="center">�ð�</div></th>
		<th><div align="center">����</div></th>
		<th colspan="2"><div align="center">����</div></th>
	</tr>  
<%
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String mySQL = "select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max ";
mySQL += "from course c, teach t ";
mySQL += "where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no";

Statement stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(mySQL);
try { 
	while (result != null && result.next())  {
		%>
			<tr>
			<td><div align="center">
					<%=result.getString("id")%>
				</div></td>
			<td><div align="center">
					<%=result.getInt("id_no")%>
				</div></td>
			<td><div align="center">
					<%=result.getString("name")%>
				</div></td>
			<td><div align="center">
					<%=result.getString("major")%>
				</div></td>
			<td><div align="center">
					<%=result.getInt("unit")%>
				</div></td>
			<td><div align="center">
					<%=result.getInt("grade")%>
				</div></td>
			<td><div align="center">
					<%=result.getInt("semester")%>
				</div></td>
			<td><div align="center">
					<%=result.getString("day")%>
				</div></td>
			<td><div align="center">
					<%=result.getString("time")%>
				</div></td>
			<td><div align="center">
					<%=result.getInt("grade")%>
				</div></td>
			<td><div align="center">
			<a href="course_delete.jsp?c_id=<%=result.getString("id")%>&c_id_no=<%=result.getInt("id_no")%>">����</a>
			</td>
			<td><div align="center">
			<a href="course_update.jsp?c_id=<%=result.getString("id")%>&c_id_no=<%=result.getInt("id_no")%>">����</a>
			</td>
		</tr>
		<% }	
	
} catch (SQLException ex) {
	System.out.println(ex);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"������ ���ǰ� �����ϴ�.\")");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} %>
  </table>
</body>
</html>