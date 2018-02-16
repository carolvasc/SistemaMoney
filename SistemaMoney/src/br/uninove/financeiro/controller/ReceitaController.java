package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.ReceitaDAO;
import br.uninove.financeiro.objetos.entidade.Receita;
import br.uninove.financeiro.objetos.entidade.Categoria;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

//localhost:8080/SistemaMoney/reccontroller

@WebServlet("/reccontroller")
public class ReceitaController extends HttpServlet {

	public ReceitaController() {
		System.out.println("Executando c�digo...");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");
		Receita receita = new Receita();
		ReceitaDAO receitaDAO = new ReceitaDAO();
		String id = "";
		RequestDispatcher dispatcher;

		switch (acao) {
			case "cadastrar":
				receita.setIdReceita(0);
				receita.setNomeReceita("");
				receita.setValorReceita(Float.parseFloat("0"));
				receita.setDataReceita("");
				receita.setObsReceita("");
	
				req.setAttribute("receita", receita);
				dispatcher = req.getRequestDispatcher("receita.jsp");
				dispatcher.forward(req, resp);
				break;
			case "alterar":
				id = req.getParameter("id");
				receita = receitaDAO.buscarPorId(Integer.parseInt(id));
	
				req.setAttribute("receita", receita);
				dispatcher = req.getRequestDispatcher("receita.jsp");
				dispatcher.forward(req, resp);
				break;
			case "listar":
				List<Receita> lista = receitaDAO.buscar();
	
				req.setAttribute("lista", lista);
				dispatcher = req.getRequestDispatcher("listarreceita.jsp");
				dispatcher.forward(req, resp);
				break;
			case "listar-categoria":
				List<Categoria> listaCat = receitaDAO.getCategoria();
	
				req.setAttribute("listaCat", listaCat);
				dispatcher = req.getRequestDispatcher("listarcategoria.jsp");
				dispatcher.forward(req, resp);
				break;
			case "excluir":
				id = req.getParameter("id");
				if (id != null) {
					receita.setIdReceita(Integer.parseInt(id));
				}
				receitaDAO.excluir(Integer.parseInt(id));
				resp.sendRedirect("reccontroller?acao=listar");
				break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Receita receita = new Receita();
		ReceitaDAO receitaDAO = new ReceitaDAO();

		Integer idReceita = Integer.parseInt(req.getParameter("id"));
		String nomeReceita = req.getParameter("descricao");
		Float valorReceita = Float.parseFloat(req.getParameter("valor"));
		String dataReceita = req.getParameter("data");
		Integer catReceita = Integer.parseInt(req.getParameter("categoria"));
		String obsReceita = req.getParameter("observacao");

		receita.setIdReceita(idReceita);
		receita.setNomeReceita(nomeReceita);
		receita.setValorReceita(valorReceita);
		receita.setDataReceita(dataReceita);
		receita.setIdCategReceita(catReceita);
		receita.setObsReceita(obsReceita);

		receitaDAO.salvar(receita);

		if (receita.getIdReceita() != null) {
			resp.getWriter().print("Altera��o feita com sucesso");
		} else {
			resp.getWriter().print("Cadastro realizado com sucesso");
		}

	}

}
