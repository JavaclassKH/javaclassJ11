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
	
	public void pstmtForceClose() {
		if(pstmt == null) {
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
			sql = "select * from member where mid = ?";
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
			sql = "insert into visitCheck values (default,?,?,?,default)";
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

	// 로그인 시 방문횟수 증가
	public void setVisitCntPlus(String mid) {
		try {
			sql = "update member set visitCnt = visitCnt + 1 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(로그인 시 방문횟수 증가[MemberDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}			
	}

	// 메시지 보낼때 수신자유무 확인
	public int getMemberMidList() {
		int res = 0;
		
		try {
			sql = "select mid form member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			System.out.println("SQL 오류(메시지 보낼때 수신자유무 확인[MemberDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 메세지를 받을 회원이 존재하는지 검색
	public String getMemberisHere(String receiverMid) {	
		String nickName = "";
		try {
			sql = "select nickName from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiverMid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nickName = rs.getString("nickName");
				if(nickName == null || nickName == "") {
					nickName = "empty";				
				}
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(메시지 수신자 유무 검색[MemberDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return nickName;
	}
	
	

	// 발신메시지 리스트 확인
	public ArrayList<MsgVO> getSendMsgList(String mid) {
		ArrayList<MsgVO> vos = new ArrayList<MsgVO>();
		
		try {
			sql = "select * from sendMsg where sendMid = ? and checked = 'here' order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MsgVO vo = new MsgVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setSendMid(rs.getString("sendMid"));
				vo.setReceiveMid(rs.getString("receiveMid"));
				vo.setsDate(rs.getString("sDate"));
				vo.setMessage(rs.getString("message"));
				vo.setIsRead(rs.getString("isRead"));
				vo.setChecked(rs.getString("checked"));
				
				vos.add(vo);
			}			
		} catch (SQLException e) {
			System.out.println("SQL 오류(발신메시지 리스트[MemberDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return vos;
	}
	
	
	// 수신메시지 리스트 확인
	public ArrayList<MsgVO> getReceiveMsgList(String mid) {
		ArrayList<MsgVO> vos = new ArrayList<MsgVO>();
		
		try {
			sql = "SELECT *, (SELECT COUNT(*) FROM receiveMsg WHERE isRead = 'N' AND receiveMid = ? AND checked = 'here') AS hereCnt "
					+ "FROM receiveMsg WHERE receiveMid = ? AND checked = 'here' ORDER BY idx DESC;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MsgVO vo = new MsgVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setSendMid(rs.getString("sendMid"));
				vo.setReceiveMid(rs.getString("receiveMid"));
				vo.setsDate(rs.getString("sDate"));
				vo.setMessage(rs.getString("message"));
				vo.setIsRead(rs.getString("isRead"));
				vo.setChecked(rs.getString("checked"));
				vo.setHereCnt(rs.getInt("hereCnt"));
				
				vos.add(vo);
			}			
		} catch (SQLException e) {
			System.out.println("SQL 오류(수신메시지 리스트[MemberDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return vos;
	}

	// 메시지 보내기(보낸메시지DB에 저장)
	public int setIntoSendMsg(String sendMid, String receiveMid, String message) {
		int res = 0;		
		try {
			sql = "insert into sendMsg values (default,?,?,default,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sendMid);
			pstmt.setString(2, receiveMid);
			pstmt.setString(3, message);
			res = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			System.out.println("SQL오류(메시지 보내기(보낸메시지DB에 저장)[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}
	
	
	// 메시지 보내기(받은메시지DB에 저장)
	public int setIntoReceiveMsg(String sendMid, String receiveMid, String message) {
		int res = 0;		
		try {
			sql = "insert into receiveMsg values (default,?,?,default,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sendMid);
			pstmt.setString(2, receiveMid);
			pstmt.setString(3, message);
			res = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			System.out.println("SQL오류(메시지 보내기(받은메시지DB에 저장)[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 메시지 조회시 읽음 표시로 변환!(sendMsg)
	public void setIsReadChange(int idx) {
		try {
			sql = "update sendMsg set isRead = 'Y' where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();     
			
		} catch (Exception e) {
			System.out.println("SQL오류(메시지 조회시 읽음 표시로 변환!(send)[memberDAO])" + e.getMessage());
		} 
	}
	
	// 메시지 조회시 읽음 표시로 변환!(sendMsg)
	public void setIsReadChange2(int idx) {
		try {
			sql = "update receiveMsg set isRead = 'Y' where idx = ?";
        pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, idx);
	      pstmt.executeUpdate();
	      
		} catch (Exception e) {
			System.out.println("SQL오류(메시지 조회시 읽음 표시로 변환!(receive)[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 마이페이지 입장시 안읽은 메시지 수만 표시
	public int getHereMsgCnt(String mid) {
		int hereCnt = 0;
		try {
			sql = "SELECT COUNT(*) AS hereCnt FROM receiveMsg WHERE checked = 'here' AND receiveMid = ? AND isRead = 'N'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) hereCnt = rs.getInt("hereCnt");
			
		} catch (Exception e) {
			System.out.println("SQL오류(마이페이지 입장시 안읽은 메시지 수만 표시[memberDAO])" + e.getMessage());
		} finally {
			
		}
		return hereCnt;
	}

	// 받은메시지 삭제처리
	public int setMsgErase(int idx, String part) {
		int res = 0;	
		try {
			if(part.equals("receive")) {
				sql = "update receiveMsg set checked = 'erase' where idx = ?";				
			}
			else {
				sql = "update sendMsg set checked = 'erase' where idx = ?";								
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL오류(받은메시지 삭제처리(휴지통으로)[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}

	// 관리자목록 조회
	public ArrayList<MemberVO> getAdministerList() {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		try {
			sql = "select mid,nickName from member where memLevel = 0";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SQL오류(관리자목록 조회[memberDAO])" + e.getMessage());
		} 
		return vos;
	}

	// 회원레벨 일괄변경
	public int setMemberLevelChange() {
		// TODO Auto-generated method stub
		return 0;
	}



	
	


	
	
	
}


















