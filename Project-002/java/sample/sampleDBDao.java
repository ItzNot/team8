package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class sampleDBDao {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 db정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 비밀번호

		Class.forName("oracle.jdbc.driver.OracleDriver");
		if (conn != null) {
			conn.close();
		}
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
	}

	public void disConnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<sampleDBDto> selectPersonInfoList() {
		String sql = "SELECT empno, ename, job, mgr, sal FROM emp";
		List<sampleDBDto> personInfoList = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			personInfoList = new ArrayList<sampleDBDto>();
			
			while(rs.next()) {
				sampleDBDto ps = new sampleDBDto();
				ps.setEmpno(rs.getInt("empno"));
				ps.setEname(rs.getString("ename"));
				ps.setJob(rs.getString("job"));
				ps.setMgr(rs.getInt("mgr"));
				ps.setSal(rs.getInt("sal"));
				
				personInfoList.add(ps);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return personInfoList;
	}
	
}
