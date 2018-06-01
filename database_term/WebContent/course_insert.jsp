<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="session.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>강의 개설</title>
</head>
<body>
<form method="post" action="course_insert_verify.jsp">

  <table width="75%" align="center">   
  	<tr>
	<td><div align="center">과목번호</div></td>
	<td><div align="center"><input type="text" name="c_id"></div></td>
	</tr>	
	<tr>
	<td><div align="center">강의명</div></td>
	<td><div align="center"><input type="text" name="c_name" ></div></td>
	</tr>
	<tr>
	<td><div align="center">전공</div></td>
	<td><div align="center"><input type="text" name="c_major"></div></td>
	</tr>
	<tr>
	<td><div align="center">학년</div></td>
	<td><div align="center"><input type="text" name="c_grade"></div></td>
	</tr>		
	<tr>
	<td><div align="center">학기</div></td>
	<td><div align="center"><input type="text" name="c_semester"></div></td>
	</tr>		
	<tr>
	<td><div align="center">학점</div></td>
	<td><div align="center"><input type="text" name="c_unit"></div></td>
	</tr>
  </table>
  <div class="clearfix">
	        		<input type="submit"  value="update"  style="width:100%; margin-top : 10px; height : 3em;">

	      		</div>
  </FORM>

</body>
</html>