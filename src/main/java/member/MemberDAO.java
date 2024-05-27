package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberVO vo = null;
	private String sql = "";
	
	
	public MemberDAO() {}
	
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

	// 회원가입시 아이디,닉네임 중복체크!
	public MemberVO getMemberMidNickNameCheck(String midNickName, String whatCheck) {
		MemberVO vo = new MemberVO();
		
		try {
			if(whatCheck.equals("midCheck")) {
				sql = "select * from member where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, midNickName);
				rs = pstmt.executeQuery();
			}
			else {
				sql = "select * from member where nickName = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, midNickName);				
				rs = pstmt.executeQuery();
			}
			
			if(whatCheck.equals("midCheck")) {
				if(rs.next()) vo.setMid(rs.getString("mid"));
			}
			else {
				if(rs.next()) vo.setNickName(rs.getString("nickName"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL오류(아이디,닉네임 중복체크[memberDAO])" + e.getMessage());
		} finally {
			rsClose();
		}	
		return vo;
	}

	// 회원가입 처리!
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,default,default,default);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getNickName());
			pstmt.setString(5, vo.getContact());
			pstmt.setString(6, vo.getEmail());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(회원가입[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}
		
		return res;
	}

	// 로그인 처리
	public MemberVO getMemberLoginOk(String mid) {
	MemberVO vo = null;
		
		try {
			sql = "select * from member where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}			
		} catch (SQLException e) {
			System.out.println("SQL오류(로그인[memberDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 회원 출석체크 글 전체 불러오기
	public ArrayList<VisitCheckVO> getVisitCheckList() {
		ArrayList<VisitCheckVO> vos = new ArrayList<VisitCheckVO>();
		
		try {
			sql = "select * from visitCheck order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				VisitCheckVO vcVo = new VisitCheckVO();
				vcVo.setIdx(rs.getInt("idx"));
				vcVo.setMid(rs.getString("mid"));
				vcVo.setNickName(rs.getString("nickName"));
				vcVo.setContent(rs.getString("content"));
				vcVo.setCheckDate(rs.getString("checkDate"));
				
				vos.add(vcVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(출석체크 글 가져오기[memberDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	
	// 회원 출석체크글 올리기
	public int setMemberVisitCheckOk(String mid, String nickName, String content) {
		int res = 0;
		
		try {
			sql = "insert into visitCheck values (default,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, nickName);
			pstmt.setString(3, content);
			res = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(출석체크글올리기[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}


	
	
	
}