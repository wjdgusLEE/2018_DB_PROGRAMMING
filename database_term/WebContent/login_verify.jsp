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


String [] sql = {"{ ? = call CheckStudent(?)}","{ ? = call CheckProfessor(?)}", "{ ? = call CheckManager(?)}"};
int [] type = {-1,-1,-1};

String [] category = {"student", "professor", "manager"};
int  NOTMEMBER = -1;
int isExist = NOTMEMBER;
CallableStatement cstmt = null;
for(int i=0; i<3; i++){
		cstmt = myConn.prepareCall(sql[i]);
		cstmt.registerOutParameter(1, Types.INTEGER);
		cstmt.setString(2, userID);
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
%>
	<script>
 		alert("없는 회원 정보입니다.");
  		location.href="login.jsp";
	</script>
