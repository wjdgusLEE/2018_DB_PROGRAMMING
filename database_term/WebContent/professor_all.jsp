<li><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>
<%
if (session_id == null)
			response.sendRedirect("login.jsp");
else if (!isProfessor) {
%>
	<script>
		alert("������ �����ϴ�.");
		location.href = "main.jsp";
	</script>
<% } %>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>���� ����</title>
</head>
<body>
<table class="table table-hover">   
	<tr>
		<th>�����ȣ</th>
		<th>�й�</th>
		<th>���Ǹ�</th>
		<th>���ǽ�</th>
		<th>����</th>
		<th>����</th>
		<th>����</th>
		<th>�г�</th>
		<th>�б�</th>
		<th>����</th>
		<th>�ð�</th>
		<th>��û&nbsp;/&nbsp;����</th>
		<th colspan="2">����</th>
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
		int count=0;
		String s = "select COUNT(*) as count from enroll where c_id='"+result.getString("id")+"' AND c_id_no="+result.getInt("id_no");
		Statement st = conn.createStatement();
		ResultSet re = st.executeQuery(s);
		if (re != null && re.next()) {
			count = re.getInt("count");
		}
		re.close();
		st.close();
		
		
		%>
			<tr>
			<td><%=result.getString("id")%></td>
			<td><%=result.getInt("id_no")%></td>
			<td><%=result.getString("name")%></td>
			<td><%=result.getString("room")%></td>
			<td><%=result.getString("major")%></td>
			<td><%=result.getInt("unit")%></td>
			<td><%=result.getInt("year")%></td>				
			<td><%=result.getInt("grade")%></td>
			<td><%=result.getInt("semester")%></td>
			<td><%=result.getString("day")%></td>
			<td><%=result.getString("time")%></td>
			<td><%= count %> &nbsp; / &nbsp; <%=result.getInt("max")%></td>
			<td><a href="course_delete.jsp?c_id=<%=result.getString("id")%>&c_id_no=<%=result.getInt("id_no")%>">����</a></td>
			<td><a href="course_update.jsp?c_id=<%=result.getString("id")%>&c_id_no=<%=result.getInt("id_no")%>">����</a></td>
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
} finally {
	result.close();
	stmt.close();
	conn.close();
}

%>
  </table>
  	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>