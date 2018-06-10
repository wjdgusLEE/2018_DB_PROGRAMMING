<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.ConnectionManager" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  </head>
  <body>
    	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else if (!isProfessor) {
	%>
	<script>
		alert("권한이 없습니다.");
		location.href = "main.jsp";
	</script>
	<%
		}
  %>
  
<table width="75%" align="center" border>   
	<tr>
	<th><div align="center">과목번호</div></th><th><div align="center">분반</div></th>
	<th><div align="center">강의명</div></th><th><div align="center">전공</div></th>
	<th><div align="center">학점</div></th><th><div align="center">학년</div></th>
	<th><div align="center">학기</div></th><th><div align="center">요일</div></th>
	<th><div align="center">시간</div></th><th><div align="center">정원</div></th>
	</tr>  
<%
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

//String mySQL = "select * from (";
String mySQL = "select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max ";
mySQL += "from course c, teach t ";
mySQL += "where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no";

// String mySQL = "select * from ";
// mySQL += "( select c.c_id as id, c.c_id_no as no_id , count(*) as cnt ";
// mySQL += "from enroll e, course c where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in ( ";
// mySQL += "select c_id from teach where p_id = '"+session_id+"') group by c.c_id, c.c_id_no), course cmp where cmp.c_id = id and cmp.c_id_no = no_id";
Statement stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(mySQL);
try { 
	while (result != null && result.next())  {
		System.out.println(result.getString("id"));
		%>
		  <tr>
		  <td><div align="center"> <%= result.getString("id")%> </div></td> <td><div align="center"> <%=  result.getInt("id_no")%> </div></td>
		  <td><div align="center"> <%= result.getString("name")%> </div></td> <td><div align="center"> <%=  result.getString("major")%> </div></td>
		  <td><div align="center"> <%=  result.getInt("unit")%> </div></td> <td><div align="center"> <%=  result.getInt("grade")%> </div></td>
		  <td><div align="center"> <%=  result.getInt("semester")%> </div></td> <td><div align="center"> <%=  result.getString("day")%> </div></td>
		  <td><div align="center"> <%=  result.getInt("time")%> </div></td> <td><div align="center"> <%=  result.getInt("max")%> </div></td>
		  </tr>
		<% }	
	
} catch (SQLException ex) {
	System.out.println(ex);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"개설한 강의가 없습니다.\")");
		//script.println("location.href='main.jsp'");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} %>
  </table>

</body>
</html>