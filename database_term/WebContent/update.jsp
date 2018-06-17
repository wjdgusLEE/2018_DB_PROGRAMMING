
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="conn.ConnectionManager"%>
<%@ include file="top.jsp"%>
<html>
<head>
<title>수강신청 사용자 정보 수정</title>
<!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
	<%
		if (session_id == null || type == null)
			response.sendRedirect("login.jsp");

		ConnectionManager conn_manager = new ConnectionManager();
		Connection conn = conn_manager.getConnection();
		Statement stmt = conn.createStatement();
		String mySQL;
		//out.write(type);
		if (isManager)
			mySQL = "select m_name, m_pwd, m_email from " + type + " where m_id='" + session_id + "'";
		else if (isStudent)
			mySQL = "select s_name, s_pwd, s_email, s_major from " + type + " where s_id='" + session_id + "'";
		else
			mySQL = "select p_name, p_pwd, p_email, p_major from " + type + " where p_id='" + session_id + "'";

		ResultSet result = stmt.executeQuery(mySQL);
		String[] userInfo = new String[4];
		try {
			if (result != null && result.next()) {
				userInfo[0] = result.getString(1);
				userInfo[1] = result.getString(2);
				userInfo[2] = result.getString(3);
				if (!isManager)
					userInfo[3] = result.getString(4);
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
			conn.rollback();
		} finally {
			stmt.close();
			conn.close();
		}
	%>
	<FORM class="form-horizontal" method="post" action="update_verify.jsp">

		<div class="container-fluid">
		<div class="row-fluid">
					 <div class="span4 offset 6">
						<div class="control-group">
						    <label class="control-label" for="inputName">Name</label>
							    <div class="controls">
					      			<input type="text" id="inputName" name="userName" value=<%=userInfo[0]%> placeholder="Name">
							    </div>
						</div>
					</div>
		</div>
		
		<div class="row-fluid">
					 <div class="span4 offset 4">
						<div class="control-group">
						    <label class="control-label" for="inputPassword">Password</label>
							    <div class="controls">
					      			<input type="text" id="inputPassword" name="userPassword" value=<%=userInfo[1]%> placeholder="Password">
							    </div>
						</div>
					</div>
		</div>
						
<% if (!isManager) { %>		
		<div class="row-fluid">
					 <div class="span4 offset 4">
						<div class="control-group">
						    <label class="control-label" for="inputMajor">Major</label>
							    <div class="controls">
					      			<input type="text" id="inputMajor" name="userMajor" value=<%=userInfo[3]%> placeholder="Major">
							    </div>
						</div>
					</div>
		</div>	
<% } %>
		
		<div class="row-fluid">		
					<div class="span4 offset 4">
						<div class="control-group">
						    <label class="control-label" for="inputPassword">Email</label>
						    <div class="controls">
						    		<input type="text" id="inputMajor" name="userEmail" value=<%=userInfo[2]%> placeholder="Email">
 							</div>
						</div>
					</div>
		</div>	
		<div class="row-fluid">		
				<div class="span4 offset 4 ">
				 <button type="submit" class="btn">Update</button>
				 <button value="reset" class="btn" onclick="location.href='main.jsp'">cancel</button>
				 </div>
		</div>
	</div>	
	</FORM>
	
<script src="http://code.jquery.com/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
</BODY>
</HTML>
