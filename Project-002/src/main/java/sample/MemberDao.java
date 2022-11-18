package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
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
	
	public List<MemberDto> selectMemberInfo() {
		String sql = "SELECT id, name, email, zip_num, address, phone, useyn, indate FROM MEMBER ORDER BY indate DESC";
		List<MemberDto> mdl = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			mdl = new ArrayList<MemberDto>();
			while(rs.next()) {
				MemberDto md = new MemberDto();
				md.setId(rs.getString("id"));
				md.setName(rs.getString("name"));
				md.setEmail(rs.getString("email"));
				md.setZip_num(rs.getString("zip_num"));
				md.setAddress(rs.getString("address"));
				md.setPhone(rs.getString("phone"));
				md.setUseyn(rs.getString("useyn"));
				md.setIndate(rs.getDate("indate"));
				mdl.add(md);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return mdl;
	}
	
	public int selectAllPrice() {
		String sql = "SELECT SUM(o.quantity*p.price1) FROM order_detail o, product p WHERE o.pseq = p.pseq";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberDto md = new MemberDto();
				md.setAllPrice(rs.getInt(1));
				result = md.getAllPrice();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return result;
	}
	
//	public MemberDto selectMemberByid(String id) {
//		
//	}
}
