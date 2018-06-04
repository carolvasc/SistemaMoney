package br.uninove.financeiro.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.uninove.financeiro.util.RelatorioReceita;


@WebServlet("/RelatorioReceitaController")
public class RelatorioReceitaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RelatorioReceitaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RelatorioReceita relatorioRec = new RelatorioReceita();
		Map<String, Object> param = new HashMap<String, Object>();
		String jrxmlPath = request.getServletContext().getRealPath("/reports/receitas.jrxml");
		relatorioRec.gerarRelatorio(request, response, param, jrxmlPath);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
