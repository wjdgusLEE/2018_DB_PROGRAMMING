<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="conn.ConnectionManager" %> 
<%@ page import="java.io.PrintWriter" %>
<% 
	
	String searchId = request.getParameter("deleteID");
	String searchType = request.getParameter("deleteType");
	ConnectionManager conn_manager = new ConnectionManager();
	Connection conn = conn_manager.getConnection();
	Statement stmt = conn.createStatement();
	PrintWriter script = response.getWriter();
	try {
		String mySQL = "delete from "+ searchType;
		if(searchType.equals("manager"))
			mySQL += " where m_id='" + searchId + "'" ; 
		else if(searchType.equals("student"))
			mySQL +=  " where s_id='" + searchId + "'" ; 
		else if(searchType.equals("professor")) 
			mySQL += " where p_id='" + searchId + "'" ; 
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
	}finally {
	stmt.close();
	conn.commit();
	conn.close();
	script.println("<script>");
	script.println("location.href='account_"+searchType+"s.jsp'");
	script.println("</script>");
}
%>

