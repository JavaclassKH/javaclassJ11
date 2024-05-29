package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardReplyVO;
import board.BoardVO;
import member.MemberVO;

public class AdminManageMentSystemCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mSw = request.getParameter("mSw") == null ? 1 :Integer.parseInt(request.getParameter("mSw"));

		AdminDAO dao = new AdminDAO();
		MemberVO mVo = null;
		BoardVO bVo = null;
		BoardReplyVO brVo = null;
		
		System.out.println("mSw : " + mSw);
		
		if(mSw == 999) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/Lobby");
//			dispatcher.forward(request, response);
			request.setAttribute("message", "관리자가 아닙니다.");
			request.setAttribute("url", request.getContextPath()+"/Lobby");
			
		}
		
		if(mSw == 1) {
			ArrayList<MemberVO> vos = dao.getMemberList();		
			request.setAttribute("vos", vos);
			request.setAttribute("mSw", 1);
			request.setAttribute("message", "관리자님 환영합니다.");
			request.setAttribute("url", "/WEB-INF/admin/justForAdminLobby.jsp");
		}
		
		else if(mSw == 2) {
			
		}
		
		else if(mSw == 3) {
			
		}
		
		else if(mSw == 4) {
			
		}
		
		
		
		
	}	
}
