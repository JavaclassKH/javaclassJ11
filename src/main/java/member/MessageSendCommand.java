package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageSendCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sendMid = request.getParameter("sendMid") == null ? "" : request.getParameter("sendMid");
		String receiveMid = request.getParameter("receiveMid") == null ? "" : request.getParameter("receiveMid");
		String message = request.getParameter("message") == null ? "" : request.getParameter("message");

		int res = 0;
		MemberDAO dao = new MemberDAO();
		int res1 = dao.setIntoSendMsg(sendMid, receiveMid, message);
		int res2 = dao.setIntoReceiveMsg(sendMid, receiveMid, message);
		if(res1 != 0 && res2 != 0) res = 1;
		else res = 0;
		response.getWriter().write(res+"");
	}
}
