<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

  </head>
<%@ include file="session.jsp" %> 
<ul class="nav nav-tabs" id="nav_list">
<%
if(isStudent){
%>
	<li class="active" onclick="changeState(this)"><%=log%></li>
	<li><a href="update.jsp" onclick="changeState(this)">개인 정보 수정</a></li> 
	<li><a href="course_enroll.jsp" onclick="changeState(this)">수강신청 입력</a></li> 
	<li><a href="course_drop.jsp" onclick="changeState(this)">수강신청 삭제</a></li> 
	<li><a href="student_all.jsp" onclick="changeState(this)">수강신청 조회</a></li> 
	
<%} else if (isProfessor) { %>
	
	<li class="active" onclick="changeState(this)"><%=log%></li> 
	<li><a href="update.jsp" onclick="changeState(this)">개인 정보 수정</a></li> 
	<li><a href="course_insert.jsp" onclick="changeState(this)">강의 개설</a></li> 
	<li><a href="professor_all.jsp" onclick="changeState(this)">강의 개설 현황 </a></li> 
	
<%} else if(isManager) { %>

	<li class="active"><%=log%></li> 
	<li><a href="update.jsp" onclick="changeState(this)">개인 정보 수정</a></li> 
	<li><a href="account_create.jsp" onclick="changeState(this)">계정 생성</a></li> 
	<li><a href="account_students.jsp" onclick="changeState(this)">학생 관리</a></li> 
	<li><a href="account_professors.jsp" onclick="changeState(this)">교수 관리</a></li> 

<%}else { %>
	<li class="active"><%=log%></li>
	<li><a href="#">숙명여대 수강신청 시스템</a></li>
<%}%>
</ul>
  	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
   
    function changeState(item) {
	var current = document.getElementsByClassName("active");
	for (var i=0; i< current.length; i++)
	    current[i].className = current[i].className.replace("active", "");
	item.className += "active";
			}
  </script>
</body>
</html>