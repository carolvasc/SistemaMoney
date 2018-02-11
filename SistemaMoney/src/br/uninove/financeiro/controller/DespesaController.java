package br.uninove.financeiro.controller;

import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//localhost:8080/SistemaMoney/despcontroller

@WebServlet("/despcontroller")
public class DespesaController extends HttpServlet{

	public DespesaController(){
		System.out.println("Servlet");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		String nomeDespesa = req.getParameter("descricao");
		Float valorDespesa = Float.parseFloat(req.getParameter("valor"));
		Date dataDespesa = null; //req.getParameter("data");
		Integer catDespesa = 1; //req.getParameter("");
		Integer pagDespesa = 1; //req.getParameter("");
		//String repDespesa = "Não repetir"; //req.getParameter("");
		String obsDespesa = req.getParameter("observacao");
		
		Despesa desp = new Despesa();
		
		desp.setNomeDespesa(nomeDespesa);
		desp.setValorDespesa(valorDespesa);
		desp.setDataDespesa(dataDespesa);
		desp.setCategoriaDespesa(catDespesa);
		desp.setPagamentoDespesa(pagDespesa);
		//desp.setRepetirDespesa(repDespesa);
		desp.setObsDespesa(obsDespesa);
		
		try {
			DespesaDAO despDAO = new DespesaDAO();
			despDAO.salvar(desp);
			resp.getWriter().print("Cadastrado com sucesso");
			System.out.println("Despesa cadastrada com sucesso!");
		} catch (SQLException e) {
			resp.getWriter().print("Ocorreu algum erro");
			e.printStackTrace();
		}
		
	}
	
}
