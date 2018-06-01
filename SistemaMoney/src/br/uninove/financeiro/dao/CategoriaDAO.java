package br.uninove.financeiro.dao;

import br.uninove.financeiro.util.ConnectionFactory;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.objetos.entidade.Receita;
import br.uninove.financeiro.objetos.entidade.Pagamento;
import br.uninove.financeiro.objetos.entidade.Categoria;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CategoriaDAO {

	private Connection conexao;
	String sql;

	// Cria a conexão
	public CategoriaDAO() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	// Busca por todas categorias e os valores das despesas e joga no List
	public String buscar() {
		sql = "select a.tipo_categoria, sum(b.valor_despesa) from categorias a "
				+ " left join despesas b on a.id_categoria=b.categoria_id_categoria"
				+ "	left join usuarios u on u.id_usuario=b.categoria_id_categoria"
				+ " where b.valor_despesa is not null group by a.id_categoria,a.tipo_categoria and categoria_id_categoria = id_usuario;";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			//List<Despesa> despesas = new ArrayList<>();

			StringBuilder dados = new StringBuilder();
			dados.append("[");
			String virgula = "";
			while (rs.next()) {
				
				dados.append(virgula);
				
				dados.append("['");
				dados.append(rs.getString(1));
				dados.append("',");
				dados.append(rs.getString(2));
				dados.append("]");
				
				virgula = ",";
			
			}			
			dados.append("]");
			
		
			rs.close();

			return dados.toString();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
		return null;
		
	}
	
	
	public String buscarRec() {
		sql = "select a.tipo_categoria,sum(r.valor_receita) from categorias a"
				+ " left join receitas r on a.id_categoria=r.categoria_id_categoria"
				+ " where r.valor_receita is not null group by a.id_categoria,a.tipo_categoria;";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			

			StringBuilder dados = new StringBuilder();
			dados.append("[");
			String virgula = "";
			while (rs.next()) {
				
				dados.append(virgula);
				
				dados.append("['");
				dados.append(rs.getString(1));
				dados.append("',");
				dados.append(rs.getString(2));
				dados.append("]");
				
				virgula = ",";
			
			}			
			dados.append("]");
			
		
			rs.close(); 

			return dados.toString();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
		return null;
		
	}
	
	
	public String buscarRelatorio() {
		/*
		sql = "select YEAR(b.data_despesa), sum(b.valor_despesa), sum(r.valor_receita) from usuarios u"
		+ " left join receitas r on u.id_usuario=r.usuario_id_usuario"
		+ " left join despesas b on u.id_usuario=b.usuario_id_usuario"
		+ " where b.valor_despesa and r.valor_receita;";
		*/
		sql="select YEAR(b.data_despesa), sum(b.valor_despesa), sum(r.valor_receita) from categorias a"
				+ " left join receitas r on a.id_categoria=r.categoria_id_categoria"
				+ " left join despesas b on a.id_categoria=b.categoria_id_categoria "
				+ " where b.valor_despesa and r.valor_receita is not null group by a.id_categoria,a.tipo_categoria;";
		
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			

			StringBuilder dados = new StringBuilder();
			dados.append("[['Ano', 'Despesa', 'Receita']");
			String virgula = "";
			while (rs.next()) {
				dados.append(",['");
				dados.append(rs.getString(1));
				dados.append("',");
				dados.append(rs.getString(2));
				dados.append(",");
				dados.append(rs.getString(3));
				dados.append("]");			
			}			
			dados.append("]");
			
		
			rs.close();

			return dados.toString();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
		return null;
		
	}
	
	public String buscarTipoCategoria(Integer idCategoria) {
		sql = "SELECT * FROM categorias WHERE id_categoria = ?";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idCategoria);
			ResultSet rs = selecionar.executeQuery();

			while (rs.next()) {
				Categoria categoria = new Categoria();
				String nomeCategoria = rs.getString("tipo_categoria");
				categoria.setTipoCategoria(rs.getString("tipo_categoria"));
				return nomeCategoria;
			}
			
			rs.close();
			
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
		return null;
		
	}
	


	// Busca por todas as categorias e as coloca e uma lista, para ser carregada no combo
	public List<Categoria> getCategoria() {
		sql = "SELECT * FROM categorias";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			List<Categoria> categorias = new ArrayList<>();

			while (rs.next()) {
				Categoria categoria = new Categoria();
				categoria.setIdCategoria(rs.getInt("id_categoria"));
				categoria.setTipoCategoria(rs.getString("tipo_categoria"));
				categorias.add(categoria);
			}
			
			rs.close();
			
			return categorias;
			
		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
		
		return null;
		
	}
	
	
}


