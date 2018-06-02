<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
=======
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="session.jsp" %>
>>>>>>> 40a30b56a446ffff778c2aabe1668172f7949dd7

<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>

<body>
<<<<<<< HEAD

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
=======
<%

String userName = request.getParameter("userName"); 
String userPassword = request.getParameter("userPassword");
String userEmail = request.getParameter("userEmail"); 
String userMajor = request.getParameter("userMajor");

String dbdriver = "oracle.jdbc.driver.OracleDriver";

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1515386";
String passwd = "ss3";

Connection myConn = null;
Statement stmt = null;

String sMessage = "수정되었습니다.";
String location = "main.jsp";
try { 
Class.forName(dbdriver); 
myConn =  DriverManager.getConnection (dburl, user, passwd);
String mySQL;
out.write(type+" "+session_id+" "+userPassword+" "+userName+" "+userEmail);
if (isManager)
 	mySQL = "update "+ type +" set m_pwd='" +userPassword+"', m_name='"+userName+"', m_email='"+userEmail+"' where m_id = '"+session_id +"'";
else if (isStudent)
 	mySQL = "update "+ type +" set s_pwd='" +userPassword+"', s_name='"+userName+"', s_email='"+userEmail+"', s_major='"+userMajor+"' where s_id = '"+session_id +"'";
else
 	mySQL = "update "+ type +" set p_pwd='" +userPassword+"', p_name='"+userName+"', p_email='"+userEmail+"', p_major='"+userMajor+"' where p_id = '"+session_id +"'";

out.write(mySQL);
stmt = myConn.createStatement();
stmt.executeUpdate(mySQL);
response.sendRedirect("main.jsp");
 } catch(SQLException ex) {
	  out.write(ex.toString());
   	  if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";	 ;
	  
   	//response.sendRedirect("update.jsp");
 }
%>

</body></html>
>>>>>>> 40a30b56a446ffff778c2aabe1668172f7949dd7
