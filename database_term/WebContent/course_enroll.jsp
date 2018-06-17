<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
   <%
      if (session_id == null)
         response.sendRedirect("login.jsp");
	   ResultSet myResultSet = null;
	   ConnectionManager conn_manager = new ConnectionManager();
	   Connection myConn = conn_manager.getConnection();
	   Statement stmt = null;
	   CallableStatement cstmt = null;
	   String sql = "{? = call Date2EnrollYear(SYSDATE)}";
	   cstmt = myConn.prepareCall(sql);
	   cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
	   cstmt.execute();
	   int nYear = cstmt.getInt(1);
	   sql = "{? = call Date2EnrollSemester(SYSDATE)}";
	   cstmt = myConn.prepareCall(sql);
	   cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
	   cstmt.execute();
	   int nSemester = cstmt.getInt(1);
   %>
   
<h3 align="center">  <%=nYear%> 년도 <%=nSemester%> 학기</h3>
   <form method="post" action="enroll_verify.jsp">
      <table class="table table-hover">
         <br>
         <tr>
           <th>과목 번호</th>
			<th>과목명</th>
			<th>교수명</th>
			<th>학점</th>
			<th>요일</th>
			<th>시간</th>
			<th>장소</th>
			<th>관리</th>
         </tr>
 <%
    try {
         stmt = myConn.createStatement();
           
          String mySQL = "select * from course where c_id not in (select c_id from enroll where s_id = '" + session_id + "')";
            myResultSet = stmt.executeQuery(mySQL);
            while (myResultSet.next() != false) {
               String c_id = "", c_id_no = "", c_name = "", c_major = "", p_id = "", p_name = "";
               String t_day = "", t_time = "", t_room = "";
               int t_max = 0, c_unit = 0, studentNum = 0;
               c_id = myResultSet.getString("c_id");
               c_id_no = myResultSet.getString("c_id_no");
               c_name = myResultSet.getString("c_name");
               c_unit = myResultSet.getInt("c_unit");
               c_major = myResultSet.getString("c_major");
               Statement stmt2 = myConn.createStatement();
               String mySQL2 = "select * from teach where c_id='" + c_id + "' and c_id_no = '" + c_id_no
                     + "' and t_year = " + nYear + " and t_semester = " + nSemester;
               ResultSet myResultSet2 = stmt2.executeQuery(mySQL2);
               if (myResultSet2.next()) {
                  p_id = myResultSet2.getString("p_id");
                  t_day = myResultSet2.getString("t_day");
                  t_time = myResultSet2.getString("t_time");
                  t_room = myResultSet2.getString("t_room");
                  t_max = myResultSet2.getInt("t_max");
               }
               mySQL2 = "select * from professor where p_id='" + p_id + "'";
               myResultSet2 = stmt2.executeQuery(mySQL2);
               if (myResultSet2.next()) {
                  p_name = myResultSet2.getString("p_name");
               }
               mySQL2 = "select COUNT(*) from enroll where c_id = '" + c_id + "' and c_id_no = '" + c_id_no
                     + "' and e_year = " + nYear + " and e_semester = " + nSemester;
               myResultSet2 = stmt2.executeQuery(mySQL2);
               if (myResultSet2.next()) {
                  studentNum = myResultSet2.getInt(1);
               }
         %>

         <tr>
            <td><%=c_id%></td>
            <td><%=c_name%></td>
            <td><%=p_name%></td>
            <td><%=c_unit%></td>
            <td><%=t_day%></td>
            <td><%=t_time%></td>
            <td><%=t_room%></td>
         	<td><a href="enroll_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>&year=<%=nYear%>&semester=<%=nSemester%>">신청</a></td>
       </tr>     
         
         <%
            }
            String countClass = "SELECT COUNT(*), SUM(C.C_UNIT) FROM ENROLL E, COURSE C WHERE S_ID="+session_id + "AND E.C_ID = C.C_ID AND E.C_ID_NO = C.C_ID_NO" ;		
        	Statement stmt2 = myConn.createStatement();
        	ResultSet rs2 =  stmt2.executeQuery(countClass);
        	int total_unit = 0, total_enroll = 0;
        	if(rs2!=null && rs2.next()) {
        		total_enroll = rs2.getInt(1);
        		total_unit = rs2.getInt(1);%>
        	<tr align="center">
        			<td colspan="4" style="text-align:right">총 수강 과목 : <%=total_enroll%> </td>
        			<td colspan="4">총 수강 학점 : <%=total_unit%> </td>
        	</tr>	
        	
        	<% }
} catch (SQLException ex) {
     System.err.println("SQLException: " + ex.getMessage());
} finally {
	stmt.close();
    myConn.close();        
 }  %>
      </table>
   </form>

 <script src="http://code.jquery.com/jquery.js"></script>
 <script src="js/bootstrap.min.js"></script>
</body>
</html>