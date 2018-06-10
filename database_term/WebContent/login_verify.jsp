
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>

<%
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	
	ConnectionManager conn_manager = new ConnectionManager();
	Connection myConn = conn_manager.getConnection();


	String[] sql = {"{ ? = call CheckStudent(?,?)}", "{ ? = call CheckProfessor(?,?)}",
			"{ ? = call CheckManager(?,?)}"};
	int[] type = {-1, -1, -1};

	String[] category = {"student", "professor", "manager"};
	int NOTMEMBER = -1;
	int isExist = NOTMEMBER;
	CallableStatement cstmt = null;
	for (int i = 0; i < 3; i++) {
		cstmt = myConn.prepareCall(sql[i]);
		cstmt.registerOutParameter(1, Types.INTEGER);
		cstmt.setString(2, userID);
		cstmt.setString(3, userPassword);
		cstmt.execute();
		type[i] = cstmt.getInt(1);
		if (type[i] != NOTMEMBER) {
			isExist = i;
			break;
		}
	}

	if (isExist != NOTMEMBER) {
		session.setAttribute("user", userID);
		session.setAttribute("type", category[isExist]);
%>
<script>
	alert("반갑습니다.");
	location.href = "main.jsp";
</script>
<%
	}

	cstmt.close();
	myConn.close();
%>