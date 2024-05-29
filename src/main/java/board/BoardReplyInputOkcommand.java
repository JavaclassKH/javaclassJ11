package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardReplyInputOkcommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String nickName = (String)session.getAttribute("sNickName");
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");

		BoardReplyDAO dao = new BoardReplyDAO();
		int res = dao.setBoardReplyInputOk(idx, mid, nickName, content);
		
		response.getWriter().write(res+"");
		
	}
}
