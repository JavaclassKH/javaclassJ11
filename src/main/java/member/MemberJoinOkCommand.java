package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String contact = request.getParameter("contact") == null ? "" : request.getParameter("contact");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		
		System.out.println(mid);
		System.out.println(pwd);
		System.out.println(name);
		System.out.println(nickName);
		System.out.println(contact);
		System.out.println(email);
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		// 비밀번호 암호화
		/* 프로젝트 진행으로 인해 임시적으로 암호화 진행 중지 */
//		SecurityUtil su = new SecurityUtil();
//		String uid = UUID.randomUUID().toString().substring(0, 8);
//		pwd = su.encryptSHA256(uid + pwd);
//		pwd = uid + pwd;

		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setContact(contact);
		vo.setEmail(email);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원이 되신 것을 환영합니다!\\n로그인 후 이용해주세요!");
			request.setAttribute("url", "Lobby.mem");			
		}
		else {
			request.setAttribute("message", "회원가입에 실패하였습니다");
			request.setAttribute("url", "MemberJoinForm.mem");			
		}
		
		
	}
}
