<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
<body>

<%@ include file="session.jsp" %>
<% 
	if (session_id==null||type == null) response.sendRedirect("login.jsp");

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Connection myConn = null;
	Statement stmt = null;
		Class.forName(dbdriver); 
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db1512602";
		String passwd = "oracle";
		myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();

		String mySQL;
		// out.write(type);
		if (isManager)
		 	mySQL = "select m_name, m_pwd, m_email from "+ type +" where m_id='" + session_id + "'" ;
		else if (isStudent)
		 	mySQL = "select s_name, s_pwd, s_email, s_major from "+ type +" where s_id='" + session_id + "'" ;
		else
		 	mySQL = "select p_name, p_pwd, p_email, p_major from "+ type +" where p_id='" + session_id + "'" ;
		
		ResultSet result = stmt.executeQuery(mySQL);

		String [] userInfo = new String[4];
		try {
		if( result!=null && result.next()) {
			userInfo[0] = result.getString(1);
			userInfo[1] = result.getString(2);
			userInfo[2] = result.getString(3);
			if (!isManager) 
				userInfo[3] = result.getString(4);
		} 
	}catch(Exception ex) {
		System.out.println(ex.toString());
	}finally {stmt.close();
	myConn.close();}
%>
<form method="post" action="update_verify.jsp">

  <table width="75%" align="center">   

	<tr>
	<td><div align="center">이름</div></td>
	<td><div align="center"><input type="text" name="userName" value=<%=userInfo[0]%>></div></td>
	</tr>
	<tr>
	<td><div align="center">비밀번호</div></td>
	<td><div align="center"><input type="text" name="userPassword" value=<%=userInfo[1]%>></div></td>
	</tr>	
<%if( !isManager ) {%>
	<tr>
	<td><div align="center">전공</div></td>
	<td><div align="center"><input type="text" name="userMajor" value=<%=userInfo[3]%>></div></td>
	</tr>
<%}%>
	<tr>
	<td><div align="center">이메일</div></td>
	<td><div align="center"><input type="text" name="userEmail" value=<%=userInfo[2]%>></div></td>
	</tr>		
	
  </table>
  <div class="clearfix">
	        		<input type="submit"  value="update"  style="width:100%; margin-top : 10px; height : 3em;">

	      		</div>
  </FORM>
  </BODY></HTML>
