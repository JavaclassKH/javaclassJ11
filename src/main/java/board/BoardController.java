package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;

		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/board";
		
		HttpSession session = request.getSession();
		int memLevel = session.getAttribute("memLevel") == null ? 444 : (int)session.getAttribute("memLevel"); 
		
		if(memLevel > 2) {
			request.setAttribute("message", "로그인 후 이용해주세요");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		if(memLevel > 2 || memLevel == 1) {
			request.setAttribute("message", "정회원만 게시판 사용이 가능합니다");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/BoardList")) {
			command = new BoardListcommand();
			command.execute(request, response);
			viewPage += "/boardList.jsp";
		}
		else if(com.equals("/BoardContent")) {
			command = new BoardContentcommand();
			command.execute(request, response);
			viewPage += "/boardContent.jsp";
		}
		else if(com.equals("/BoardGoodBad")) {
			command = new BoardGoodBadcommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/BoardInput")) {
			viewPage += "/boardInput.jsp";
		}
		else if(com.equals("/BoardInputOk")) {
			command = new BoardInputOkcommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/BoardUpdate")) {
			command = new BoardUpdatecommand();
			command.execute(request, response);
			viewPage += "/boardUpdate.jsp";
		}
		else if(com.equals("/BoardUpdateOk")) {
			command = new BoardUpdateOkcommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/BoardReplyInputOk")) {
			command = new BoardReplyInputOkcommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/BoardContentDelete")) {
			command = new BoardContentDeletecommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
	
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
