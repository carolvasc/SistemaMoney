package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.LancamentoDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;

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

@WebServlet("/lanccontroller")
public class LancamentoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Date dataDia = new Date();
	public Calendar cal = Calendar.getInstance();
	int dia, mes, ano;

	// Mês atual por extenso
	public String getMesExtenso(int mesVisualizado) {
		switch (mesVisualizado) {
		case 1:
			return "Janeiro";
		case 2:
			return "Fevereiro";
		case 3:
			return "Março";
		case 4:
			return "Abril";
		case 5:
			return "Maio";
		case 6:
			return "Junho";
		case 7:
			return "Julho";
		case 8:
			return "Agosto";
		case 9:
			return "Setembro";
		case 10:
			return "Outubro";
		case 11:
			return "Novembro";
		case 12:
			return "Dezembro";

		}
		return null;
	}

	// Pega o mês atual do sistema
	public int getMesDataAtual() {
		cal.setTime(dataDia);
		mes = cal.get(Calendar.MONTH) + 1;
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
		int mesTela = Integer.parseInt(req.getParameter("mesTela"));
		LancamentoDAO lancamentoDAO = new LancamentoDAO();
		RequestDispatcher dispatcher;

		switch (acao) {
		case "lancamentos":
			List<Despesa> listaLanc = lancamentoDAO.listarDespesas(mesTela, getAnoDataAtual());

			req.setAttribute("mesVisualizado", mesTela);
			req.setAttribute("listaLanc", listaLanc);

			dispatcher = req.getRequestDispatcher("lancamentos.jsp");
			dispatcher.forward(req, resp);
			break;
		}

	}

}
