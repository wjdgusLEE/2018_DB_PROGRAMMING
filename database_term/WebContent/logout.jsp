
<%@ page contentType="text/html; charset=UTF-8"%>
<HEAD>
<title>수강신청 시스템 로그아웃</title>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</HEAD>
<%
	session.invalidate();
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="main.jsp";
</script>