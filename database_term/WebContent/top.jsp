<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

String session_id = (String)session.getAttribute("user");
String type = (String)session.getAttribute("type");
String log; 
if (session_id==null||type==null)  log="<a href=\"login.jsp\">로그인</a>"; else log="<a href=logout.jsp>로그아웃</a>";
boolean isStudent = false;
boolean  isProfessor = false;
boolean isManager = false;
try {
isStudent = type.equals("student");
isProfessor = type.equals("professor");
isManager = type.equals("manager");
}catch (Exception ex){
 ex.printStackTrace();
}

%>
<table width="75%" align="center" bgcolor="#FFFF99" border> 
<tr> <td align="center"><b><%=log%></b></td> 
<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td> 
<td align="center"><b><a href="insert.jsp">수강신청 입력</b></td>
<td align="center"><b><a href="delete.jsp">수강신청 삭제</b></td> 
<td align="center"><b><a href="select.jsp">수강신청 조회</b></td>
</tr> </table>