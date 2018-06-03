package br.uninove.financeiro.dao;

import br.uninove.financeiro.util.ConnectionFactory;
import br.uninove.financeiro.objetos.entidade.Receita;
import br.uninove.financeiro.objetos.entidade.Categoria;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReceitaDAO {

	private Connection conexao;
	String sql;

	// Cria a conexão
	public ReceitaDAO() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	// Método que verifica se será realizada uma alteração ou um cadastro
	public void salvar(Receita receita) {
		if (receita.getIdReceita() != null && receita.getIdReceita() != 0) {
			alterar(receita);
		} else {
			cadastrar(receita);
		}
	}

	// Cadastra uma nova receita
	public void cadastrar(Receita receita) {
		sql = "INSERT INTO receitas (`nome_receita`, `valor_receita`, `data_receita`, `obs_receita`, "
				+ "`categoria_id_categoria`) VALUES (?,?,?,?,?)";
		try {
			PreparedStatement cadastrar = conexao.prepareStatement(sql);

			cadastrar.setString(1, receita.getNomeReceita());
			cadastrar.setFloat(2, receita.getValorReceita());
			// Data formatada
			String dataTela = receita.getDataReceita(); // 10/10/1990
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			// Irá converter o tipo dd/MM/yyyy para yyyy-MM-dd
			LocalDate dataBanco = LocalDate.parse(dataTela, formato);
			Date date = java.sql.Date.valueOf(dataBanco);
			cadastrar.setDate(3, (java.sql.Date) date);
			//
			cadastrar.setString(4, receita.getObsReceita());
			cadastrar.setInt(5, receita.getIdCategReceita());

			cadastrar.execute();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}

	// Altera detalhes da receita
	public void alterar(Receita receita) {
		sql = "UPDATE receitas SET nome_receita = ?, valor_receita = ?, data_receita = ?, obs_receita = ?, "
				+ "categoria_id_categoria = ? WHERE id_receita = ?";
		try {
			PreparedStatement atualizar = conexao.prepareStatement(sql);
			atualizar.setInt(6, receita.getIdReceita());

			atualizar.setString(1, receita.getNomeReceita());
			atualizar.setFloat(2, receita.getValorReceita());
			String dataTela = receita.getDataReceita();
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			LocalDate dataBanco = LocalDate.parse(dataTela, formato);
			Date date = java.sql.Date.valueOf(dataBanco);
			atualizar.setDate(3, (java.sql.Date) date);
			atualizar.setString(4, receita.getObsReceita());
			atualizar.setInt(5, receita.getIdCategReceita());

			atualizar.executeUpdate();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}

	// Busca por todas as receitas e as coloca em uma lista
	public List<Receita> buscar() {
		sql = "SELECT * FROM receitas";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			List<Receita> receitas = new ArrayList<>();

			while (rs.next()) {
				// Um objeto novo é criado para armazenar uma nova receita
				Receita receita = new Receita();
				receita.setIdReceita(rs.getInt("id_receita"));
				receita.setNomeReceita(rs.getString("nome_receita"));
				receita.setValorReceita(rs.getFloat("valor_receita"));
				
				// Data formatada pra consulta (dd/MM/yyyy)
				SimpleDateFormat formatoConsulta = new SimpleDateFormat("dd/MM/yyyy");
				Date dataBanco = rs.getDate("data_receita");
				String dataFormatada = formatoConsulta.format(dataBanco);
				receita.setDataReceita(dataFormatada);
				//
				
				receita.setObsReceita(rs.getString("obs_receita"));
				
				receita.setIdCategReceita(rs.getInt("categoria_id_categoria"));
				receita.setNomeCategReceita(buscarTipoCategoria(receita.getIdCategReceita()));

				receitas.add(receita);
			}

			rs.close();

			return receitas;

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
	
	// Busca o nome da categoria que está sendo referenciada
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
	
	// Busca por todas as receitas e as coloca em uma lista
		public ResultSet getResultSet(Integer idLogado) {
			sql = "SELECT * FROM receitas where usuario_id_usuario = ?";
			ResultSet rs = null;
			try {
				PreparedStatement selecionar = conexao.prepareStatement(sql);
				selecionar.setInt(1, idLogado);
				rs = selecionar.executeQuery();
			} catch (Exception ex) {
				System.out.println(ex.toString());
			}
			return rs;
		}

	// Busca por uma receita específica. Será bastante utilizado para alterar a receita.
	public Receita buscarPorId(Integer idReceita) {
		sql = "SELECT * FROM receitas WHERE id_receita = ?";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idReceita);
			ResultSet rs = selecionar.executeQuery();

			if (rs.next()) {
				Receita receita = new Receita();
				receita.setIdReceita(rs.getInt("id_receita"));
				receita.setNomeReceita(rs.getString("nome_receita"));
				receita.setValorReceita(rs.getFloat("valor_receita"));
				SimpleDateFormat formatoConsulta = new SimpleDateFormat("dd/MM/yyyy");
				Date dataBanco = rs.getDate("data_receita");
				String dataFormatada = formatoConsulta.format(dataBanco);
				receita.setDataReceita(dataFormatada);
				receita.setObsReceita(rs.getString("obs_receita"));
				receita.setIdCategReceita(rs.getInt("categoria_id_categoria"));
				receita.setNomeCategReceita(buscarTipoCategoria(receita.getIdCategReceita()));

				return receita;

			}

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;
	}

	// Exclui a receita selecionada
	public void excluir(Integer idReceita) {
		sql = "DELETE FROM receitas WHERE id_receita = ?";
		try {
			PreparedStatement deletar = conexao.prepareStatement(sql);

			deletar.setInt(1, idReceita);

			deletar.execute();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}
}