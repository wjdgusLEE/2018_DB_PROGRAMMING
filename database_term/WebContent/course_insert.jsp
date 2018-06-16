<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="session.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의 개설</title>
</head>
<body>
<%
if (session_id == null) 
	response.sendRedirect("login.jsp");
else if (!isProfessor) {
	%> <script> alert("권한이 없습니다.");  
		location.href="main.jsp";	</script> <%
}
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
	<td><div align="center"><select name="t_time">
    <option value="">시간 선택</option>
    <option value="9:00-10:15">9:00-10:15</option>
    <option value="10:30-11:45">10:30-11:45</option>
    <option value="12:00-13:15">12:00-13:15</option>
    <option value="13:30-14:45">13:30-14:45</option>
 	<option value="15:00-16:15">15:00-16:15</option>
 	<option value="17:00-18:15">17:00-18:15</option>
	</select></div>
	</td>	
	</tr>
	<tr>
	<td><div align="center">강의실</div></td>
	<td><div align="center"><input type="text" placeholder="명신413" name="t_room" required></div></td>	
	</tr>
	<tr>
	<td><div align="center">요일</div></td>
	<td><div align="center"><input type="text" placeholder="월,수" name="t_day" required></div></td>	
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
  <input type="reset" value="취소">
  <input type="submit"  value="등록">
 
  </div>
  </FORM>

</body>
</html>