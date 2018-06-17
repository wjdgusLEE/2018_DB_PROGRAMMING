<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.ConnectionManager" %>

<!doctype html>
<html lang="en">
<head>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<table class="table table-hover">
	<tr>
	<th>아이디</th><th>이름</th>
	<th>비밀번호</th><th>전공</th>
	<th>학년</th><th>이메일</th><th colspan="2">관리</th>
	</tr>  
<%
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String mySQL = "select s_id, s_name, s_pwd, s_major, s_grade, s_email from student";
Statement stmt=conn.createStatement();

ResultSet result = stmt.executeQuery(mySQL);
try { 
	while (result != null && result.next())  {
		%>
		  <tr>
		   <td><%=result.getString("s_id") %></td><td><%=result.getString("s_name") %></td>
			<td><%=result.getString("s_pwd") %></td><td><%=result.getString("s_major") %></td>
			<td><%=result.getString("s_grade") %></td><td><%=result.getString("s_email") %></td>
			<td><a href="account_update.jsp?editID=<%=result.getString("s_id")%>&editType=student">수정</a></td>
			<td><a href="account_delete.jsp?deleteID=<%=result.getString("s_id")%>&deleteType=student">삭제</a></td>
		  </tr>
		<% }	
	
} catch (SQLException ex) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"학생이없습니다.\")");
	script.println("location.href='main.jsp'");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} %>
</table>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>