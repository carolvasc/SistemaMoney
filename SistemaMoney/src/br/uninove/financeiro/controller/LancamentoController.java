package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.LancamentoDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;


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

	// Mês atual por extenso
	public String getMesExtenso() {
		Locale local = new Locale("pt", "BR");
		DateFormat dateFormat = new SimpleDateFormat("MMMM 'de' yyyy", local);
		return dateFormat.format(dataDia);
	}

	// Pega o mês anterior do sistema
	public int getMesAnterior() {
		cal.setTime(dataDia);
		mes = getMesDataAtual() - 1;
		return mes;
	}

	// Pega o mês atual do sistema
	public int getMesDataAtual() {
		cal.setTime(dataDia);
		mes = cal.get(Calendar.MONTH) + 1;
		return mes;
	}

	// Pega o mês posterior do sistema
	public int getMesPosterior() {
		cal.setTime(dataDia);
		mes = getMesAnterior() + 1;
		return mes;
	}

	// Pega o ano atual do sistema
	public int getAnoDataAtual() {
		cal.setTime(dataDia);
		ano = cal.get(Calendar.YEAR);
		return ano;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");
		LancamentoDAO lancamentoDAO = new LancamentoDAO();
		RequestDispatcher dispatcher;

		switch (acao) {
		case "lancamentos":
			List<Despesa> listaLanc = lancamentoDAO.buscarLancamentos(getMesDataAtual(), getAnoDataAtual());

			req.setAttribute("listaLanc", listaLanc);
			dispatcher = req.getRequestDispatcher("lancamentos.jsp");
			dispatcher.forward(req, resp);
			break;
		case "anterior":
			listaLanc = lancamentoDAO.buscarLancamentos(getMesAnterior(), getAnoDataAtual());
			
			req.setAttribute("listaLanc", listaLanc);
			dispatcher = req.getRequestDispatcher("lancamentos.jsp");
			dispatcher.forward(req, resp);
			break;
		case "proximo":
			listaLanc = lancamentoDAO.buscarLancamentos(getMesPosterior(), getAnoDataAtual());

			req.setAttribute("listaLanc", listaLanc);
			dispatcher = req.getRequestDispatcher("lancamentos.jsp");
			dispatcher.forward(req, resp);
			break;
		}

	}

}
