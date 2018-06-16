<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ include file="top.jsp" %> 
<%@ page import="conn.ConnectionManager" %>

<html>
<head><title>계정 생성</title>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<form  class="form-horizontal" method="post" action="create_user_verify.jsp">
<table class="table">  
<tr><td>이름</td><td><input type="text" name="userName" placeholder="이름" required></td></tr>
<tr><td>아이디</td><td><input type="text" name="userID" placeholder="아이디" required></td></tr>
<tr><td>비밀번호</td><td><input type="text" name="userPassword" placeholder="비밀번호 4자리 이상 " required></td></tr>
<tr>
<td>타입</td>
<td>
<input type="radio"  name="userType"  id="student" value="student"  onclick="doDisplay(this);" checked="checked">학생
<input type="radio"  name="userType" id="professor" onclick="doDisplay(this);" value="professor">교수
</td>
</tr>

<tr id="hidden" style="display:table-row">
<td>학년</td>
<td> <select name="userGrade">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
</td>
</tr>
<tr id="hidden_prof" style="display:none">
<td>강의실</td>
<td> <select name="userLab">
<option value="새힘관 403">새힘관 403</option>
<option value="새힘관 404">새힘관 404</option>
<option value="새힘관 405">새힘관 405</option>
<option value="새힘관 406">새힘관 406</option>
<option value="새힘관 406">새힘관 406</option>
<option value="순헌관 406">순헌관 406</option>
<option value="순헌관 406">순헌관 407</option>
<option value="음악대학206">음악대학206</option>
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

<input type="submit" value="create" class="btn">

<button type="reset" class="btn" onclick="location.href='main.jsp'">cancel</button> 
</form>
<script>
function doDisplay(radio) {
	var hidden = document.getElementById('hidden');
	var hidden_prof = document.getElementById('hidden_prof');
	if(radio.id == 'student') {
		hidden.style.display = "table-row";
		hidden_prof.style.display = "none";
	}
	else {
		hidden.style.display = "none";
		hidden_prof.style.display = "table-row";
	}
}
</script>
</body>
</html>