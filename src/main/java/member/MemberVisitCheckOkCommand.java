package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberVisitCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberVisitCheckOk(mid, nickName, content);
		
		response.getWriter().write(res+"");
		
	}
}
