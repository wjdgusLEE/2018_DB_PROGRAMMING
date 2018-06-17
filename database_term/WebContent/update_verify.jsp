
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="session.jsp"%>
<%@ page import="conn.ConnectionManager"%>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
	<%
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String userEmail = request.getParameter("userEmail");
		String userMajor = request.getParameter("userMajor");
		PrintWriter script = response.getWriter();
		ConnectionManager conn_manager = new ConnectionManager();
		Connection myConn = conn_manager.getConnection();
		Statement stmt = null;
		String sMessage = "수정되었습니다.";
		String location = "main.jsp";
		String mySQL;
		try {
			out.write(type + " " + session_id + " " + userPassword + " " + userName + " " + userEmail);
			if (isManager)
				mySQL = "update " + type + " set m_pwd='" + userPassword + "', m_name='" + userName + "', m_email='"
						+ userEmail + "' where m_id = '" + session_id + "'";
			else if (isStudent)
				mySQL = "update " + type + " set s_pwd='" + userPassword + "', s_name='" + userName + "', s_email='"
						+ userEmail + "', s_major='" + userMajor + "' where s_id = '" + session_id + "'";
			else
				mySQL = "update " + type + " set p_pwd='" + userPassword + "', p_name='" + userName + "', p_email='"
						+ userEmail + "', p_major='" + userMajor + "' where p_id = '" + session_id + "'";

			if (isManager)
				mySQL = "update " + type + " set m_pwd='" + userPassword + "', m_name='" + userName + "', m_email='"
						+ userEmail + "' where m_id = '" + session_id + "'";
			else if (isStudent)
				mySQL = "update " + type + " set s_pwd='" + userPassword + "', s_name='" + userName + "', s_email='"
						+ userEmail + "', s_major='" + userMajor + "' where s_id = '" + session_id + "'";
			else
				mySQL = "update " + type + " set p_pwd='" + userPassword + "', p_name='" + userName + "', p_email='"
						+ userEmail + "', p_major='" + userMajor + "' where p_id = '" + session_id + "'";
			out.write(mySQL);
			stmt = myConn.createStatement();
			stmt.executeUpdate(mySQL);
			script.println("<script>");
			script.println("alert(\"성공적으로 처리되었습니다.\")");
			script.println("</script>");
		} catch (SQLException ex) {
			myConn.rollback();
			if (ex.getErrorCode() == 20002)
				sMessage = "암호는 4자리 이상이어야 합니다.";
			else if (ex.getErrorCode() == 20003)
				sMessage = "암호에 공란은 입력되지 않습니다.";
			else
				sMessage = "잠시 후 다시 시도하십시오";
			location = "update.jsp";
			script.println("<script>");
			script.println("alert(" + sMessage + ")");
			script.println("</script>");
		} finally {
			myConn.commit();
			stmt.close();
			myConn.close();
		}
		script.println("<script>");
		script.println("location.href='" + location + "'");
		script.println("</script>");
	%>

</body>
</html>