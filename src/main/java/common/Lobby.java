package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/Lobby")
public class Lobby extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int random = (int)(Math.random() * 3) + 1; 
		request.setAttribute("random", random);
		
		int ir = (int)(Math.random() * 6) + 1; 
		request.setAttribute("ir", ir);
		
		String viewPage = "/WEB-INF/lobby/lobby.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
