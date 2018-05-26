package br.uninove.financeiro.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

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
			System.out.println(input + "1");
			JasperReport jasper = JasperCompileManager.compileReport(input);
			System.out.println(jasper + "2");
			JasperPrint print = JasperFillManager.fillReport(jasper, param, conexao);
			System.out.println(print + "3");
			JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws SQLException {
		new Relatorio().gerarRelatorio(null, null, "");
	}

}
