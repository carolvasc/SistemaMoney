package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

//localhost:8080/SistemaMoney/despcontroller

@WebServlet("/despcontroller")
public class DespesaController extends HttpServlet {

	public DespesaController() {
		System.out.println("Servlet");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");

		String acao = req.getParameter("acao");
		DespesaDAO despDAO = new DespesaDAO();

		// Se a ação for igual a excluir
		if (acao.equals("excluir")) {
			String id = req.getParameter("id");

			Despesa desp = new Despesa();
			if (id != null) {
				desp.setIdDespesa(Integer.parseInt(id));
			}

			despDAO.excluir(Integer.parseInt(id));
			
			resp.getWriter().print("Excluído com sucesso");

		} else if (acao.equals("listar")) {
			// Se a ação for igual listar
			List<Despesa> lista = despDAO.buscar();

			req.setAttribute("lista", lista);

			RequestDispatcher dispatcher = req.getRequestDispatcher("listardespesa.jsp");
			dispatcher.forward(req, resp);

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nomeDespesa = req.getParameter("descricao");
		Float valorDespesa = Float.parseFloat(req.getParameter("valor"));
		Date dataDespesa = null;
		Integer catDespesa = 1;
		Integer pagDespesa = 1;
		String obsDespesa = req.getParameter("observacao");

		Despesa desp = new Despesa();

		desp.setNomeDespesa(nomeDespesa);
		desp.setValorDespesa(valorDespesa);
		desp.setDataDespesa(dataDespesa);
		desp.setCategoriaDespesa(catDespesa);
		desp.setPagamentoDespesa(pagDespesa);
		desp.setObsDespesa(obsDespesa);

		DespesaDAO despDAO = new DespesaDAO();
		despDAO.salvar(desp);
		resp.getWriter().print("Cadastrado com sucesso");
		System.out.println("Despesa cadastrada com sucesso!");

	}

}
