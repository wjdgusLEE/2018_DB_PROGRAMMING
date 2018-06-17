<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="session.jsp"%>
<%@ page import="conn.ConnectionManager"%>

<%
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));

	ConnectionManager conn_manager = new ConnectionManager();
	Connection conn = conn_manager.getConnection();

	String sql = "{? = call checkCourseDelete(?, ?)}";
	CallableStatement cstmt = conn.prepareCall(sql);
	cstmt.registerOutParameter(1, Types.INTEGER);
	cstmt.setString(2, c_id);
	cstmt.setInt(3, c_id_no);
	cstmt.execute();
	int result = cstmt.getInt(1);
	if (result != 1)
		System.out.print(result);

	cstmt.close();
	conn.close();
	response.sendRedirect("professor_all.jsp");
%>

<%=c_id%>