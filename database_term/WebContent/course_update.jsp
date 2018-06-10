<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="session.jsp" %>
<%@ page import="conn.ConnectionManager"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의 정보 수정</title>
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

String sql = "select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max ";
sql += "from course c, teach t ";
sql += "where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no";

Statement stmt = conn.createStatement();

ResultSet result = stmt.executeQuery(sql);

%>

<form method="post" action="course_insert_verify.jsp">

  <table width="75%" align="center">   
  	<tr>
	<td><div align="center">과목번호</div></td>
	<td><div align="center"><input type="text" name="c_id" required></div></td>
	</tr>	
	<tr>
	<td><div align="center">강의명</div></td>
	<td><div align="center"><input type="text" name="c_name" required></div></td>
	</tr>
	<tr>
	<td><div align="center">분반</div></td>
	<td><div align="center"><input type="text" name="c_id_no" required></div></td>
	</tr>
	<tr>
	<td><div align="center">전공</div></td>
	<td><div align="center"><input type="text" name="c_major" required></div></td>
	</tr>
	<tr>
	<td><div align="center">시간</div></td>
	<td><div align="center"><input type="text" name="t_time" required></div></td>	
	</tr>
	<tr>
	<td><div align="center">강의실</div></td>
	<td><div align="center"><input type="text" name="t_room" required></div></td>	
	</tr>
	<tr>
	<td><div align="center">요일</div></td>
	<td><div align="center"><input type="text" name="t_day" required></div></td>	
	</tr>	
	<tr>
	<td><div align="center">학년</div></td>
	<td><div align="center"><input type="text" name="c_grade" required></div></td>
	</tr>		
	<tr>
	<td><div align="center">연도</div></td>
	<td><div align="center"><input type="text" name="t_year" required></div></td>
	</tr>			
	<tr>
	<td><div align="center">학기</div></td>
	<td><div align="center"><input type="text" name="t_semester" required></div></td>
	</tr>		
	<tr>
	<td><div align="center">학점</div></td>
	<td><div align="center"><input type="text" name="c_unit" required></div></td>
	</tr>
	<tr>
	<td><div align="center">정원</div></td>
	<td><div align="center"><input type="text" name="t_max"></div></td>
	</tr>
  </table>
  <div class="clearfix" align="center">
  <input type="submit"  value="등록">
  <input type="reset" value="취소">
 
  </div>
  </FORM>

</body>
</html>