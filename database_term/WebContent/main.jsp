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
			if (session_id != null) {
		%>
		<tr>
			<td align="center"><%=session_id%>님 방문을 환영합니다.</td>
		</tr>
		<%
			} else {
		%>
		<tr>
			<td align="center">로그인한 후 사용하세요.</td>
		</tr>
		<%
			}
		%>
	</table> 
	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body> 
</html>
