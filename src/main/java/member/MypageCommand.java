package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		int hereCnt = 0;
		MemberDAO dao = new MemberDAO();		
		MemberVO vo = dao.getMemberLoginOk(mid);
		hereCnt = dao.getHereMsgCnt(mid);
		
		request.setAttribute("vo", vo);
		request.setAttribute("hereCnt", hereCnt);
		
	}
}
