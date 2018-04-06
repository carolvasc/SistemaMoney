package br.uninove.financeiro.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.uninove.financeiro.dao.UsuarioDAO;
import br.uninove.financeiro.objetos.entidade.Usuario;



//http://localhost:8080/SistemaFinaceiro/usucontroller
@WebServlet("/usucontroller")
public class UsuarioController extends HttpServlet{
	
	public UsuarioController(){
		System.out.println("Executando código...");
		}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		String acao = req.getParameter("acao");
		String id = req.getParameter("id");
		Usuario usuario = new Usuario();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		if(acao.equals("cadastrar")){
			   
			usuario.setId(0);
			usuario.setLogin("");
			usuario.setSenha("");
			usuario.setNome("");
					
			req.setAttribute("usuario", usuario);
			RequestDispatcher dispatcher = req.getRequestDispatcher("formusuario.jsp");
			dispatcher.forward(req, resp);
			resp.getWriter().println("Cadastrado com sucesso");
			
		}else if(acao.equals("excluir")){
		
				id = req.getParameter("id");		
				if(id!= null)
				usuario.setId(Integer.parseInt(id));
				usuarioDAO.excluir(usuario);
				req.getRequestDispatcher("listausuario.jsp");
				
		}else if(acao.equals("listar")){
			List<Usuario> lista = usuarioDAO.buscarTodos();
			req.setAttribute("lista", lista);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("listausuario.jsp");
			dispatcher.forward(req, resp);
			
		}else if(acao.equals("alterar")){
			
			usuario = usuarioDAO .buscarPorId(Integer.parseInt(id));
			req.setAttribute("usuario", usuario);
			RequestDispatcher dispatcher = req.getRequestDispatcher("formusuario.jsp");
			dispatcher.forward(req, resp);
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException {
		
		Usuario usuario = new Usuario();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		Integer id = Integer.parseInt(req.getParameter("id"));
		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		String nome = req.getParameter("nome");
		
		usuario.setId(id);		
		usuario.setLogin(login);
		usuario.setSenha(senha);
		usuario.setNome(nome);
	
		if(usuarioDAO.verificarlogin(usuario)){
			resp.getWriter().print("<script> window.alert('Esse Email ja existe em nosso site!'); location.href = 'formusuario.jsp';</script>");	
		}else{
			usuarioDAO.salvar(usuario);
			resp.getWriter().print("<script> window.alert('Sua conta foi cadastrada com sucesso!'); location.href = 'login.jsp';</script>");
		}
		
		
		//usuarioDAO.verificarlogin(usuario);
		
		resp.sendRedirect("login.jsp");
	}
	
}