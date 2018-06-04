<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="conn.ConnectionManager" %>

<% 
String userName = request.getParameter("userName"); 
String userID = request.getParameter("userID"); 
String userPassword = request.getParameter("userPassword");
String userEmail = request.getParameter("userEmail");
String userMajor = request.getParameter("userMajor");
String userType = request.getParameter("userType");

ConnectionManager conn_manager = new ConnectionManager();
Connection myConn = conn_manager.getConnection();

String sql = "INSERT INTO " + userType;

if(userType.equals("professor"))
	sql += " (p_id, p_pwd, p_name, p_major, p_email) VALUES ( ?, ?, ?, ?, ?)";
else 
	sql += " (s_id, s_pwd, s_name, s_major, s_email) VALUES ( ?, ?, ?, ?, ?)";


PreparedStatement stmt = myConn.prepareStatement(sql);
stmt.setString(1,userID);
stmt.setString(2,userPassword);
stmt.setString(3,userName);
stmt.setString(4,userMajor);
stmt.setString(5,userEmail);

String sMessage = "";

try{
stmt.executeUpdate();
myConn.commit();
response.sendRedirect("main.jsp");
} catch (SQLException ex) {
	 out.write(ex.toString());
  	  if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
  	  else if (ex.getErrorCode() ==20004) sMessage="아이디는 숫자 7자리입니다.";
	  else sMessage="잠시 후 다시 시도하십시오";
  	  response.sendRedirect("create_user.jsp");
  	  out.println("<script>alert('"+sMessage+"');</script>");
}%>
</body></html>