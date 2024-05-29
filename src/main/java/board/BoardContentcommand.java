package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentcommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoardContent(idx);
		
		HttpSession session = request.getSession();
		ArrayList<String> ContentReadNum = (ArrayList<String>)session.getAttribute("sContentIdx"); 
		if(ContentReadNum == null) ContentReadNum = new ArrayList<String>();
		String imsiContentReadNum = "board" + idx;
		
		if(!ContentReadNum.contains(imsiContentReadNum)) {
			// 게시글 조회수 1씩 증가시키기
			dao.setBoardReadNumPlus(idx);
			ContentReadNum.add(imsiContentReadNum);
		}
		session.setAttribute("sContentIdx", ContentReadNum);
		
		request.setAttribute("vo", vo);
		
		BoardReplyDAO rDao = new BoardReplyDAO();
		ArrayList<BoardReplyVO> vos = rDao.getBoardReplyList(idx);
		request.setAttribute("vos", vos);
		
		
		
		
	}
}
