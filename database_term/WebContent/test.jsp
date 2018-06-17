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
	System.out.println(mySQL);
               myResultSet = stmt.executeQuery(mySQL);
               while (myResultSet.next()) {
                 System.out.println(myResultSet.getString(1));
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