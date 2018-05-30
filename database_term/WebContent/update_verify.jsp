<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<html>
<head><title> 수강신청 사용자 정보 수정 </title></head>
<body>
<%
String session_id = (String)session.getAttribute("user");
String log; if (session_id==null)    log="<a href=\"login.jsp\">로그인</a>"; else log="<a href=logout.jsp>로그아웃</a>";
String userID = request.getParameter("userID"); 
String userPassword = request.getParameter("userPassword");
String dbdriver = "oracle.jdbc.driver.OracleDriver";

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1515386";
String passwd = "ss3";

Connection myConn = null;
Statement stmt = null;
try { 
Class.forName(dbdriver); 
myConn =  DriverManager.getConnection (dburl, user, passwd);
String mySQL = "update student set s_id='" +userID+"', s_pwd='"+userPassword+"' where s_id = '"+session_id +"'";  
stmt = myConn.createStatement();
stmt.executeUpdate(mySQL);
%>
<script>
alert('수정되었습니다.');
location.href="main.jsp";
</script>
<%
 } catch(SQLException ex) {
  	   String sMessage;
   	   if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";	
 }
%>
<script>
alert('잘못된 입력 값입니다.');
location.href="update.jsp";
</script>
</body></html>
