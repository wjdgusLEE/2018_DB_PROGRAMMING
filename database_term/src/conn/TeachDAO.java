package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class TeachDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public TeachDAO() {
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
	
	public List<Teach> getCoursesOf(String id) throws SQLException {
		String sql = "select c.c_id, c_id_no, c_name, c_major, c_unit, c_grade, c_semester, c_day, c_time, c_max from course c, teach t where t.c_id=c.c_id and t.p_id = ?";
		List<Teach> result = new ArrayList<Teach>();
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
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
				result.add(record);
			}
			
			for(int i=0;i<result.size();i++) {
				System.out.println(result.get(i).getC_id());
			}
			
			
			return result;
		}catch(Exception e){
			e.printStackTrace();
			throw new SQLException();
		}
	}
	
}