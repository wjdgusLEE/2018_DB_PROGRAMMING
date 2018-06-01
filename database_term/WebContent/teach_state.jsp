<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>  
<%@ page import="conn.CourseDAO" %>   
<%@ page import="conn.Course" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
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
	<th>
	<td><div align="center">���� ��ȣ</div></td><td><div align="center">�й� ��ȣ</div></td>
	<td><div align="center">���Ǹ�</div></td><td><div align="center">����</div></td>
	<td><div align="center">����</div></td><td><div align="center">�г�</div></td>
	<td><div align="center">�б�</div></td><td><div align="center">����</div></td>
	<td><div align="center">����</div></td><td><div align="center">���� ����</div></td>
	</th>  
<%
CourseDAO courseDAO = new CourseDAO();
Course [] result = courseDAO.getCoursesOf(session_id);
PrintWriter script = response.getWriter();
	 	try { 
	 		for (int i=0; i< result.length; i++)  {%>
					  <tr>
					  <td><div align="center"> <%result[i].getC_id();%> </div></td> <td><div align="center"> <%result[i].getC_id_no();%> </div></td>
					  <td><div align="center"> <%result[i].getC_name();%> </div></td> <td><div align="center"> <%result[i].getC_major();%> </div></td>
					  <td><div align="center"> <%result[i].getC_unit();%> </div></td> <td><div align="center"> <%result[i].getC_grade();%> </div></td>
					  <td><div align="center"> <%result[i].getC_semester();%> </div></td> <td><div align="center"> <%result[i].getC_day();%> </div></td>
					  <td><div align="center"> <%result[i].getC_time();%> </div></td> <td><div align="center"> <%result[i].getC_max();%> </div></td>
					  </tr>
	 		<% }
		} catch (Exception ex) {
	 		script.println("<script>");
	 		script.println("alert(������ ���ǰ� �����ϴ�.)");
	 		//script.println("location.href='main.jsp'");
	 		script.println("</script>");
	} %>
  </table>

</body>
</html>