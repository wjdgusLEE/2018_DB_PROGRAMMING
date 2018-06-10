<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="session.jsp" %>
<%@ page import="conn.ConnectionManager"%>

<% 

String c_id = request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));

ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

%>

<%= c_id%>