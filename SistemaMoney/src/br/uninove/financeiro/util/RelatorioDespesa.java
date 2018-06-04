package br.uninove.financeiro.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.uninove.financeiro.controller.RelatorioController;
import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.objetos.entidade.Usuario;
import br.uninove.financeiro.util.ConnectionFactory;

//import net.sf.jasperreports.engine.JasperCompileManager;
//import net.sf.jasperreports.engine.JasperExportManager;
//import net.sf.jasperreports.engine.JasperFillManager;
//import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.*;

import java.util.Map;

public class RelatorioDespesa {

	private Connection conexao;
	
	public HttpSession ses;

	public RelatorioDespesa() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	public void gerarRelatorio(HttpServletRequest request, HttpServletResponse response, Map<String, Object> param, String jrxmlPath) {
		try {
			InputStream input = new FileInputStream(new File(jrxmlPath));
			
			DespesaDAO despesa = new DespesaDAO();
			Usuario usuario = new Usuario();
			ses = request.getSession();
			
			// Recupera o id do usuário logado
			Integer id = (Integer) ses.getAttribute("idUsuario");
			
			JasperReport jasper = JasperCompileManager.compileReport(input);

			JRResultSetDataSource jrRs = new JRResultSetDataSource(despesa.getResultSet(id));

			JasperPrint print = JasperFillManager.fillReport(jasper, param, jrRs);
			JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws SQLException {
		new Relatorio().gerarRelatorio(null, null, null, "");
	}

}
