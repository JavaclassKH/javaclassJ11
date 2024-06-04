package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MsgSendMidCheck implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receiverMid = request.getParameter("receiverMid") == null ? "" : request.getParameter("receiverMid");
		String nickName = "";
		int res = 0;
		
		MemberDAO dao = new MemberDAO();
		nickName = dao.getMemberisHere(receiverMid);
		
		if(nickName == null || nickName == "" || nickName == "empty") {
			res = 99;
			response.getWriter().write(res+"");						
		}
		else {
			res = 0;
			response.getWriter().write(res+"");						
		}
		
	}
}
