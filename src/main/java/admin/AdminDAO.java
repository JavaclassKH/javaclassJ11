package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class AdminDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberVO vo = null;
	private String sql = "";
	
	
	public AdminDAO() {}
	
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
	
	// 전체회원목록 조회(관리자전용)
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		try {
			sql = "select * from visitCheck order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setContact(rs.getString("contact"));
				vo.setEmail(rs.getString("email"));
				vo.setJoinDate(rs.getString("joinDate"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setMemLevel(rs.getInt("memLevel"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(전체회원목록 조회(관리자 전용)[AdminDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}



















