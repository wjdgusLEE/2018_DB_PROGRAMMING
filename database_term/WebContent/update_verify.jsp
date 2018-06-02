<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>

<body>

	<%
		String s_id = request.getParameter("s_id");
		String s_email = new String(request.getParameter("s_email").getBytes("Cp1252"), "UTF-8");
		String s_pwd = new String(request.getParameter("s_pwd"));

		Connection myConn = null;
		Statement stmt = null;
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
		
		mySQL = "update student ";
		mySQL = mySQL + " set s_email ='" + s_email + "' , ";
		mySQL = mySQL + " s_pwd ='" + s_pwd + "' where s_id='" + s_id + "' ";

		try {
			stmt.executeQuery(mySQL);
	%>

	<script>
		alert("학생 정보가 수정되었습니다."); location.href="update.jsp";
	</script>

	<%
		} catch (SQLException ex) {
			String sMessage;

			if (ex.getErrorCode() == 20002)
				sMessage = "암호는 4자리 이상이어야 합니다";

			else if (ex.getErrorCode() == 20003)
				sMessage = "암호에 공란은 입력되지 않습니다.";

			else
				sMessage = "잠시 후 다시 시도하십시오";
	%>

	<script>
		alert("<%=sMessage%>");
		location.href = "update.jsp";
	</script>

	<%
		} finally {
			if (stmt != null)
				try {
					stmt.close();
					myConn.close();
				}
				catch (SQLException ex) {
				}
		}
	%>
</body>
</html>