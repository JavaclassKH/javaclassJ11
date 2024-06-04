package infos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class InfosDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private InfosVO vo = null;
	private String sql = "";
	
	
	public InfosDAO() {}
	
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

	// 아이브 멤버 소개 정보 가지고 오기
	public ArrayList<InfosVO> getIVEIntroduce() {
		ArrayList<InfosVO> vos = new ArrayList<InfosVO>();
		InfosVO vo = null;
		
		try {
			sql = "select * from introduceIVE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new InfosVO();
				
				vo.setIVEName(rs.getString("IVEName"));
				vo.setPhoto(rs.getString("photo"));
				vo.setPositions(rs.getString("positions"));
				vo.setNickNames(rs.getString("nickNames"));
				vo.setMbti(rs.getString("mbti"));
				vo.setIntroduce(rs.getString("introduce"));
				
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SQL오류(아이브 멤버 소개정보 가지고 오기[indosDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return vos;
	}

	
	
	
}


















