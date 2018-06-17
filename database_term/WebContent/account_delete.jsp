<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="conn.ConnectionManager" %> 
<%@ page import="java.io.PrintWriter" %>
<% 
	
	String searchId = request.getParameter("deleteID");
	String searchType = request.getParameter("deleteType");
	searchId = searchId.substring(0, searchId.length()-1);
	ConnectionManager conn_manager = new ConnectionManager();
	Connection conn = conn_manager.getConnection();
	Statement stmt = conn.createStatement();
	PrintWriter script = response.getWriter();
	try {
		String mySQL = null;
		if(searchType.equals("manager"))
			mySQL = "delete from "+ searchType +" where m_id='" + searchId + "'" ; 
		else if(searchType.equals("student"))
				 mySQL = "delete from "+ searchType +" where s_id='" + searchId + "'" ; 
		else if(searchType.equals("professor")) 
			mySQL = "delete from "+ searchType +" where p_id='" + searchId + "'" ; 
		stmt.executeUpdate(mySQL);

		script.println("<script>");
		script.println("alert(\"성공적으로 삭제되었습니다.\")");
		script.println("</script>");
	}catch(Exception ex) {
		System.out.println(ex.toString());
		conn.rollback();
		script.println("<script>");
		script.println("alert(\"대상이 없습니다.\")");
		script.println("</script>");
	}finally {stmt.close();
	conn.commit();
	conn.close();
	script.println("<script>");
	script.println("location.href='account_"+searchType+"s.jsp'");
	script.println("</script>");
}
%>

