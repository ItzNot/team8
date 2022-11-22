package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
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
	
	public List<OrderDto> selectOrderList() {
		String sql = "SELECT o.oseq, o.id id, m.name, o.indate FROM orders o, member m WHERE o.id = m.id ORDER BY oseq DESC";
		List<OrderDto> orderInfo = null;
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			orderInfo = new ArrayList<OrderDto>();
			
			while(rs.next()) {
				OrderDto od = new OrderDto();
				od.setOseq(rs.getInt(1));
				od.setId(rs.getString(2));
				od.setName(rs.getString(3));
				od.setIndate(rs.getDate(4));
				
				orderInfo.add(od);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		return orderInfo;
	}
	
	public List<OrderDetailDto> selectListOrderbymemid(int oseq) {
		String sql = "SELECT od.odseq, od.oseq, od.pseq, od.quantity, od.quantity*p.price2, od.result FROM ORDER_DETAIL od, product p WHERE od.pseq = p.pseq AND oseq = ? ORDER BY od.odseq";
		List<OrderDetailDto> odd = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, oseq);
			
			rs = psmt.executeQuery();
			odd = new ArrayList<OrderDetailDto>();
			while(rs.next()) {
				OrderDetailDto od = new OrderDetailDto();
				od.setOdseq(rs.getInt(1));
				od.setOseq(rs.getInt(2));
				od.setPseq(rs.getInt(3));
				od.setQuantity(rs.getInt(4));
				od.setAllPrice(rs.getInt(5));
				od.setResult(rs.getString(6));
				
				odd.add(od);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return odd;
	}
	public OrderDto selectOrderbymemid(int oseq) {
		String sql = "SELECT m.name FROM orders o, member m WHERE o.id = m.id AND o.oseq = ?";
		OrderDto od = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, oseq);
			
			rs = psmt.executeQuery();
			od = new OrderDto();
			while(rs.next()) {
				od.setName(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return od;
	}
	
	public OrderDetailDto selectOrderPricebymemid(int oseq) {
		String sql = "SELECT SUM(o.quantity*p.price2) FROM order_detail o, product p WHERE o.pseq = p.pseq GROUP BY o.oseq HAVING o.oseq = ?";
		OrderDetailDto odt = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, oseq);
			
			rs = psmt.executeQuery();
			odt = new OrderDetailDto();
			while(rs.next()) {
				odt.setAllPrice(rs.getInt(1));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return odt;
	
	}
}
