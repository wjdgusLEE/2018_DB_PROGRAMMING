<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="session.jsp"%>
<%@ page import="conn.ConnectionManager" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
if (session_id == null) 
	response.sendRedirect("login.jsp");
else if (!isProfessor) {
	%> <script> alert("권한이 없습니다.");  
		location.href="main.jsp";	</script> <%
}

String c_id = request.getParameter("c_id");
String c_name = request.getParameter("c_name"); 
String c_major = request.getParameter("c_major");
int c_grade = Integer.parseInt(request.getParameter("c_grade"));
int c_unit = Integer.parseInt(request.getParameter("c_unit"));
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
String p_id = session_id;
String t_time = request.getParameter("t_time");
String t_day = request.getParameter("t_day");
int t_year = Integer.parseInt(request.getParameter("t_year"));
int t_semester = Integer.parseInt(request.getParameter("t_semester"));
int t_max = Integer.parseInt(request.getParameter("t_max"));
Statement stmt = null;
String t_room = request.getParameter("t_room");

String sMessage = "수정되었습니다.";
String location = "main.jsp";
try { 
	ConnectionManager conn_manager = new ConnectionManager();
	Connection myConn = conn_manager.getConnection();
	String mySQL = "{? = call checkCourse(?, ?, ?, ?, ?, ?)}";	
	CallableStatement cstmt = myConn.prepareCall(mySQL);
	cstmt.registerOutParameter(1, Types.INTEGER);
	cstmt.setString(2, c_id);
	cstmt.setInt(3, c_id_no);
	cstmt.setString(4, c_name);
	cstmt.setInt(5, c_unit);
	cstmt.setInt(6, c_grade);
	cstmt.setString(7, c_major);
	cstmt.execute();
	int result = cstmt.getInt(1);
	if (result == 1) {
		%> <script> alert("개설이 완료되었습니다."); </script> <%
		response.sendRedirect("professor_all.jsp");
	}			
	else if (result == -1) {
		%> <script> alert("같은 과목이 이미 있습니다."); 
		history.go(-1);
		</script>  
		<%
	}
	else {
		System.out.println(result);
	}
	
	cstmt.close();
		
 } catch(SQLException ex) {
	  out.write(ex.toString());
	  sMessage="잠시 후 다시 시도하십시오";	 ;	  
 }

%>

</body>
</html>