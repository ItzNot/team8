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
	
	public List<ProductDto> selectProductList() {
		String sql = "SELECT pseq, name, kind, price2, content, bestyn, indate FROM PRODUCT order by pseq DESC";
		List<ProductDto> productInfo = null;
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			productInfo = new ArrayList<ProductDto>();
			
			while(rs.next()) {
				ProductDto pt = new ProductDto();
				pt.setPseq(rs.getInt("pseq"));
				pt.setName(rs.getString("name"));
				pt.setKind(rs.getString("kind"));
				pt.setPrice2(rs.getInt("price2"));
				pt.setContent(rs.getString("content"));
				pt.setBestyn(rs.getString("bestyn"));
				pt.setIndate(rs.getDate("indate"));
				
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
	public int insertProductInfo(String name, String kind, int price1, String content, String image) {
		String sql = "INSERT INTO PRODUCT (pseq, name, kind, price2, content, image) VALUES (product_seq.nextval, ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, kind);
			psmt.setInt(3, price1);
			psmt.setString(4, content);
			psmt.setString(5, image);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;
	}
	public ProductDto selectProductInfoById(int pseq) {
		String sql = "SELECT pseq, name, kind, price2, content, NVL(image, 'default.jpg') image, bestyn, indate FROM PRODUCT WHERE pseq = ?";
		ProductDto pd = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pseq);
			
			rs = psmt.executeQuery();
			pd = new ProductDto();
			while(rs.next()) {
				pd.setPseq(rs.getInt("pseq"));
				pd.setName(rs.getString("name"));
				pd.setKind(rs.getString("kind"));
				pd.setPrice2(rs.getInt("price2"));
				pd.setContent(rs.getString("content"));
				pd.setImage(rs.getString("image"));
				pd.setBestyn(rs.getString("bestyn"));
				pd.setIndate(rs.getDate("indate"));
				
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
		String sql = "UPDATE product SET pseq = ?, name = ?, kind = ?, price2 = ?, bestyn = ?, image = ? WHERE pseq = ?";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pd.getPseq());
			psmt.setString(2, pd.getName());
			psmt.setString(3, pd.getKind());
			psmt.setInt(4, pd.getPrice2());
			psmt.setString(5, pd.getBestyn());
			psmt.setString(6, pd.getImage());
			psmt.setInt(7, pd.getPseq());

			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return result;	
	}
	public int deleteProductInfo(int pseq) {
		String sql = "DELETE FROM product WHERE pseq = ?";
		int result = 0;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, pseq);
			
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
