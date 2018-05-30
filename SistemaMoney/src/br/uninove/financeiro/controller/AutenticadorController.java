package br.uninove.financeiro.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.uninove.financeiro.dao.UsuarioDAO;
import br.uninove.financeiro.objetos.entidade.Usuario;

@WebServlet("/autenticador")
public class AutenticadorController extends HttpServlet{
		static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Acessa a sessão, caso não exista ele não ira criar outra sessão
		HttpSession sessao = req.getSession(false);
		
		if(sessao!= null) {
			sessao.invalidate(); // Invalida a sessão caso ela não exista
		}
		
		resp.sendRedirect("login.jsp");
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		
		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		usuario.setSenha(senha);
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuAutenticador = usuarioDAO.autenticar(usuario); // Variável que carrega o usuário já registrado
		
		// Verifica se o usuário foi encontrado
		if(usuAutenticador != null) {
			//se o usuario for altenticado, criara uma sessão
			HttpSession sessao = req.getSession(true);
			sessao.setAttribute("usuAutenticador", usuAutenticador);
			
			sessao.setMaxInactiveInterval(80 * 5); // Especifica o tempo, em segundos, o request do usuario
			
			req.getRequestDispatcher("home.jsp").forward(req, resp);
			
			// Recupera o id do usuario logado para realizar consultas ao banco
			sessao.setAttribute("idUsuario", usuAutenticador.getId());
			
			// Recupera o nome do usuário para mostra-lo na home
			sessao.setAttribute("nomeUsuario", usuAutenticador.getNome());
	
		} else {
			resp.getWriter().print("<script> window.alert('Não encontrado!'); location.href = 'login.jsp';</script>");
		}
	}

	
}