<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String session_id = (String) session.getAttribute("user");
	String type = (String) session.getAttribute("type");
	String log;
	if (session_id == null || type == null)
		log = "<a href=\"login.jsp\">로그인</a>";
	else
		log = "<a href=logout.jsp>로그아웃</a>";
	boolean isStudent = false;
	boolean isProfessor = false;
	boolean isManager = false;
	try {
		isStudent = type.equals("student");
		isProfessor = type.equals("professor");
		isManager = type.equals("manager");
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>