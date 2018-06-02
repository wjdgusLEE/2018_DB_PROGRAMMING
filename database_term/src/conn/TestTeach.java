package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestTeach {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public  TestTeach() {
		try{
			String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "db1515386";
			String passwd = "ss3";

			String dbdriver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(dbdriver); 
			conn =  DriverManager.getConnection (dburl, user, passwd);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void getCoursesOf(String id) throws SQLException{
		String sql = "select c.c_id, c_id_no, c_name, c_major, c_unit, c_grade, c_semester, c_day, c_time, c_max from course c, teach t where t.c_id=c.c_id and t.p_id = ?";
		List<Teach> result = new ArrayList<Teach>();
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int i=0;
			rs = pstmt.executeQuery();
			if(rs.next()){
				System.out.println(i++);
				Teach record = new Teach();
				record.setC_id(rs.getString("c_id"));
				record.setC_id_no(rs.getInt("c_id_no"));
				record.setC_name(rs.getString("c_name"));
				record.setC_major(rs.getString("c_major"));
				record.setC_unit(rs.getInt("c_unit"));
				record.setC_grade(rs.getInt("c_grade"));
				record.setC_semester(rs.getInt("c_semester"));
				record.setC_day(rs.getString("c_day"));
				record.setC_time(rs.getInt("c_time"));
				record.setC_max(rs.getInt("c_max"));
				System.out.println(record.getC_id());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pstmt.close();
			conn.close();
		}
	}
	
}
