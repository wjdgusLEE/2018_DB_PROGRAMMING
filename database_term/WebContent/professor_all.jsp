<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>    
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
<table width="75%" align="center" border>   
	<tr>
	<th><div align="center">���� ��ȣ</div></th><th><div align="center">�й� ��ȣ</div></th>
	<th><div align="center">���Ǹ�</div></th><th><div align="center">����</div></th>
	<th><div align="center">����</div></th><th><div align="center">�г�</div></th>
	<th><div align="center">�б�</div></th><th><div align="center">����</div></th>
	<th><div align="center">����</div></th><th><div align="center">���� ����</div></th>
	<th><div align="center">��û ��Ȳ </div></th>
	</tr>  
<%
ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String mySQL = "select * from ";
mySQL += "( select c.c_id as id, c.c_id_no as no_id , count(*) as cnt ";
mySQL += "from enroll e, course c where c.c_id = e.c_id and c.c_id_no = e.c_id_no and e.c_id in ( ";
mySQL += "select c_id from teach where p_id = '"+session_id+"') group by c.c_id, c.c_id_no), course cmp where cmp.c_id = id and cmp.c_id_no = no_id";
Statement stmt=conn.createStatement();

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
		  </td> <td><div align="center"> <%=  result.getInt("cnt")%> </div></td>
		  </tr>
		<% }	
	
} catch (SQLException ex) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert(\"������ ���ǰ� �����ϴ�.\")");
		//script.println("location.href='main.jsp'");
	script.println("</script>");	 		
}catch(Exception ex) {
	System.out.println(ex.toString());
} %>
  </table>

</body>
</html>