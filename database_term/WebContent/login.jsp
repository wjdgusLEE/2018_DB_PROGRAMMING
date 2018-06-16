<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="top.jsp"%>
<HTML>
<HEAD>
<title>수강신청 시스템 로그인</title>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</HEAD>
<BODY>
<form  class="form-horizontal" method="post" action="login_verify.jsp">
	<div class="container-fluid">
		<div class="row-fluid">
					 <div class="span4 offset">
						<div class="control-group">
						    <label class="control-label" for="inputID">ID</label>
							    <div class="controls">
					      			<input type="text" id="inputID" name="userID" placeholder="ID">
							    </div>
						</div>
					</div>
		</div>
		<div class="row-fluid">		
					<div class="span4 offset">
						<div class="control-group">
						    <label class="control-label" for="inputPassword">Password</label>
						    <div class="controls">
						      <input type="password" id="inputPassword" name="userPassword" placeholder="Password">
						    </div>
						</div>
					</div>
		</div>
		<div class="row-fluid">		
				<div class="span4 offset">
				 <button type="submit" class="btn">Sign in</button>
				 </div>
		</div>
	</div>	
	
</form>
	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</BODY>
</HTML>
