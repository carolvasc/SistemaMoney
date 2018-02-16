package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.objetos.entidade.Categoria;

import java.io.IOException;

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
		Despesa despesa = new Despesa();
		DespesaDAO despesaDAO = new DespesaDAO();
		String id = "";
		RequestDispatcher dispatcher;

		switch (acao) {
			case "cadastrar":
				despesa.setIdDespesa(0);
				despesa.setNomeDespesa("");
				despesa.setValorDespesa(Float.parseFloat("0"));
				despesa.setDataDespesa("");
				despesa.setObsDespesa("");
	
				req.setAttribute("despesa", despesa);
				dispatcher = req.getRequestDispatcher("despesa.jsp");
				dispatcher.forward(req, resp);
				break;
			case "alterar":
				id = req.getParameter("id");
				despesa = despesaDAO.buscarPorId(Integer.parseInt(id));
	
				req.setAttribute("despesa", despesa);
				dispatcher = req.getRequestDispatcher("despesa.jsp");
				dispatcher.forward(req, resp);
				break;
			case "listar":
				List<Despesa> lista = despesaDAO.buscar();
	
				req.setAttribute("lista", lista);
				dispatcher = req.getRequestDispatcher("listardespesa.jsp");
				dispatcher.forward(req, resp);
				break;
			case "listar-categoria":
				List<Categoria> listaCat = despesaDAO.getCategoria();
	
				req.setAttribute("listaCat", listaCat);
				dispatcher = req.getRequestDispatcher("listarcategoria.jsp");
				dispatcher.forward(req, resp);
				break;
			case "excluir":
				id = req.getParameter("id");
				if (id != null) {
					despesa.setIdDespesa(Integer.parseInt(id));
				}
				despesaDAO.excluir(Integer.parseInt(id));
				resp.sendRedirect("despcontroller?acao=listar");
				break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Despesa despesa = new Despesa();
		DespesaDAO despesaDAO = new DespesaDAO();

		Integer idDespesa = Integer.parseInt(req.getParameter("id"));
		String nomeDespesa = req.getParameter("descricao");
		Float valorDespesa = Float.parseFloat(req.getParameter("valor"));
		String dataDespesa = req.getParameter("data");
		Integer catDespesa = Integer.parseInt(req.getParameter("categoria"));
		Integer pagDespesa = Integer.parseInt(req.getParameter("pagamento"));
		String obsDespesa = req.getParameter("observacao");

		despesa.setIdDespesa(idDespesa);
		despesa.setNomeDespesa(nomeDespesa);
		despesa.setValorDespesa(valorDespesa);
		despesa.setDataDespesa(dataDespesa);
		despesa.setIdCategDespesa(catDespesa);
		despesa.setIdPagtoDespesa(pagDespesa);
		despesa.setObsDespesa(obsDespesa);

		despesaDAO.salvar(despesa);

		if (despesa.getIdDespesa() != null) {
			resp.getWriter().print("Alteração feita com sucesso");
		} else {
			resp.getWriter().print("Cadastro realizado com sucesso");
		}

	}

}
