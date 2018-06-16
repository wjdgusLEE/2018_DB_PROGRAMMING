<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="conn.ConnectionManager" %> 
<%@ page import="java.io.PrintWriter" %>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
<!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
<body>
<% 
	String searchId = request.getParameter("editID");

	String searchType = request.getParameter("editType");
	searchId = searchId.substring(0, searchId.length()-1);

	ConnectionManager conn_manager = new ConnectionManager();
	Connection conn = conn_manager.getConnection();
	
	Statement stmt = conn.createStatement();
	String [] userInfo = null;
	try {
		String mySQL = null;
		if(searchType.equals("manager"))
			mySQL = "select m_name, m_pwd, m_email from "+ searchType +" where m_id='" + searchId + "'" ; 
		else if(searchType.equals("student"))
				 mySQL = "select s_name, s_pwd, s_email, s_major from "+ searchType +" where s_id='" + searchId + "'" ; 
		else if(searchType.equals("professor")) 
			mySQL = "select p_name, p_pwd, p_email, p_major from "+ searchType +" where p_id='" + searchId + "'" ; 
		
		ResultSet result = stmt.executeQuery(mySQL);
		userInfo = new String[4];
		if( result!=null && result.next()) {
			userInfo[0] = result.getString(1);
			userInfo[1] = result.getString(2);
			userInfo[2] = result.getString(3);
			userInfo[3] = result.getString(4);
		} 
	}catch(Exception ex) {
		conn.rollback();
		System.out.println(ex.toString());
	}finally {
		conn.commit();
		stmt.close();
		conn.close();
}
%>
<FORM class="form-horizontal" method="post" action="update_verify.jsp">

  <table class="table table-hover" width="75%" align="center">   
	<tr>
	<td><div align="center">이름</div></td>
	<td><div align="center"><input type="text" name="userName" value=<%=userInfo[0]%>></div></td>
	</tr>
	<tr>
	<td><div align="center">비밀번호</div></td>
	<td><div align="center"><input type="text" name="userPassword" value=<%=userInfo[1]%>></div></td>
	</tr>	
	<tr>
	<td><div align="center">전공</div></td>
	<td><div align="center"><input type="text" name="userMajor" value=<%=userInfo[3]%>></div></td>
	</tr>
	<tr>
	<td><div align="center">이메일</div></td>
	<td><div align="center"><input type="text" name="userEmail" value=<%=userInfo[2]%>></div></td>
	</tr>		
  </table>

	<input type="submit"  value="update"/>	
 	<input type="reset"  value="cancel" onclick="location.href='main.jsp'">
	<input type="hidden" name="userType" value=<%=searchType%>>
	<input type="hidden" name="userID" value=<%=searchId%>>
  </FORM>
  
  </BODY></HTML>
