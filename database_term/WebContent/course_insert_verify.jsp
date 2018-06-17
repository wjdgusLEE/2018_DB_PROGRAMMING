<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="session.jsp"%>
<%@ page import="conn.ConnectionManager"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		if (session_id == null)
			response.sendRedirect("login.jsp");
		else if (!isProfessor) {
	%>
	<script>
		alert("권한이 없습니다.");
		location.href = "main.jsp";
	</script>
	<%
		}

		String c_id = request.getParameter("c_id");
		int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
		String c_name = request.getParameter("c_name");
		int c_unit = Integer.parseInt(request.getParameter("c_unit"));
		int c_grade = Integer.parseInt(request.getParameter("c_grade"));
		String c_major = request.getParameter("c_major");

		String p_id = session_id;
		int t_year = Integer.parseInt(request.getParameter("t_year"));
		int t_semester = Integer.parseInt(request.getParameter("t_semester"));
		String t_day = request.getParameter("t_day");
		String t_room = request.getParameter("t_room");
		String t_time = request.getParameter("t_time");
		int t_max = Integer.parseInt(request.getParameter("t_max"));

		final int OK = 1;
		final int DUP_COURSE = -1;
		final int DUP_ROOM = -2;
		final int DUP_TIME = -3;

		int result;
		ConnectionManager conn_manager = new ConnectionManager();
		Connection myConn = conn_manager.getConnection();

		try {
			String mySQL = "{? = call checkCourse(?, ?)}";
			CallableStatement cstmt = myConn.prepareCall(mySQL);
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.setString(2, c_id);
			cstmt.setInt(3, c_id_no);
			cstmt.execute();
			result = cstmt.getInt(1);

			if (result == OK)
				;
			else if (result == DUP_COURSE) {
			%>	<script> alert("같은 과목이 있습니다."); window.history.back(); </script>	<%
				return;
			} else {
				System.out.println(result);
				return;
			}
			cstmt.close();

			mySQL = "{? = call checkTeach(?, ?, ?, ?, ?, ?, ?, ?)}";
			cstmt = myConn.prepareCall(mySQL);
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.setString(2, p_id);
			cstmt.setString(3, c_id);
			cstmt.setInt(4, c_id_no);
			cstmt.setInt(5, t_year);
			cstmt.setInt(6, t_semester);
			cstmt.setString(7, t_day);
			cstmt.setString(8, t_room);
			cstmt.setString(9, t_time);
			cstmt.execute();
			result = cstmt.getInt(1);
			cstmt.close();

			if (result == OK) {
				String sql = "insert into course values(?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = myConn.prepareStatement(sql);
				pstmt.setString(1, c_id);
				pstmt.setInt(2, c_id_no);
				pstmt.setString(3, c_name);
				pstmt.setInt(4, c_unit);
				pstmt.setInt(5, c_grade);
				pstmt.setString(6, c_major);
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "insert into teach values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = myConn.prepareStatement(sql);
				pstmt.setString(1, p_id);
				pstmt.setString(2, c_id);
				pstmt.setInt(3, c_id_no);
				pstmt.setInt(4, t_year);
				pstmt.setInt(5, t_semester);
				pstmt.setString(6, t_day);
				pstmt.setString(7, t_room);
				pstmt.setString(8, t_time);
				pstmt.setInt(9, t_max);
				pstmt.executeUpdate();
				pstmt.close();
				%>	<script> alert("개설이 완료되었습니다."); </script>	<%
				response.sendRedirect("professor_all.jsp");
			}
			else if (result == DUP_ROOM) {
				%>	<script> alert("사용되고 있는 강의실입니다."); window.history.back(); </script>	<%
			}
			else if (result == DUP_TIME) {
				%>	<script> alert("이 시간에 강의가 있습니다."); window.history.back(); </script>	<%
			}

			myConn.commit();
		} catch (SQLException ex) {
			myConn.rollback();
			out.write(ex.toString());
			%>	<script> alert("오류가 발생했습니다."); window.history.back(); </script>	<%
		} finally {
			myConn.close();
		}
	%>

</body>
</html>