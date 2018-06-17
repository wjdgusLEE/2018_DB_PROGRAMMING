<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
	<%@ include file="top.jsp"%>
	<table class="table table-striped">
		<%
			if (isManager)
				response.sendRedirect("student_list.jsp");
			
			else if (isProfessor) 
					response.sendRedirect("professor_all.jsp");
					
			else if (isStudent) 
				response.sendRedirect("student_all.jsp");
			
			else 
				response.sendRedirect("login.jsp");
			
		%>
	</table> 
	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body> 
</html>
