<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
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