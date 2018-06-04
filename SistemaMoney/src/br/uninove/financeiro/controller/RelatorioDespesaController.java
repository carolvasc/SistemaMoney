package br.uninove.financeiro.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.uninove.financeiro.util.RelatorioDespesa;

@WebServlet("/RelatorioDespesaController")
public class RelatorioDespesaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RelatorioDespesaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RelatorioDespesa relatorioDesp = new RelatorioDespesa();
		Map<String, Object> param = new HashMap<String, Object>();
		String jrxmlPath = request.getServletContext().getRealPath("/reports/despesas.jrxml");
		relatorioDesp.gerarRelatorio(request, response, param, jrxmlPath);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
