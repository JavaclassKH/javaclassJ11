package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class BoardDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private BoardVO vo = null;
	private String sql = "";
	
	
	public BoardDAO() {}
	
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

	// 전체 게시글 보기!
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		
		try {
			sql = "select * from board order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vo.setBad(rs.getInt("bad"));
				vo.setComplain(rs.getString("complain"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류(전체 게시글 보기[boardDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return vos;
	}
	
	// 게시글 조회수 올리기
	public void setBoardReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 오류(게시글 조회수[boardDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 선택 게시글 보기
	public BoardVO getBoardContent(int idx) {
		vo = new BoardVO();
		
		try {
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vo.setBad(rs.getInt("bad"));
				vo.setComplain(rs.getString("complain"));			
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류(선택 게시글 보기[boardDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return vo;
	}

	// 좋아요 싫어요 증가 커맨드
	public int setBoardGoodBad(int idx, int cnt) {
		int res = 0;
		
		try {
			if(cnt > 0) {
				sql = "update board set good = good + 1 where idx = ?";
			}
			else {
				sql = "update board set bad = bad + 1 where idx = ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			System.out.println("SQL 오류(좋아요,싫어요[boardDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		
		return res;
	}

	// 게시판 글 등록하기
	public int setBoardInputOk(String mid, String nickName, String title, String content, String hostIp) {
		int res = 0;
		
		try {
			sql = "insert into board values (default,?,?,?,?,default,?,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, nickName);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, hostIp);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(게시판 글 등록하기[boardDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}

	// 게시판 글 삭제
	public int setBoardContentDelete(int idx) {
		int res = 0;		
		try {
			sql = "delete from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(게시판 글 등록하기[boardDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}

	// 게시글 수정하기
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;		
		try {
			sql = "update board set title = ? , content = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(1, vo.getContent());
			pstmt.setInt(3, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(게시글 수정하기[boardDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}




	
	
	
	
}