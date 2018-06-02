<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
<<<<<<< HEAD
	<%@ include file="top.jsp"%>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");

		Connection myConn = null;
		Statement stmt = null;

		ResultSet myResultSet = null;
		String mySQL = "";
		
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db1512173";
		String passwd = "wjdgus12";

		String dbdriver = "oracle.jdbc.driver.OracleDriver";

		try {

			Class.forName(dbdriver);
			myConn = DriverManager.getConnection(dburl, user, passwd);
			stmt = myConn.createStatement();

		} catch (SQLException ex) {

			System.err.println("SQLException: " + ex.getMessage());

		}
		mySQL = "select s_email,s_pwd from student where s_id='" + session_id + "'";
		myResultSet = stmt.executeQuery(mySQL);

		if (myResultSet.next()) {

			String s_email = myResultSet.getString("s_email");

			String s_pwd = myResultSet.getString("s_pwd");
	%>

	<form method="post" action="update_verify.jsp">

		<input type="hidden" name="s_id" size="30" value="<%=session_id%>">

		<table width="75%" align="center" border>

			<tr>
				<th>email 주소</th>

				<td><input type="text" name="s_email" size="50"
					value="<%=s_email%>"></td>
			</tr>

			<tr>
				<th>패스워드</th>

				<td><input type="password" name="s_pwd" size="20"
					value="<%=s_pwd%>"></td>
			</tr>

			<%
				}
				stmt.close();
				myConn.close();
			%>

			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정"></td>
			</tr>

		</table>
	</form>
</body>
</html>
=======

<%@ include file="session.jsp" %>
<% 
	if (session_id==null||type == null) response.sendRedirect("login.jsp");

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Connection myConn = null;
	Statement stmt = null;
		Class.forName(dbdriver); 
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db1515386";
		String passwd = "ss3";
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
>>>>>>> 40a30b56a446ffff778c2aabe1668172f7949dd7
