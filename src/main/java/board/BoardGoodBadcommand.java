package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardGoodBadcommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int cnt = request.getParameter("cnt") == null ? 0 : Integer.parseInt(request.getParameter("cnt"));
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardGoodBad(idx, cnt);
		
		response.getWriter().write(res + "");
		
	}
}
