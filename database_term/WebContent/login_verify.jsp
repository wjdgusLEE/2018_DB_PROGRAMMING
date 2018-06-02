<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<% 
String userID = request.getParameter("userID"); 
String userPassword = request.getParameter("userPassword");
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver); 
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db1515386";
String passwd = "ss3";
Connection myConn =  DriverManager.getConnection (dburl, user, passwd);



String [] sql = {"{ ? = call CheckStudent(?,?)}","{ ? = call CheckProfessor(?,?)}", "{ ? = call CheckManager(?,?)}"};
int [] type = {-1,-1,-1};

String [] category = {"student", "professor", "manager"};
int  NOTMEMBER = -1;
int isExist = NOTMEMBER;
CallableStatement cstmt = null;
for(int i=0; i<3; i++){
		cstmt = myConn.prepareCall(sql[i]);
		cstmt.registerOutParameter(1, Types.INTEGER);
		cstmt.setString(2, userID);
		cstmt.setString(3, userPassword);
		cstmt.execute();
		type[i] = cstmt.getInt(1);
		if(type[i]!=NOTMEMBER){
			isExist = i;
			break;
		}
	}

if(isExist != NOTMEMBER) {
	session.setAttribute("user", userID);
	session.setAttribute("type", category[isExist]);
	%>
	<script>
 		alert("반갑습니다.");
  		location.href="main.jsp";
	</script>
	<%
}

cstmt.close(); 
myConn.close();
>>>>>>> 40a30b56a446ffff778c2aabe1668172f7949dd7
%>
