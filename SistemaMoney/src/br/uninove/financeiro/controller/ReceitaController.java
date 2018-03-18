package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.LancamentoDAO;
import br.uninove.financeiro.dao.ReceitaDAO;
import br.uninove.financeiro.objetos.entidade.Receita;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

//localhost:8080/SistemaMoney/reccontroller?acao=nomeDaAcao&mesTela=numeroDeUmADoze

@WebServlet("/reccontroller")
public class ReceitaController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");

		Receita receita = new Receita();
		ReceitaDAO receitaDAO = new ReceitaDAO();
		LancamentoDAO lancamentoDAO = new LancamentoDAO();
		LancamentoController l = new LancamentoController();
		
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
			int mesTela = Integer.parseInt(req.getParameter("mesTela"));
			List<Receita> lista = lancamentoDAO.listarReceitas(mesTela, l.getAnoDataAtual());

			req.setAttribute("mesVisualizado", mesTela);
			req.setAttribute("lista", lista);

			dispatcher = req.getRequestDispatcher("listarreceita.jsp");
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

		resp.sendRedirect("reccontroller?acao=cadastrar");

	}

}
