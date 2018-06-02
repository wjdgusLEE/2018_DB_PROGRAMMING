<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  </head>
  <body>
<table width="75%" align="center" border>   
	<tr>
	<td><div align="center">강의 번호</div></td><td><div align="center">분반 번호</div></td>
	<td><div align="center">강의명</div></td><td><div align="center">전공</div></td>
	<td><div align="center">학점</div></td><td><div align="center">학년</div></td>
	<td><div align="center">학기</div></td><td><div align="center">요일</div></td>
	<td><div align="center">교시</div></td><td><div align="center">수강 제한</div></td>
	</tr>  
<%
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver); 
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1515386";
String passwd = "ss3";
Connection conn =  DriverManager.getConnection (dburl, user, passwd);

String mySQL = "select c_id, c_id_no, c_name, c_major, c_unit, c_grade, c_semester, c_day, c_time, c_max from course where c_id in ( select c_id from teach where p_id = '"+session_id+"')";
Statement stmt=conn.createStatement();
//System.out.println(mySQL);

ResultSet result = stmt.executeQuery(mySQL);
try { 
	while (result != null && result.next())  {
		System.out.println(result.getString("c_id"));
		%>
		  <tr>
		  <td><div align="center"> <%= result.getString("c_id")%> </div></td> <td><div align="center"> <%=  result.getInt("c_id_no")%> </div></td>
		  <td><div align="center"> <%= result.getString("c_name")%> </div></td> <td><div align="center"> <%=  result.getString("c_major")%> </div></td>
		  <td><div align="center"> <%=  result.getInt("c_unit")%> </div></td> <td><div align="center"> <%=  result.getInt("c_grade")%> </div></td>
		  <td><div align="center"> <%=  result.getInt("c_semester")%> </div></td> <td><div align="center"> <%=  result.getString("c_day")%> </div></td>
		  <td><div align="center"> <%=  result.getInt("c_time")%> </div></td> <td><div align="center"> <%=  result.getInt("c_grade")%> </div></td>
		  </tr>
		<% }	
	
} catch (SQLException ex) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"개설한 강의가 없습니다.\")");
		//script.println("location.href='main.jsp'");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} %>
  </table>

</body>
</html>