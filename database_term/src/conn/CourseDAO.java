package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class CourseDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CourseDAO() {
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
	
	public Course [] getCoursesOf(String id){
		String sql = "select * from course where id=?";
		List<Course> result = null;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Course record = new Course();
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
			return (Course[]) result.toArray();
		}catch(Exception e){
			e.printStackTrace();
			return null; // temp
		}
	}
	
	/*public int login(String id,String password){
		String sql = "select password from member where id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(password)){
					return 1; //로그인 성공 
				}
				else
					return 0; // wrong
			}
			return -1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return -2;
	}//end of login
*/	
	
	
	
}