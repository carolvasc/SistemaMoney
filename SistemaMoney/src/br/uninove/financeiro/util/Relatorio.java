package br.uninove.financeiro.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import br.uninove.financeiro.controller.RelatorioController;
import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.util.ConnectionFactory;

//import net.sf.jasperreports.engine.JasperCompileManager;
//import net.sf.jasperreports.engine.JasperExportManager;
//import net.sf.jasperreports.engine.JasperFillManager;
//import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.*;

import java.util.Map;

public class Relatorio {

	private Connection conexao;

	public Relatorio() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	public void gerarRelatorio(HttpServletResponse response, Map<String, Object> param, String jrxmlPath) {
		try {
			InputStream input = new FileInputStream(new File(jrxmlPath));
			JasperReport jasper = JasperCompileManager.compileReport(input);

			DespesaDAO rc = new DespesaDAO();

			JRResultSetDataSource jrRs = new JRResultSetDataSource(rc.getResultSet());

			JasperPrint print = JasperFillManager.fillReport(jasper, param, jrRs);
			JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws SQLException {
		new Relatorio().gerarRelatorio(null, null, "");
	}

}
