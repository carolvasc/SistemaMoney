package br.uninove.financeiro.objetos.bean;

import java.sql.Connection;

import br.uninove.financeiro.util.ConnectionFactory;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;

public class DespesaBean {

	private Connection conexao;

	public DespesaBean() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	public void imprimir() {

		String caminho = "C:/Users/CAROL/git/SistemaMoney/SistemaMoney/WebContent/reports/teste.jasper";
		
		try {
			
			//
			
//			String jrxmlFile = session.getServletContext().getRealPath("/teste.jrxml");
//			
//			InputStream input = new FileInputStream(new File(jrxmFile));
//			
//			JasperReport jasperReport = JasperCompileManager.compileReport(input);
			
			//
			
			JasperPrint relatorio = JasperFillManager.fillReport(caminho, null, conexao);
			
			JasperPrintManager.printReport(relatorio, true);
			
		} catch (JRException e) {
			e.printStackTrace();
		}
		
	}

}
