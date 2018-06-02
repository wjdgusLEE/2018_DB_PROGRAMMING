<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String session_id = (String) session.getAttribute("user");
	String log;
	if (session_id == null)
		log = "<a href=login.jsp>로그인</a>";
	else
		log = "<a href=logout.jsp>로그아웃</a>";
%>
<table width="75%" align="center" bgcolor="#FFFF99" border>
	<tr>
		<td align="center"><b><%=log%></b></td>
		<td align="center"><b><a href="update.jsp">학생 정보 수정</b></td>
		<td align="center"><b><a href="course_enorll.jsp">수강신청</b></td>
		<td align="center"><b><a href="course_drop.jsp">수강삭제</b></td>
		<td align="center"><b><a href="student_all.jsp">수강조회</b></td>
	</tr>
</table>