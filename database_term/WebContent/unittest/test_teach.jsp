<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>  
<%@ page import="conn.TestTeach" %>   
<%@ page import="conn.Teach" %>   
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  </head>
  <body>
<%
TestTeach courseDAO = new TestTeach();
courseDAO.getCoursesOf("p001");
%>

</body>
</html>