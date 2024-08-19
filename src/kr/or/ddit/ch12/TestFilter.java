package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestFilter implements Filter {
    
    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("TestFilter..! 초기화");
        System.out.println(filterConfig.getInitParameter("param1"));
        this.filterConfig = filterConfig;
    }

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter 수행");		
		request.setCharacterEncoding("UTF-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		String id = req.getRemoteUser();
		
		String param1 = filterConfig.getInitParameter("param1");
		

		String msg = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1)) {
			msg = id;
			request.setAttribute("msg", msg);
		}else {
			resp.sendRedirect("/ch12/ch12_test_loginFailed.jsp");
			return;
		}
		chain.doFilter(request, response);
	}

    @Override
    public void destroy() {
        System.out.println("TestFilter 해제...!");
    }
}

