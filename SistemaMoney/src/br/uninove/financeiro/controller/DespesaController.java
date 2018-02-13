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
		System.out.println("Executando código...");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");
		Despesa desp = new Despesa();
		DespesaDAO despDAO = new DespesaDAO();
		String id = "";
		RequestDispatcher dispatcher;

		switch (acao) {
			case "cadastrar":
				desp.setIdDespesa(0);
				desp.setNomeDespesa("");
				desp.setValorDespesa(Float.parseFloat("0"));
				desp.setObsDespesa("");
	
				req.setAttribute("desp", desp);
				dispatcher = req.getRequestDispatcher("despesa.jsp");
				dispatcher.forward(req, resp);
				break;
			case "alterar":
				id = req.getParameter("id");
				desp = despDAO.buscarPorId(Integer.parseInt(id));
	
				req.setAttribute("desp", desp);
				dispatcher = req.getRequestDispatcher("despesa.jsp");
				dispatcher.forward(req, resp);
				break;
			case "listar":
				List<Despesa> lista = despDAO.buscar();
	
				req.setAttribute("lista", lista);
				dispatcher = req.getRequestDispatcher("listardespesa.jsp");
				dispatcher.forward(req, resp);
				break;
			case "excluir":
				id = req.getParameter("id");
				if (id != null) {
					desp.setIdDespesa(Integer.parseInt(id));
				}
				despDAO.excluir(Integer.parseInt(id));
				resp.sendRedirect("despcontroller?acao=listar");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Despesa desp = new Despesa();
		DespesaDAO despDAO = new DespesaDAO();

		Integer idDespesa = Integer.parseInt(req.getParameter("id"));
		String nomeDespesa = req.getParameter("descricao");
		Float valorDespesa = Float.parseFloat(req.getParameter("valor"));
		Date dataDespesa = null;
		Integer catDespesa = 1;
		Integer pagDespesa = 1;
		String obsDespesa = req.getParameter("observacao");

		desp.setIdDespesa(idDespesa);
		desp.setNomeDespesa(nomeDespesa);
		desp.setValorDespesa(valorDespesa);
		desp.setDataDespesa(dataDespesa);
		desp.setCategoriaDespesa(catDespesa);
		desp.setPagamentoDespesa(pagDespesa);
		desp.setObsDespesa(obsDespesa);

		despDAO.salvar(desp);

		if (desp.getIdDespesa() != null) {
			resp.getWriter().print("Alteração feita com sucesso");
		} else {
			resp.getWriter().print("Cadastro realizado com sucesso");
		}

	}

}
