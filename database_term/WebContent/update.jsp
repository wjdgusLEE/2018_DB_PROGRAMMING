<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
<body>
<%@ include file="top.jsp" %>
<% 
	if (session_id==null) response.sendRedirect("login.jsp");
	

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Connection myConn = null;
	Statement stmt = null;
	String userID = null;
	String userPwd = null;
	try {
		Class.forName(dbdriver); 
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db1515386";
		String passwd = "ss3";
		myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();
		String mySQL = "select s_id, s_pwd from student where s_id='" + session_id + "'" ;

		ResultSet result = stmt.executeQuery(mySQL);
		
		if( result!=null && result.next()) {
			userID = result.getString(1);
			userPwd = result.getString(2);
		} 
	}catch(Exception ex) {
		System.out.println(ex.toString());
	}finally {stmt.close();
	myConn.close();}
%>
<form method="post" action="update_verify.jsp">
  <table width="75%" align="center" border>   
  <tr>
  <td>
 <div align="center">아이디</div></td> 
 <td><div align="center"><input type="text" name="userID" value="<%=userID%>"></div></td>
   </tr>
   <tr>
   <td>
 <div align="center">비밀번호</div></td> <td><div align="center"><input type="text" name="userPassword" value="<%=userPwd%>"></div></td>
 </tr>
  </table>
  <div class="clearfix">
	        		<input type="submit"  value="login"  style="width:100%; margin-top : 10px; height : 3em;">
	      		</div>
  </FORM>
  </BODY></HTML>
