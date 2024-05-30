package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;

		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/admin";
		
		HttpSession session = request.getSession();
		int memLevel = session.getAttribute("memLevel") == null ? 444 : (int)session.getAttribute("memLevel"); 
		
		
		if(memLevel != 0) {
			request.setAttribute("message", "관리자 전용 페이지입니다");
			request.setAttribute("url", "MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/JustForAdmin")) {
			viewPage += "/justForAdminLobby.jsp";
		}
		else if(com.equals("/AdminMemberList")) {
			command = new AdminMemberList();
			command.execute(request, response);
			viewPage += "/adminMemberList.jsp";
		}
		else if(com.equals("/AdminMemberLevelChange")) {
			command = new AdminMemberLevelChange();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminVisitCheck")) {
			command = new AdminVisitCheck();
			command.execute(request, response);
			return;
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
}
