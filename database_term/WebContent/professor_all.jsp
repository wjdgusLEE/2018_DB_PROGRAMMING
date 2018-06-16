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
		alert("권한이 없습니다.");
		location.href = "main.jsp";
	</script>
<% } %>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>강의 관리</title>
</head>
<body>
<table class="table table-hover">   
	<tr>
		<th>과목번호</th>
		<th>분반</th>
		<th>강의명</th>
		<th>강의실</th>
		<th>전공</th>
		<th>학점</th>
		<th>연도</th>
		<th>학년</th>
		<th>학기</th>
		<th>요일</th>
		<th>시간</th>
		<th>정원</th>
		<th>신청</th>
		<th colspan="2">관리</th>
	</tr>  
<%
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String mySQL = "select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, ";
mySQL += " c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, ";
mySQL += " t.t_time as time, t.t_max as max , cnt ";
mySQL += " from course c, teach t, ( select c.c_id as id, c.c_id_no as no_id , count(*) as cnt ";
mySQL += "   from enroll e, course c  "; 
mySQL += "   where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in  ";
mySQL += "   ( select c_id from teach where p_id = ?) group by c.c_id, c.c_id_no)  ";
mySQL += " where t.p_id=? AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no AND c.c_id = id and c.c_id_no = no_id";


PreparedStatement pstmt = conn.prepareStatement(mySQL);
pstmt.setString(1, session_id);
pstmt.setString(2, session_id);

ResultSet result = pstmt.executeQuery();
try { 
	while (result != null && result.next())  {
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
			<td><%=result.getInt("max")%></td>
			<td><%=result.getInt("cnt")%></td>
			<td><a href="course_delete.jsp?c_id=<%=result.getString("id")%>&c_id_no=<%=result.getInt("id_no")%>">삭제</a></td>
			<td><a href="course_update.jsp?c_id=<%=result.getString("id")%>&c_id_no=<%=result.getInt("id_no")%>">수정</a></td>
		</tr>
		<% }	
	
} catch (SQLException ex) {
	System.out.println(ex);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"개설한 강의가 없습니다.\")");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} finally {
	result.close();
	pstmt.close();
	conn.close();
}

%>
  </table>
  	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>