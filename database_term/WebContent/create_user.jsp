<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ include file="top.jsp" %> 
<html>
<head><title>계정 생성</title></head>
<body>
<table>
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
<select>
<% 
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Connection myConn = null;
	
	Class.forName(dbdriver); 
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1515386";
	String passwd = "ss3";
	myConn =  DriverManager.getConnection (dburl, user, passwd);
	String mySQL = "select * from major" ;
	Statement stmt = myConn.createStatement();
	ResultSet rs = stmt.executeQuery(mySQL);
	while(rs!=null&&rs.next()){
		String major = rs.getString(1);
%>
  <option value=<%=major %>> <%=major%></option>
<%} %>
</select>
</td>
</tr>
<tr><td>이메일</td><td><input type="text" name="userEmail" placeholder="xxxx@xxxxx.com "></td></tr>
</table>
</body>
</html>
