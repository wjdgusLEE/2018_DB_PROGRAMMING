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

        int prevUnit = 0, prevGrade = 0, prevYear = 0, prevSem = 0, prevMax = 0;
        String prevName = "", prevMajor = "", prevDay = "", prevRoom = "", prevTime = "";
		
		final int OK = 1;
		final int DUP_COURSE = -1;
		final int DUP_ROOM = -2;
		final int DUP_TIME = -3;

		int result;
		ConnectionManager conn_manager = new ConnectionManager();
		Connection myConn = conn_manager.getConnection();
		try {			
			String mySQL = "select c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max ";
			mySQL += "from course c, teach t ";
			mySQL += "where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no AND c.c_id='"+c_id+"' AND c.c_id_no="+c_id_no;

			Statement stmt = myConn.createStatement();
			ResultSet rs = stmt.executeQuery(mySQL);
			if (rs != null && rs.next()) {
                    prevUnit = rs.getInt("unit");
                    prevGrade = rs.getInt("grade");
                    prevYear = rs.getInt("year");
                    prevSem = rs.getInt("semester");
                    prevMax = rs.getInt("max");
                    prevName = rs.getString("name");
                    prevMajor = rs.getString("major");
                    prevDay = rs.getString("day");
                    prevRoom = rs.getString("room");
                    prevTime = rs.getString("time");
			}
			rs.close();
			stmt.close();
			
			String sql = "delete teach where c_id='"+c_id+"' AND c_id_no='"+c_id_no+"'";
			stmt = myConn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			myConn.commit();
			
			sql = "delete course where c_id='"+c_id+"' AND c_id_no='"+c_id_no+"'";
			stmt = myConn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			myConn.commit();
			
			mySQL = "{? = call checkTeach(?, ?, ?, ?, ?, ?, ?, ?)}";
			CallableStatement cstmt = myConn.prepareCall(mySQL);
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
				sql = "insert into course values(?, ?, ?, ?, ?, ?)";
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
				myConn.commit();
				%>	<script> alert("수정이 완료되었습니다."); </script>	<%
				response.sendRedirect("professor_all.jsp");
			}
			else if (result == DUP_ROOM) {
				sql = "insert into course values(?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = myConn.prepareStatement(sql);
				pstmt.setString(1, c_id);
				pstmt.setInt(2, c_id_no);
				pstmt.setString(3, prevName);
				pstmt.setInt(4, prevUnit);
				pstmt.setInt(5, prevGrade);
				pstmt.setString(6, prevMajor);
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "insert into teach values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = myConn.prepareStatement(sql);
				pstmt.setString(1, p_id);
				pstmt.setString(2, c_id);
				pstmt.setInt(3, c_id_no);
				pstmt.setInt(4, prevYear);
				pstmt.setInt(5, prevSem);
				pstmt.setString(6, prevDay);
				pstmt.setString(7, prevRoom);
				pstmt.setString(8, prevTime);
				pstmt.setInt(9, prevMax);
				pstmt.executeUpdate();
				pstmt.close();
				myConn.commit();
				%>	<script> alert("사용되고 있는 강의실입니다."); window.history.back(); </script>	<%
			}
			else if (result == DUP_TIME) {
				sql = "insert into course values(?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = myConn.prepareStatement(sql);
				pstmt.setString(1, c_id);
				pstmt.setInt(2, c_id_no);
				pstmt.setString(3, prevName);
				pstmt.setInt(4, prevUnit);
				pstmt.setInt(5, prevGrade);
				pstmt.setString(6, prevMajor);
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "insert into teach values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = myConn.prepareStatement(sql);
				pstmt.setString(1, p_id);
				pstmt.setString(2, c_id);
				pstmt.setInt(3, c_id_no);
				pstmt.setInt(4, prevYear);
				pstmt.setInt(5, prevSem);
				pstmt.setString(6, prevDay);
				pstmt.setString(7, prevRoom);
				pstmt.setString(8, prevTime);
				pstmt.setInt(9, prevMax);
				pstmt.executeUpdate();
				pstmt.close();
				myConn.commit();
				%>	<script> alert("이 시간에 강의가 있습니다."); window.history.back(); </script>	<%
			}

		} catch (SQLException ex) {
			myConn.rollback();
			String sql = "insert into course values(?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = myConn.prepareStatement(sql);
			pstmt.setString(1, c_id);
			pstmt.setInt(2, c_id_no);
			pstmt.setString(3, prevName);
			pstmt.setInt(4, prevUnit);
			pstmt.setInt(5, prevGrade);
			pstmt.setString(6, prevMajor);
			pstmt.executeUpdate();
			pstmt.close();

			sql = "insert into teach values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = myConn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.setString(2, c_id);
			pstmt.setInt(3, c_id_no);
			pstmt.setInt(4, prevYear);
			pstmt.setInt(5, prevSem);
			pstmt.setString(6, prevDay);
			pstmt.setString(7, prevRoom);
			pstmt.setString(8, prevTime);
			pstmt.setInt(9, prevMax);
			pstmt.executeUpdate();
			pstmt.close();
			myConn.commit();
			out.write(ex.toString());
			%>	<script> alert("오류가 발생했습니다."); window.history.back(); </script>	<%
		} finally {
			myConn.close();
		}
	%>

</body>
</html>