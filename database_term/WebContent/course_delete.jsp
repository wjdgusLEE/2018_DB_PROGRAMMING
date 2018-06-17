<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %> 
<%@ include file="session.jsp" %>
<%@ page import="conn.ConnectionManager"%>

<% 

String c_id = request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));

ConnectionManager conn_manager = new ConnectionManager();
Connection conn = conn_manager.getConnection();

String s = "select COUNT(*) as count from enroll where c_id='"+c_id+"' AND c_id_no="+c_id_no;
Statement st = conn.createStatement();
ResultSet re = st.executeQuery(s);
if (re != null && re.next()) {
	int count = re.getInt("count");
	if (count>0) {
		%>	<script> alert("신청자가 있는 과목은 임의로 폐강할 수 없습니다."); window.history.back(); </script>	<%
		re.close();
		st.close();
		return;
	}
}
re.close();
st.close();

String sql = "{? = call checkCourseDelete(?, ?)}";
CallableStatement cstmt = conn.prepareCall(sql);
cstmt.registerOutParameter(1, Types.INTEGER);
cstmt.setString(2, c_id);
cstmt.setInt(3, c_id_no);
cstmt.execute();
int result = cstmt.getInt(1);
if (result != 1)
	System.out.print(result);

cstmt.close();
conn.close();
response.sendRedirect("professor_all.jsp");

%>

<%= c_id%>