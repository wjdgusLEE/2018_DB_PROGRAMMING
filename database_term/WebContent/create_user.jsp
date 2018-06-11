<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ include file="../top.jsp" %> 
<%@ page import="conn.ConnectionManager" %>

<html>
<head><title>계정 생성</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
<form method="post" action="create_user_verify.jsp">
<table>
<tr><td>이름</td><td><input type="text" name="userName" placeholder="이름"></td></tr>
<tr><td>아이디</td><td><input type="text" name="userID" placeholder="아이디"></td></tr>
<tr><td>비밀번호</td><td><input type="text" name="userPassword" placeholder="비밀번호 4자리 이상 "></td></tr>
<tr>
<td>타입</td>
<td>
<input type="radio"  name="userType" value="student"  onclick="return false;" checked="checked">학생
<input type="radio"  name="userType"  onclick="return false;" value="professor">교수
</td>
</tr>

<tr id="hidden" style="display:none;">
<td>학년</td>
<td> <select name="grade">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
</td>
</tr>

<tr>
<td>전공</td>
<td>
<select name="userMajor">
<% 
	ConnectionManager conn_manager = new ConnectionManager();
	Connection myConn = conn_manager.getConnection();
	
	String mySQL = "select * from major" ;
	Statement stmt = myConn.createStatement();
	ResultSet rs = stmt.executeQuery(mySQL);
	while(rs!=null&&rs.next()){
		String major = rs.getString(1);
%>
  <option value=<%=major%>> <%=major%></option>
<%}%>
</select>
</td>
</tr>
<tr><td>이메일</td><td><input type="text" name="userEmail" placeholder="xxxx@xxxxx.com "></td></tr>
</table>

<input type="submit"  value="create"  style="width:100%; margin-top : 10px; height : 3em;">
</form>

<script>
var radio = document.getElementById("userType");
var grade_tr = document.getElementById("grade_tr");
$(document).ready(function() {
    $('input[type=radio][name=userType]').change(function() {
        if (this.value == 'student') {
            radio.style.display="";
        }
        else if (this.value == 'professor') {
           radio.style.display="None";
        }
    });
});

</script>
</body>
</html>