package trash;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;
import admin.AdminInterface;
import board.BoardReplyVO;
import board.BoardVO;
import member.MemberVO;

public class AdminManageMentSystemCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mSw = request.getParameter("mSw") == null ? 999 :Integer.parseInt(request.getParameter("mSw"));

		AdminDAO dao = new AdminDAO();
		MemberVO mVo = null;
		BoardVO bVo = null;
		BoardReplyVO brVo = null;
		
		AdminInterface command = null;
		String viewPage = "/include/message.jsp";
		
		
		// 인증처리 메소드
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 444 : (int)session.getAttribute("sLevel"); 
		
		
		if(mSw == 999) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/Lobby");
//			dispatcher.forward(request, response);
			request.setAttribute("message", "관리자가 아닙니다.");
			request.setAttribute("url", request.getContextPath()+"/Lobby");
			
		}
		else if(mSw == 0) {
			request.setAttribute("message", "관리자모드를 실행합니다");
			request.setAttribute("url", "/WEB-INF/admin/justForAdminLobby.jsp");
		}		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
				
		
		
	}	
}
