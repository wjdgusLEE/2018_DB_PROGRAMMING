<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="session.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
if (session_id == null || type == null) 
	response.sendRedirect("login.jsp");

String c_id = request.getParameter("c_cid");
String c_name = request.getParameter("c_name"); 
String c_major = request.getParameter("c_major");
int c_grade = Integer.parseInt(request.getParameter("c_grade"));
int c_unit = Integer.parseInt(request.getParameter("c_unit"));
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
String p_id = session_id;

String dbdriver = "oracle.jdbc.driver.OracleDriver";

String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1512602";
String passwd = "oracle";

Connection myConn = null;
Statement stmt = null;

String sMessage = "수정되었습니다.";
String location = "main.jsp";
try { 
	Class.forName(dbdriver); 
	myConn =  DriverManager.getConnection (dburl, user, passwd);
	String mySQL;
	mySQL = "insert into course values(?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = myConn.prepareStatement(mySQL);
	pstmt.setString(1, c_id);
	pstmt.setInt(2, c_id_no);
	pstmt.setString(3, c_name);
	pstmt.setInt(4, c_unit);
	pstmt.setInt(5, c_grade);
	pstmt.setString(6, c_major);
 
	response.sendRedirect("main.jsp");
 } catch(SQLException ex) {
	  out.write(ex.toString());
	  sMessage="잠시 후 다시 시도하십시오";	 ;	  
 }
%>

</body>
</html>