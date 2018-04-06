package br.uninove.financeiro.grafico;

import java.awt.BasicStroke;
import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.util.ConnectionFactory;
 
/**
 * Servlet implementation class GeracaoGrafico
 */
@WebServlet("/GeracaoGraficoServlet")
public class GraficoDesp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conexao;
	String sql;
	
	public void GraficoDAO(){
		this.conexao = new ConnectionFactory().getConexao();
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	private PieDataset carregarDados() {
		
		
		String sql = "SELECT * from despesas INNER JOIN categorias ON despesas.categoria_id_categoria = categorias.id_categoria";
		try (PreparedStatement preparador = conexao.prepareStatement(sql)){
		ResultSet rs = preparador.executeQuery();
		DefaultCategoryDataset data = new DefaultCategoryDataset();
		
		while(rs.next()){
			data.setValue(rs.getInt(2), "Categoria das Despesa", rs.getString(10));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
	IOException {

	try {
		JFreeChart chart = ChartFactory.createPieChart("Gráfico das Despesas!", carregarDados(), true, true, true);
		chart.setBorderPaint(Color.black);
		chart.setBorderStroke(new BasicStroke(10.0f));
		chart.setBorderVisible(true);
		if (chart != null) {
			int width = 500;
			int height = 350;
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			response.setContentType("image/png");
			OutputStream out = response.getOutputStream();
			ChartUtilities.writeChartAsPNG(out, chart, width, height, info);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
	
	
}
	

