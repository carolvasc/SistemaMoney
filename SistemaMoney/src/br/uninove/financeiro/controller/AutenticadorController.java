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
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//acessa a sess�o, caso n�o exista ele n�o ira criar outra sess�o
		HttpSession sessao = req.getSession(false);
		
		if(sessao!= null) {
			sessao.invalidate(); //invalida caso n�o exista uma sess�o
		}
		
		resp.sendRedirect("login.jsp");
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//buscar os dados no banco 
		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		
		//colocando dados em objetos Usuario
		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		usuario.setSenha(senha);
		
		//isntanciar o usuarioDAO
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuAutenticador = usuarioDAO.autenticar(usuario);//variavel que carrega o usuario ja registrado
		
		//verificando se o usuario foi encontrado
		if(usuAutenticador!= null) {
			//se o usuario for altenticado, criara uma sess�o
			HttpSession sessao = req.getSession(true); //se n�o tiver um sess�o ele cria
			sessao.setAttribute("usuAutenticador",usuAutenticador); //pegar o objeto dentro da sessao
			
			sessao.setMaxInactiveInterval(60*5); //especifica o tempo em segundos o request do usuario
			
			req.getRequestDispatcher("home.jsp").forward(req, resp);//redirecionando para tela principal
	
		}else {
			resp.getWriter().print("<script> window.alert('N�o encontrado!'); location.href = 'login.jsp';</script>");
		}
	}

	
}