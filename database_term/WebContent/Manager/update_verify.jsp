<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="conn.ConnectionManager" %>
<html>
<head>
<title> 수강신청 사용자 정보 수정 </title>
<META HTTP-EQUIV="contentType" CONTENT="text/html;charset=UTF-8"/>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String userName = request.getParameter("userName"); 
String userPassword = request.getParameter("userPassword");
String userEmail = request.getParameter("userEmail"); 
String userMajor = request.getParameter("userMajor");
String userType = request.getParameter("userType");
String userID = request.getParameter("userID");

ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

PreparedStatement pstmt = null;

String sMessage = "수정되었습니다.";
String direction = null; 


try { 
String mySQL = null;
if (userType.equals("manager"))
 	mySQL = "update "+ userType +" set m_pwd=?, m_name=?, m_email=? where m_id = ?";

else if (userType.equals("student"))
	mySQL ="update "+ userType +" set s_pwd=?, s_name=?, s_email=?, s_major=? where s_id = ?";

 else 
	mySQL ="update "+ userType +" set p_pwd=?, p_name=?, p_email=?, p_major=? where p_id = ?";


pstmt = conn.prepareStatement(mySQL);
pstmt.setString(1, userPassword);
pstmt.setString(2, userName);
pstmt.setString(3, userEmail);
if(!userType.equals("manager")){
	pstmt.setString(4, userMajor);
	pstmt.setString(5, userID);
}
else 
	pstmt.setString(4, userID);

pstmt.executeUpdate();
out.write(pstmt.toString());
direction = "../"+userType+"_list.jsp";
conn.commit();

 } catch(SQLException ex) {
	  out.write(ex.toString());
   	  if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
	  else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
	  else sMessage="잠시 후 다시 시도하십시오";
   	  conn.rollback();
   	  direction = "update.jsp";
} finally{
	pstmt.close();
	conn.close();
	//response.sendRedirect(direction);
 }
%>
</body></html>
