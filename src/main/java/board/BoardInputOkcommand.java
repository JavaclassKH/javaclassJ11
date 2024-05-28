package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardInputOkcommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title") == null ? "" : request.getParameter("title");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp") == null ? "" : request.getParameter("hostIp");
		System.out.println("content : " + content);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardInputOk(mid, nickName, title, content, hostIp);
		
	
		if(res != 0) {
			request.setAttribute("message", "게시글 등록이 완료되었습니다!");
			request.setAttribute("url", "BoardList.bo");
		}
		else {			
			request.setAttribute("message", "게시글 등록에 실패하였습니다!");
			request.setAttribute("url", "BoardInput.bo");
		}
			
			
	}
}
