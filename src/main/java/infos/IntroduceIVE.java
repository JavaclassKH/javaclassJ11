package infos;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IntroduceIVE implements InfosInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfosDAO dao = new InfosDAO();
		ArrayList<InfosVO> vos = new ArrayList<InfosVO>();
		
		vos = dao.getIVEIntroduce();
		
		request.setAttribute("vos", vos);
	}
}
