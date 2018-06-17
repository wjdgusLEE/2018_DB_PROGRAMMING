<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="conn.ConnectionManager"%>
<% request.setCharacterEncoding("utf-8"); %>
<% 
String userName = request.getParameter("userName"); 
String userID = request.getParameter("userID"); 
String userPassword = request.getParameter("userPassword");
String userEmail = request.getParameter("userEmail");
String userMajor = request.getParameter("userMajor");
String userType = request.getParameter("userType");

String userGrade = null, userLab=null;
if(userType.equals("student"))
	userGrade = request.getParameter("userGrade");
else 
	userLab = request.getParameter("userLab");

ConnectionManager conn_manager = new ConnectionManager();
Connection myConn = conn_manager.getConnection();

String sMessage = "";
String sql = "INSERT INTO " + userType;


 PrintWriter script = response.getWriter();
 String redirection = "account_students";
try{
if(userType.equals("professor"))
	sql += " (p_id, p_pwd, p_name, p_major, p_email, p_room) VALUES ( ?, ?, ?, ?, ?, ?)";
else 
	sql += " (s_id, s_pwd, s_name, s_major, s_email, s_grade) VALUES ( ?, ?, ?, ?, ?, ?)";


PreparedStatement stmt = myConn.prepareStatement(sql);
stmt.setString(1,userID);
stmt.setString(2,userPassword);
stmt.setString(3,userName);
stmt.setString(4,userMajor);
stmt.setString(5,userEmail);
if(userType.equals("student"))
	stmt.setString(6, userGrade);
else 
	stmt.setString(6, userLab);

stmt.executeUpdate();
myConn.commit();
script.println("<script>");
script.println("alert(\"성공적으로 생성되었습니다.\")");
script.println("</script>");
} catch (SQLException ex) {
	 out.write(ex.toString());
  	  if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
  	  else if (ex.getErrorCode() ==20004) sMessage="아이디는 숫자 7자리입니다.";
	  else sMessage="잠시 후 다시 시도하십시오";
	script.println("<script>");
	script.println("alert(\""+sMessage+"\")");
	script.println("</script>");  	
	redirection = "account_create.jsp";
} 

script.println("<script>");
script.println("location.href='"+redirection+"'");
script.println("</script>");
%>
</body>
</html>