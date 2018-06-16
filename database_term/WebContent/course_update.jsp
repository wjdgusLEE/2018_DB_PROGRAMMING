<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="top.jsp" %>
<%@ page import="conn.ConnectionManager"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의 정보 수정</title>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

</head>
<body>
<%
if (session_id == null) 
	response.sendRedirect("login.jsp");
else if (!isProfessor) {
	%> <script> alert("권한이 없습니다.");  
		location.href="main.jsp";	</script> <%
}
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String c_id = request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));

String sql = "select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max ";
sql += "from course c, teach t ";
sql += "where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no AND c.c_id='"+c_id+"' AND c.c_id_no="+c_id_no;

Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery(sql);

try {
	if (rs!=null && rs.next()) {
%>

<form  class="form-horizontal"  method="post" action="course_update_verify.jsp">

  <table class="table table-hover">   
	<tr>
	<td><div align="center">강의명</div></td>
	<td><div align="center"><input type="text" name="c_name" value=<%= rs.getString("name") %> required></div></td>
	</tr>
	<tr>
	<td><div align="center">전공</div></td>
	<td><div align="center"><input type="text" name="c_major" value=<%= rs.getString("major") %> required></div></td>
	</tr>
	<tr>
	<td><div align="center">시간</div></td>
	<td><div align="center"><input type="text" name="t_time" value=<%= rs.getString("time") %> required></div></td>	
	</tr>
	<tr>
	<td><div align="center">강의실</div></td>
	<td><div align="center"><input type="text" name="t_room" value=<%= rs.getString("room") %> required></div></td>	
	</tr>
	<tr>
	<td><div align="center">요일</div></td>
	<td><div align="center"><input type="text" name="t_day" value=<%= rs.getString("day") %> required></div></td>	
	</tr>	
	<tr>
	<td><div align="center">학년</div></td>
	<td><div align="center"><input type="text" name="c_grade" value=<%= rs.getInt("grade") %> required></div></td>
	</tr>		
	<tr>
	<td><div align="center">연도</div></td>
	<td><div align="center"><input type="text" name="t_year" value=<%= rs.getInt("year") %> required></div></td>
	</tr>			
	<tr>
	<td><div align="center">학기</div></td>
	<td><div align="center"><input type="text" name="t_semester" value=<%= rs.getString("semester") %> required></div></td>
	</tr>		
	<tr>
	<td><div align="center">학점</div></td>
	<td><div align="center"><input type="text" name="c_unit" value=<%= rs.getInt("unit") %> required></div></td>
	</tr>
	<tr>
	<td><div align="center">정원</div></td>
	<td><div align="center"><input type="text" value=<%= rs.getInt("max") %> name="t_max"></div></td>
	</tr>
  </table>
  <input type="hidden" value=<%= rs.getString("id")%> name="c_id">
  <input type="hidden" name="c_id_no" value=<%= rs.getInt("id_no") %> required>
  <div class="clearfix" align="center">
  <input type="reset" class="btn" value="취소">
  <input type="submit" class="btn" value="등록"> 
  </div>
  </FORM>
<%	}
} catch (SQLException ex) {
	System.out.print(ex);
} finally {
	rs.close();
	stmt.close();
	conn.close();
}
%>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>