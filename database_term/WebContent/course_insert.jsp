<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의 개설</title>
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
%>

<form  class="form-horizontal" method="post" action="course_insert_verify.jsp">

  <table class="table table-hover">   
  	<tr>
	<td>과목번호</td>
	<td><input type="text" name="c_id" required></td>
	</tr>	
	<tr>
	<td>강의명</td>
	<td><input type="text" name="c_name" required></td>
	</tr>
	<tr>
	<td>분반</td>
	<td><input type="text" name="c_id_no" required></td>
	</tr>
	<tr>
	<td>전공</td>
	<td><input type="text" name="c_major" required></td>
	</tr>
	<tr>
<<<<<<< HEAD
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
=======
	<td>시간</td>
	<td><input type="text" name="t_time" required></td>	
	</tr>
	<tr>
	<td>강의실</td>
	<td><input type="text" name="t_room" required></td>	
	</tr>
	<tr>
	<td>요일</td>
	<td><input type="text" name="t_day" required></td>	
>>>>>>> herin
	</tr>	
	<tr>
	<td>학년</td>
	<td><input type="text" name="c_grade" required></td>
	</tr>		
	<tr>
	<td>연도</td>
	<td><input type="text" name="t_year" required></td>
	</tr>			
	<tr>
	<td>학기</td>
	<td><input type="text" name="t_semester" required></td>
	</tr>		
	<tr>
	<td>학점</td>
	<td><input type="text" name="c_unit" required></td>
	</tr>
	<tr>
	<td>정원</td>
	<td><input type="text" name="t_max"></td>
	</tr>
  </table>
  <input type="reset" class="btn" value="취소">
  <input type="submit" class="btn" value="등록">

  </FORM>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>