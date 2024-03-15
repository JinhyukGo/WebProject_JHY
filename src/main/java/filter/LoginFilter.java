package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;

@WebFilter(filterName="LoginFilter", urlPatterns="LoginFilter.jsp")
public class LoginFilter implements Filter {
	String oracleDriver, oracleURL, oracleId, oraclePwd;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		ServletContext application = filterConfig.getServletContext();
		
		oracleDriver = application.getInitParameter("OracleDriver");
		oracleURL = application.getInitParameter("OracleURL");
		oracleId = application.getInitParameter("OracleId");
		oraclePwd = application.getInitParameter("OraclePwd");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		String method = req.getMethod();
		
		if(method.equals("POST")) {
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			
			MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
			MemberDTO memberDTO = dao.getMemberDTO(user_id, user_pw);
			dao.close();
		
		if(memberDTO.getId() != null) {
			session.setAttribute("User_Id", memberDTO.getId());
			
			String backUrl = request.getParameter("backUrl");
			if(backUrl != null && !backUrl.equals("")) {
				JSFunction.alertLocation(resp, "로그인 전 요청한 페이지로 이동합니다.", backUrl);
				return;
			} else {
				resp.sendRedirect("LoginFilter.jsp");
			}
		} else {
			req.setAttribute("LoginErrMsg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
			req.getRequestDispatcher("LoginFilter.jsp").forward(req, resp);
		}
		} else if(method.equals("GET")) {
			String mode = request.getParameter("mode");
			if("mode" != null && mode.equals("logout")) {
				session.invalidate();
			}
		}
		chain.doFilter(request, response);
	}

}
