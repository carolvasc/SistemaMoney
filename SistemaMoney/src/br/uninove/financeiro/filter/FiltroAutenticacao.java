package br.uninove.financeiro.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*/
@WebFilter(dispatcherTypes={DispatcherType.REQUEST}, urlPatterns=("/*"))
public class FiltroAutenticacao implements Filter{
		
	@Override
	public void init(FilterConfig filterConfig) throws ServletException{
		
	}
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String url = httpRequest.getRequestURI();
		HttpSession sessao = httpRequest.getSession();
		
		//se vc estiver em login ou autenticador, a funcao ira deixar passar caso contrario ele bloqueia
		if((sessao.getAttribute("usuAutenticador") != null) 
				|| url.lastIndexOf("login.jsp")!=-1
				|| url.lastIndexOf("usucontroller?acao=cadastrar")!=-1
				|| url.lastIndexOf("cadastro.jsp")!=-1
				|| url.lastIndexOf("autenticador")!=-1) 
		{
			chain.doFilter(request, response);
			
		}else {
			//caso não seja login e autenticador ele ira direcionar para login
			//((HttpServletResponse)response).sendRedirect("login.jsp");
			httpResponse.sendRedirect("login.jsp");
		}
		
	}
	
	@Override
	public void destroy() {
			
	}
	

}
/*/