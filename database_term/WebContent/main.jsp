<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
<!-- Bootstrap -->
</head>
<body>
	<%@ include file="top.jsp"%>
	<%
		if (isManager)
			response.sendRedirect("account_students.jsp");

		else if (isProfessor)
			response.sendRedirect("professor_all.jsp");

		else if (isStudent)
			response.sendRedirect("student_all.jsp");

		else
			response.sendRedirect("login.jsp");
	%>
</body>
</html>