<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.ConnectionManager" %>

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
  
   <button id="deleteBttn" onclick="location.href='professor_delete.jsp'">삭제</button> 
 <button id="editBttn" onclick="location.href='professor_edit.jsp'">수정</button> 
<table width="75%" align="center" border>   
	<tr>
	<th><div align="center">아이디</div></th><th><div align="center">이름</div></th>
	<th><div align="center">비밀번호</div></th><th><div align="center">전공</div></th>
	<th><div align="center">이메일</div></th>
	</tr>  
<%
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String mySQL = "select p_id, p_name, p_pwd, p_major, p_email from professor";
Statement stmt=conn.createStatement();

ResultSet result = stmt.executeQuery(mySQL);
try { 
	while (result != null && result.next())  {
		%>
		  <tr>
		   <td><div align="center"><%=result.getString("p_id") %></div></td><td><div align="center"><%=result.getString("p_name") %></div></td>
		   <td><div align="center"><%=result.getString("p_pwd") %></div></td><td><%=result.getString("p_major") %></div></td>
		   <td><div align="center"><%=result.getString("p_email") %></div></td>
		  </tr>
		<% }	
	
} catch (SQLException ex) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"학생이없습니다.\")");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} %>
  </table>

</body>
</html>