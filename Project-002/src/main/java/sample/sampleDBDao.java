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
		String sql = "SELECT * FROM emp";
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
	
	public List<ProductDto> selectProductList() {
		String sql = "SELECT prdid, prdname, price, company, address, CASE WHEN grade = 5 THEN '일반고객' ELSE 'VIP' END grade, createdt FROM PRODUCT_INFO order by prdid DESC";
		List<ProductDto> productInfo = null;
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			productInfo = new ArrayList<ProductDto>();
			
			while(rs.next()) {
				ProductDto pt = new ProductDto();
				pt.setPrdid(rs.getInt("prdid"));
				pt.setPrdname(rs.getString("prdname"));
				pt.setPrice(rs.getInt("price"));
				pt.setCompany(rs.getString("company"));
				pt.setAddress(rs.getString("address"));
				pt.setGrade(rs.getString("grade"));
				pt.setCreatedt(rs.getDate("createdt"));
				
				productInfo.add(pt);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return productInfo;
	}
	public int insertProductInfo(String prdname, int price, String company, String address) {
		String sql = "INSERT INTO PRODUCT_INFO VALUES ((SELECT NVL(MAX(prdid),0)+1 FROM PRODUCT_INFO), ?, ?, ?, ?, 5, SYSDATE)";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prdname);
			psmt.setInt(2, price);
			psmt.setString(3, company);
			psmt.setString(4, address);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}
	public ProductDto selectProductInfoById(int prdid) {
		String sql = "SELECT prdid, prdname, price, company, address, grade, createdt FROM PRODUCT_INFO WHERE prdid = ?";
		ProductDto pd = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prdid);
			
			rs = psmt.executeQuery();
			pd = new ProductDto();
			while(rs.next()) {
				pd.setPrdid(rs.getInt("prdid"));
				pd.setPrdname(rs.getString("prdname"));
				pd.setPrice(rs.getInt("price"));
				pd.setCompany(rs.getString("company"));
				pd.setAddress(rs.getString("address"));
				pd.setGrade(rs.getString("grade"));
				pd.setCreatedt(rs.getDate("createdt"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return pd;
	}
	
	public int updateProductInfo(ProductDto pd) {
		String sql = "UPDATE product_info SET prdname = ?, price = ?, company = ?, address = ?, grade = ? WHERE prdid = ?";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pd.getPrdname());
			psmt.setInt(2, pd.getPrice());
			psmt.setString(3, pd.getCompany());
			psmt.setString(4, pd.getAddress());
			psmt.setString(5, pd.getGrade());
			psmt.setInt(6, pd.getPrdid());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;	
	}
	public int deleteProductInfo(int prdid) {
		String sql = "DELETE FROM product_info WHERE prdid = ?";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, prdid);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}
}
