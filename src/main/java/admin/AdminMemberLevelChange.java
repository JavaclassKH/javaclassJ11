package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMemberLevelChange implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member = request.getParameter("member") == null ? "" : request.getParameter("member");
		int level = request.getParameter("level") == null ? 0 : Integer.parseInt(request.getParameter("level"));
		
		System.out.println(member);
		
			
//		for(int i=0; i<=member.length(); i++) {
//		
//		}
		
		
		
	}
}
