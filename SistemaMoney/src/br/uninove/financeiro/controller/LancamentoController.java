package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.dao.LancamentoDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.objetos.entidade.Categoria;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

//localhost:8080/SistemaMoney/despcontroller

@WebServlet("/lanccontroller")
public class LancamentoController extends HttpServlet {

	public Date dataDia = new Date();
	public Calendar cal = Calendar.getInstance();
	int dia, mes, ano;

	// Pega a data atual do sistema
	public void getDataDoDia() {
		cal.setTime(dataDia);
		dia = cal.get(Calendar.DAY_OF_MONTH);
		mes = cal.get(Calendar.MONTH) + 1;
		ano = cal.get(Calendar.YEAR);
	}

	// Pega o mês atual do sistema
	public int getMesDataAtual() {
		cal.setTime(dataDia);
		mes = cal.get(Calendar.MONTH) + 1;
		return mes;
	}

	// Pega o mês atual do sistema
	public int getAnoDataAtual() {
		cal.setTime(dataDia);
		ano = cal.get(Calendar.YEAR);
		return ano;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");
		Despesa despesa = new Despesa();
		LancamentoDAO lancamentoDAO = new LancamentoDAO();
		String id = "";
		RequestDispatcher dispatcher;
		
		int paramMes = getMesDataAtual();
		int paramAno = getAnoDataAtual();

		switch (acao) {
		case "lancamentos":
			List<Despesa> lista = lancamentoDAO.buscarLancamentos(paramMes, paramAno);

			req.setAttribute("listaLanc", listaLanc);
			dispatcher = req.getRequestDispatcher("lancamento.jsp");
			dispatcher.forward(req, resp);
			break;
		}

	}

}
