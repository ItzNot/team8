package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	PreparedStatement psmt;
	ResultSet rs;
	Connection conn;
	
	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1522:orcl"; // 접속 db정보
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
	
	
	
	
	
	
	
	public void MemberInsert(MemberDTO bean) throws Exception {
		connect();
		
		try {  //sql문
			String sql = "insert into MEMBER_INFO values(?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bean.getMemid());
			psmt.setString(2, bean.getMempw());
			psmt.setString(3, bean.getMemname());
			psmt.setString(4, bean.getPhone());
			psmt.setString(5, bean.getAddress());
			psmt.setString(6, bean.getGender());
			psmt.setString(7, bean.getEmail());
			psmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//MemberInsert end
	
	public ArrayList<MemberDTO> getAllList() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		try { 	
			connect();
			String sql = "select * from MEMBER_INFO";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberDTO bean = new MemberDTO();
				bean.setMemid(rs.getString(1));
				bean.setMempw(rs.getString(2));
				bean.setMemname(rs.getString(3));
				bean.setPhone(rs.getString(4));
				bean.setAddress(rs.getString(5));
				bean.setGender(rs.getString(6));
				bean.setEmail(rs.getString(7));
				list.add(bean);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
