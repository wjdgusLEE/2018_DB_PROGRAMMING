<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="top.jsp"%>
<HTML>
<head>
<title>수강신청 시스템 로그인</title>
</head>
<BODY>
	<table width="75%" align="center" bgcolor="#FFFF99" border>
		<tr>
			<td><div align="center">아이디와 패스워드를 입력하세요
	</table>

	<FORM method="post" action="login_verify.jsp">
		<table width="75%" align="center" border>
			<tr>
				<td>
					<div align="center">아이디</div>
				</td>
				<td><div align="center">
						<input type="text" name="userID">
					</div></td>
			</tr>
			<tr>
				<td>
					<div align="center">비밀번호</div>
				</td>
				<td><div align="center">
						<input type="text" name="userPassword">
					</div></td>
			</tr>
		</table>
		<div class="clearfix">
			<input type="submit" value="login"
				style="width: 100%; margin-top: 10px; height: 3em;">
		</div>
	</FORM>
</BODY>
</HTML>