package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoToSendMsgList implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
				
		ArrayList<MsgVO> vos = dao.getSendMsgList(mid);
		

			request.setAttribute("vos", vos);			
		
	}
}
