<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String dbdriver = "oracle.jdbc.driver.OracleDriver"; //오라클을 사용한다는 부분
	Class.forName(dbdriver);
	Connection myConn = null;

	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db1512173";
	String passwd = "wjdgus12";

	Statement stmt = null;
	String mySQL = null;
	ResultSet rs = null;

	String userID = request.getParameter("userID"); // 앞에 페이지에서 값을 받아오는것, 변수명이 같아야함
	String userPassword = request.getParameter("userPassword");
	String id = ""; // 로그인 성공시 받는 id


	try { //오류를 잡아주는 부분
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement();
	} catch (Exception e) {

	}

	mySQL = "select s_id from student where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
	rs = stmt.executeQuery(mySQL);

	if (rs != null && rs.next()) { //rs포인터를 다음번으로 이동시켜주는 부분
		id = rs.getString(1); //"s_id" 랑 동일, 순서가 동일 하다 (desc)했을때 나타나는 순서랑
	}


	if (id.equals(userID)) {
		session.setAttribute("user", id);
%>
<script>
	alert("login Success!");
	location.href = "main.jsp";
</script>

<%
	} else {
%>
<script>
	alert("login Failed!");
	location.href = "login.jsp";
</script>
<%
	}
	stmt.close();
	myConn.close();
%>
