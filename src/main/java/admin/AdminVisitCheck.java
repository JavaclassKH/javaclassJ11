package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.VisitCheckVO;

public class AdminVisitCheck implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		ArrayList<VisitCheckVO> vos = dao.getVisitCheckList();
		
		request.setAttribute("vos", vos);

		MemberDAO ado = new MemberDAO();
	}

}
