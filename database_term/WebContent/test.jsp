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
<title>수강신청 홈페이지</title>
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

   <h3 align="center">
      <%=nYear%>
      년도
      <%=nSemester%>
      학기
   </h3>
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

String mySQL = "select * from course where c_id in ( ";
	mySQL += "(select c_id from teach where t_semester = "+ nSemester +" and t_year = "+ nYear+ ")";
	mySQL += "	minus ";
	mySQL += "(select c_id from enroll where s_id = '"+session_id+"'))";
	out.write(mySQL);
               myResultSet = stmt.executeQuery(mySQL);
               while (myResultSet.next()) {
            	   String c_id = "", c_id_no = "", c_name = "", c_major = "", p_id = "", p_name = "";
                   String t_day = "", t_time = "", t_room = "";
                   int t_max = 0, c_unit = 0, studentNum = 0;
                   c_id = myResultSet.getString("c_id");
                   c_id_no = myResultSet.getString("c_id_no");
                   c_name = myResultSet.getString("c_name");
                   c_unit = myResultSet.getInt("c_unit");
                   c_major = myResultSet.getString("c_major");
                   out.write( c_id);
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
                	 out.write(p_name);
                  }
            } catch (SQLException ex) {
            System.out.println(ex.toString());
               System.err.println("SQLException: " + ex.getMessage());
            } finally {
               stmt.close();
               myConn.close();
            }
         %>
      </table>
   </form>

</body>
</html>