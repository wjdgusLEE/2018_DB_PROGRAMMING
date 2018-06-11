<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="session.jsp" %> 
<%
if(isStudent){
%>
	<table width="75%" align="center" bgcolor="#FFFF99" border> 
	<tr> <td align="center"><b><%=log%></b></td> 
	<td align="center"><b><a href="update.jsp">개인 정보 수정</b></td> 
	<td align="center"><b><a href="course_enroll.jsp">수강신청 입력</b></td>
	<td align="center"><b><a href="course_drop.jsp">수강신청 삭제</b></td> 
	<td align="center"><b><a href="student_all.jsp">수강신청 조회</b></td>
	</tr> </table>
<%} else if (isProfessor) { %>
	<table width="75%" align="center" bgcolor="#FFFF99" border> 
	<tr> <td align="center"><b><%=log%></b></td> 
	<td align="center"><b><a href="update.jsp">개인 정보 수정</b></td> 
	<td align="center"><b><a href="course_insert.jsp">강의 개설</b></td>
	<td align="center"><b><a href="professor_all.jsp">강의 개설 현황 </b></td>
	</tr> </table>
<%} else if(isManager) { %>
<table width="75%" align="center" bgcolor="#FFFF99" border> 
<tr> <td align="center"><%=log%></td> 
<td align="center"><a href="update.jsp">개인 정보 수정</a></td> 
<td align="center"><a href="create_user.jsp">계정 생성</a></td> 
<td align="center"><a href="student_list.jsp">학생 관리</a></td>
<td align="center"><a href="professor_list.jsp">교수 관리</a></td>
</tr> </table>
<%}else { %>
<table width="75%" align="center" bgcolor="#FFFF99" border> 
<tr> <td align="center"><%=log%></td> 
	<td align="center">숙명여대 수강신청 시스템</td>
</tr> </table>
<%}%>