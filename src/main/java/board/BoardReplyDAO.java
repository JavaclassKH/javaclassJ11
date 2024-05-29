package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class BoardReplyDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private BoardReplyVO vo = null;
	private String sql = "";
	
	
	public BoardReplyDAO() {}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
	}
	
	// 전체댓글가져오기
	public ArrayList<BoardReplyVO> getBoardReplyList(int idx) {
		ArrayList<BoardReplyVO> vos = new ArrayList<BoardReplyVO>();
		
		try {
			sql = "select * from boardReply where BoardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardReplyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setBoardIdx(rs.getInt("boardIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setContent(rs.getString("content"));;
				
				vos.add(vo);
			}
			
		} catch (Exception e) {
			System.out.println("SQL 오류(전체댓글가져오기[BoardReplyDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		
		return vos;
	}

	// 게시글에 댓글달기
	public int setBoardReplyInputOk(int idx, String mid, String nickName, String content) {
		int res = 0;
		try {
			sql = "insert into boardReply values (default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, mid);
			pstmt.setString(3, nickName);
			pstmt.setString(4, content);
			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("SQL 오류(게시글에 댓글달기[BoardReplyDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}




	



	
	
	
	
}