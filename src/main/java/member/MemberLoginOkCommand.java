package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();

		MemberVO vo = dao.getMemberLoginOk(mid);
		if(vo == null) {
			request.setAttribute("message", "해당 아이디로 가입된 회원정보가 없습니다");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		// 로그인 실패 [탈퇴한 회원도 로그인이 되지 않게 해야 함]
		/* 프로젝트 진행으로 인해 임시적으로 암호화 진행 중지 */
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("message", "비밀번호를 다시 한번 확인해주세요");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}		

		// 저장된 비밀번호에서 saltkey를 분리시켜서 다시 암호화 한 비밀번호와 맞는지 확인한다
		/* 프로젝트 진행으로 인해 임시적으로 암호화 진행 중지 */
//		String salt = vo.getPwd().substring(0,8);
//		SecurityUtil security = new SecurityUtil();
//		pwd = security.encryptSHA256(salt + pwd);
//		if(!vo.getPwd().substring(8).equals(pwd)) {
//			request.setAttribute("message", "해당 아이디로 가입된 회원정보가 없습니다");
//			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");						
//		}
		
		// 회원인증처리
		if(vo.getMid() != null) {			
			// 3. 등급레벨별 등급 명칭을 저장한다
			String strLevel ="";
			if(vo.getMemLevel() == 0) strLevel = "관리자";
			else if(vo.getMemLevel() == 1) strLevel = "준회원";
			else if(vo.getMemLevel() == 2) strLevel = "정회원";
			
			// 필요한 정보를 세션에 저장한다.
			session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("memLevel", vo.getMemLevel());
			session.setAttribute("strLevel", strLevel);
			
			if(strLevel.equals("관리자")) {
				session.setAttribute("mSw", 0);
			}
			
			
			dao.setVisitCntPlus(mid);
			
			request.setAttribute("message",  "["+mid+"] 님 로그인 완료되었습니다");
			request.setAttribute("url", request.getContextPath()+"/Lobby");
		
		}
	}
}
