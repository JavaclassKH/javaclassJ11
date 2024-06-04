package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReceiveMsgErase implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String part = request.getParameter("part") == null? "" : request.getParameter("part");
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMsgErase(idx, part);
		
		response.getWriter().write(res+"");
		
	}
}
