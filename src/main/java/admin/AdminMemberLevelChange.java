package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class AdminMemberLevelChange implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String members = request.getParameter("member") == null ? "" : request.getParameter("member");
		int level = request.getParameter("level") == null ? 0 : Integer.parseInt(request.getParameter("level"));
		MemberDAO dao = new MemberDAO();

		
		int res = dao.setMemberLevelChange();
		
		
		
	}
}
