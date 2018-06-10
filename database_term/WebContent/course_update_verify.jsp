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
		
		int editIdNo = 0, editUnit = 0, editGrade = 0, editYear = 0, editSem = 0, editMax = 0;
		String editName = "", editMajor = "", editDay = "", editRoom = "", editTime = "";
		
		final int OK = 1;
		final int DUP_COURSE = -1;
		final int DUP_ROOM = -2;
		final int DUP_TIME = -3;

		int result;
		try {
			ConnectionManager conn_manager = new ConnectionManager();
			Connection myConn = conn_manager.getConnection();
			
			String mySQL = "select t.c_id as id, t.c_id_no as id_no, c.c_name as name, c.c_unit as unit, c.c_grade as grade, c.c_major as major, t.t_year as year, t.t_semester as semester, t.t_day as day, t.t_room as room, t.t_time as time, t.t_max as max ";
			mySQL += "from course c, teach t ";
			mySQL += "where t.p_id='"+session_id+"' AND c.c_id=t.c_id AND c.c_id_no=t.c_id_no";

			Statement stmt = myConn.createStatement();

			ResultSet rs = stmt.executeQuery(mySQL);
			if (rs!=null && rs.next()) {
				if (rs.getInt("id_no") != c_id_no)
					editIdNo = c_id_no;
				else editIdNo = rs.getInt("id_no");
				if (rs.getInt("unit") != c_unit)
					editUnit = c_unit;
				else editUnit = rs.getInt("unit");
				if (rs.getInt("grade") != c_grade)
					editGrade = c_grade;
				else editGrade = rs.getInt("grade");
				if (rs.getInt("year") != t_year)
					editYear = t_year;
				else editYear = rs.getInt("year");
				if (rs.getInt("semester") != t_semester)
					editSem = t_semester;
				else editSem = rs.getInt("semester");
				if (rs.getInt("max") != t_max)
					editMax = t_max;
				else editMax = rs.getInt("max");
				if (rs.getString("name") != c_name)
					editName = c_name;
				else editName = rs.getString("name");
				if (rs.getString("major") != c_major)
					editMajor = c_major;
				else editMajor = rs.getString("major");
				if (rs.getString("day") != t_day)
					editDay = t_day;
				else editDay = rs.getString("day");
				if (rs.getString("room") != t_room)
					editRoom = t_room;
				editRoom = rs.getString("room");
				if (rs.getString("time") != t_time)
					editTime = t_time;
				else editTime = rs.getString("time");
			}
			
			if (editIdNo == c_id_no) {
				mySQL = "{? = call checkCourse(?, ?)}";
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
			}
			
			mySQL = "{? = call checkTeach(?, ?, ?, ?, ?, ?, ?, ?)}";
			CallableStatement cstmt = myConn.prepareCall(mySQL);
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.setString(2, p_id);
			cstmt.setString(3, c_id);
			cstmt.setInt(4, editIdNo);
			cstmt.setInt(5, editYear);
			cstmt.setInt(6, editSem);
			cstmt.setString(7, editDay);
			cstmt.setString(8, editRoom);
			cstmt.setString(9, editTime);
			cstmt.execute();
			result = cstmt.getInt(1);
			cstmt.close();
//정 안 되면 해당 레코드를 지우고 무조건 인서트하자
			if (result == OK) {
				String sql = "update course set c_id_no=?, c_name=?, c_unit=?, c_grade=?, c_major=?)";
				PreparedStatement pstmt = myConn.prepareStatement(sql);
				pstmt.setInt(1, c_id_no);
				pstmt.setString(1, c_name);
				pstmt.setInt(2, c_unit);
				pstmt.setInt(4, c_grade);
				pstmt.setString(5, c_major);
				pstmt.executeUpdate();
				pstmt.close();
				
				sql = "update teach set c_id_no=?, t_year=?, t_semester=?, t_day=?, t_room=?, t_time=?, t_max=?";
				pstmt = myConn.prepareStatement(sql);
				pstmt.setInt(1, c_id_no);
				pstmt.setInt(2, t_year);
				pstmt.setInt(3, t_semester);
				pstmt.setString(4, t_day);
				pstmt.setString(5, t_room);
				pstmt.setString(6, t_time);
				pstmt.setInt(7, t_max);
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

			myConn.close();

		} catch (SQLException ex) {
			out.write(ex.toString());
		}
	%>

</body>
</html>