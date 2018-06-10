<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="session.jsp"%>
<%
	if (isStudent) {%>
	<table width="75%" align="center" bgcolor="#FFFF99" border> 
	<tr> <td align="center"><%=log%></td> 
	<td align="center"><a href="update.jsp">개인 정보 수정</a></td> 
	<td align="center"><a href="course_enroll.jsp">수강신청 입력</a></td>
	<td align="center"><a href="course_drop.jsp">수강신청 삭제</a></td> 
	<td align="center"><a href="student_all.jsp">수강신청 조회</a></td>
	</tr> </table>
<%} else if (isProfessor) { %>
	<table width="75%" align="center" bgcolor="#FFFF99" border> 
	<tr> <td align="center"><b><%=log%></b></td> 
	<td align="center"><b><a href="update.jsp">개인 정보 수정</b></td> 
	<td align="center"><b><a href="course_insert.jsp">강의 개설</b></td>
	<td align="center"><b><a href="course_delete.jsp">강의 삭제</b></td> 
	<td align="center"><b><a href="course_update.jsp">강의 정보 수정</b></td>
	<td align="center"><b><a href="professor_all.jsp">강의 개설 상태 </b></td>
	</tr> </table>
<%} else if(isManager) { %>
	<table width="75%" align="center" bgcolor="#FFFF99" border> 
	<tr> <td align="center"><b><%=log%></b></td> 
	<td align="center"><b><a href="update.jsp">개인 정보 수정</b></td> 
	<td align="center"><b><a href="delete.jsp">수업 삭제</b></td> 
	<td align="center"><b><a href="select.jsp">수업 신청 상태 </b></td>
	<td align="center"><b><a href="select.jsp">계정 생성 </b></td>
	</tr> </table>
<%}%>
