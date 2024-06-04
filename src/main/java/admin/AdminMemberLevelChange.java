package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class AdminMemberLevelChange implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int level = request.getParameter("level") == null ? 0 : Integer.parseInt(request.getParameter("level"));
		String idxArr = request.getParameter("idxArr") == null ? "" : request.getParameter("idxArr");
    AdminDAO dao = new AdminDAO();
    int res = 0;
     
    String[] arrayIdx = null;
     
    if (!idxArr.equals("")) {
      arrayIdx = idxArr.split("/");
      for (String idx : arrayIdx) {
        res = dao.setMemberLevelChange(Integer.parseInt(idx), level);
      }
      response.getWriter().write(res + "");    	
      return;
    }
    else {
    	response.getWriter().write(res + "");    	
    }
 }
}
