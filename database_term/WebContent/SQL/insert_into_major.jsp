<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="conn.ConnectionManager" %>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
<body>
<% 
	ConnectionManager conn_manager = new ConnectionManager();
	Connection myConn = conn_manager.getConnection();
	String mySQL = "insert into major values (?)" ;
	PreparedStatement stmt = myConn.prepareStatement(mySQL);
		
 	String [] temp = {"가족자원경영학과",
		 "아동복지학부",
		 "의류학과",
		 "식품영양학",
		 "정치외교학과",
		 "행정학과",
		 "홍보광고학과",
		 "소비자경제학과",
		 "사회심리학과",
		 "법학부",
		 "경제학부",
		 "경영학부",
		 "피아노과",
		 "관현악과",
		 "성악과",
		 "작곡과",
		 "약학부",
		 "시각영상디자인과",
		 "산업디자인과",
		 "환경디자인과",
		 "공예과",
		 "회화과",
		 "글로벌협력전공",
		 "앙트러프러너십전공",
		 "영어영문학부",
		 "미디어학부",
		 "컴퓨터과학부"};

 	for(int i= 0 ;i<temp.length; i++){
		stmt.setString(1, temp[i]);
		stmt.execute();
	}

%>

