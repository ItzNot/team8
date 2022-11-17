package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QnaDao {
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
	
	public List<QnaDto> selectQnaInfo() {
		String sql = "SELECT qseq, subject, content, reply, id, rep, indate FROM qna";
		List<QnaDto> qdl = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			qdl = new ArrayList<QnaDto>();
			while(rs.next()) {
				QnaDto qd = new QnaDto();
				qd.setQseq(rs.getInt(1));
				qd.setSubject(rs.getString(2));
				qd.setContent(rs.getString(3));
				qd.setReply(rs.getString(4));
				qd.setId(rs.getString(5));
				qd.setRep(rs.getString(6));
				qd.setIndate(rs.getDate(7));
				qdl.add(qd);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return qdl;
	}
	
	public QnaDto selectQnaByqseq(int qseq) {
		String sql = "SELECT q.qseq, q.subject, q.content, NVL(q.reply, '답변 내용 작성'), q.id, q.rep, q.indate, m.name FROM qna q, member m WHERE q.id = m.id AND qseq = ?";
		QnaDto qd = null;
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qseq);
			rs = psmt.executeQuery();
			qd = new QnaDto();
			while(rs.next()) {
				qd.setQseq(rs.getInt("qseq"));
				qd.setSubject(rs.getString(2));
				qd.setContent(rs.getString(3));
				qd.setReply(rs.getString(4));
				qd.setId(rs.getString(5));
				qd.setRep(rs.getString(6));
				qd.setIndate(rs.getDate(7));
				qd.setName(rs.getString(8));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return qd;
	}
	
	public int updateQnaInfo(QnaDto qd) {
		String sql = "UPDATE qna SET reply = ?, rep = 'y' WHERE qseq = ?";
		int result = 0;
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qd.getReply());
			psmt.setInt(2, qd.getQseq());
			
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
