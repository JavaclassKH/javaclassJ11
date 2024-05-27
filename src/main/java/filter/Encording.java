package filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
@WebFilter("/*")

public class Encording implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		chain.doFilter(request, response);
		
	}
}
