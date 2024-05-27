package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;

		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/member";
		
		HttpSession session = request.getSession();
		int memLevel = session.getAttribute("memLevel") == null ? 444 : (int)session.getAttribute("memLevel"); 
		
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLoginForm.jsp";
		}
		else if(com.equals("/Lobby")) {
			viewPage = "/WEB-INF/lobby/lobby.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}		
		else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoinForm.jsp";
		}
		else if(com.equals("/MemberMidNickNameCheck")) {
			command = new MemberMidNickNameCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage += "/memberLoginForm.jsp";
		}
		else if(memLevel > 2) {
			request.setAttribute("message", "로그인 후 이용해주세요");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/Lobby")) {
			viewPage = "/WEB-INF/lobby/lobby.jsp";
		}
		else if(com.equals("/MemberVisitCheck")) {
			command = new MemberVisitCheckCommand();
			command.execute(request, response);
			viewPage += "/visitCheck.jsp";
		}
		else if(com.equals("/MemberVisitCheckOk")) {
			command = new MemberVisitCheckOkCommand();
			command.execute(request, response);
			return;
		}
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
