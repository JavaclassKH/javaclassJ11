package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMidNickNameCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whatCheck = request.getParameter("whatCheck") == null ? "" : request.getParameter("whatCheck");
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		if(whatCheck.equals("midCheck")) {
			vo = dao.getMemberMidNickNameCheck(mid, whatCheck);
		}
		else {
			vo = dao.getMemberMidNickNameCheck(nickName, whatCheck);
		}
		
		int res = 999;
		
		if(whatCheck.equals("midCheck")) {
			if(vo.getMid() == null) res = 1;
			else res = 0;
		}
		else {
			if(vo.getNickName() == null) res = 1;
			else res = 0;
		}
		
		response.getWriter().write(res+"");
	}
}
