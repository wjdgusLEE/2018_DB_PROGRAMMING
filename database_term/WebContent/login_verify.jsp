<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<% String userID = request.getParameter("userID"); 
String userPassword = request.getParameter("userPassword");
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver); 
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1515386";
String passwd = "ss3";
Connection myConn =  DriverManager.getConnection (dburl, user, passwd);
String mySQL = "select s_id, s_pwd from student where s_id='" + userID + "' and s_pwd='" + userPassword + "'"; 
Statement stmt = myConn.createStatement();
ResultSet result = stmt.executeQuery(mySQL);
if(result.next()) {
	session.setAttribute("user", userID);
	%>
	<script>
 		alert("반갑습니다.");
  		location.href="main.jsp";
	</script>
	<%
}
stmt.close(); 
myConn.close();
%>
	<script>
 		alert("없는 회원 정보입니다.");
  		location.href="login.jsp";
	</script>
