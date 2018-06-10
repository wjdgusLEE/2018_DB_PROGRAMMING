<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ include file="../top.jsp" %> 
<%@ page import="conn.ConnectionManager" %>

<html>
<head><title>계정 생성</title></head>
<body>
<form method="post" action="create_user_verify.jsp">
<table>
<tr><td>이름</td><td><input type="text" name="userName" placeholder="이름"></td></tr>
<tr><td>아이디</td><td><input type="text" name="userID" placeholder="아이디"></td></tr>
<tr><td>비밀번호</td><td><input type="text" name="userPassword" placeholder="비밀번호 4자리 이상 "></td></tr>
<tr>
<td>타입</td>
<td>
<input type="radio" name="userType" value="student" checked="checked">학생
<input type="radio" name="userType" value="professor">교수
</td>
</tr>
<tr>
<td>전공</td>
<td>
<select name="userMajor">
<% 
	ConnectionManager conn_manager = new ConnectionManager();
	Connection myConn = conn_manager.getConnection();
	
	String mySQL = "select * from major" ;
	Statement stmt = myConn.createStatement();
	ResultSet rs = stmt.executeQuery(mySQL);
	while(rs!=null&&rs.next()){
		String major = rs.getString(1);
%>
  <option value=<%=major%>> <%=major%></option>
<%}%>
</select>
</td>
</tr>
<tr><td>이메일</td><td><input type="text" name="userEmail" placeholder="xxxx@xxxxx.com "></td></tr>
</table>
<input type="submit"  value="create"  style="width:100%; margin-top : 10px; height : 3em;">
</form>
</body>
</html>