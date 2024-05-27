package common;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/UuidProcess")
public class UuidProcess extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UUID uid = UUID.randomUUID();
		System.out.println("uid : " + uid);
		
		response.getWriter().write(uid+"");
		
	}
}
