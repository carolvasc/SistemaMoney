package br.uninove.financeiro.controller.grafico;

import java.io.IOException;
import java.util.*;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.uninove.financeiro.dao.CategoriaDAO;



@WebServlet("/relatoriocontroller")
public class GraficoRelatorioController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("utf-8");
		
		CategoriaDAO categ = new CategoriaDAO();
		
		resp.getWriter().write(categ.buscarRelatorio());	
		
		
	}

}