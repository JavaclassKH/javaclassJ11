package infos;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberInterface;
import member.MemberJoinOkCommand;
import member.MemberMidNickNameCheckCommand;
@SuppressWarnings("serial")
@WebServlet("*.inf")
public class InfosController extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfosInterface command = null;
	
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/infos";
	
		if(com.equals("/IntroduceIVE")) {
			viewPage += "/introduceIVE.jsp";
		}
		else if(com.equals("/MemberInfo")) {
			viewPage += "/memberInfo.jsp";
		}
		else if(com.equals("/AlbumInfo")) {
			viewPage += "/albumInfo.jsp";
		}
		else if(com.equals("/CheerInfo")) {
			viewPage += "/cheerInfo.jsp";
		}
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	
	}
}
