package br.uninove.financeiro.controller;

import java.io.IOException;

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
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		System.out.println("Chamou");
		
	}
	
}
