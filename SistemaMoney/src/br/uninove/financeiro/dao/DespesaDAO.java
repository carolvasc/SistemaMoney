package br.uninove.financeiro.dao;

import br.uninove.financeiro.util.ConnectionFactory;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.objetos.entidade.Pagamento;
import br.uninove.financeiro.objetos.entidade.Categoria;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DespesaDAO {

	private Connection conexao;
	String sql;

	// Cria a conex�o
	public DespesaDAO() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	// M�todo que verifica se ser� realizada uma altera��o ou um cadastro
	public void salvar(Despesa despesa) {
		if (despesa.getIdDespesa() != null && despesa.getIdDespesa() != 0) {
			alterar(despesa);
		} else {
			cadastrar(despesa);
		}
	}

	public Integer getId(Despesa despesa) {
		if (despesa.getIdDespesa() != null && despesa.getIdDespesa() != 0) {
			return despesa.getIdDespesa();
		} else {
			return 0;
		}
	}

	// Cadastra uma nova despesa
	public void cadastrar(Despesa despesa) {
		sql = "INSERT INTO despesas (`nome_despesa`, `valor_despesa`, `data_despesa`, `obs_despesa`, "
				+ "`categoria_id_categoria`, `pagamento_id_pagamento`, `usuario_id_usuario`) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement cadastrar = conexao.prepareStatement(sql);

			cadastrar.setString(1, despesa.getNomeDespesa());
			cadastrar.setFloat(2, despesa.getValorDespesa());
			// Data formatada
			String dataTela = despesa.getDataDespesa(); // 10/10/1990
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			// Ir� converter o tipo dd/MM/yyyy para yyyy-MM-dd
			LocalDate dataBanco = LocalDate.parse(dataTela, formato);
			Date date = java.sql.Date.valueOf(dataBanco);
			cadastrar.setDate(3, (java.sql.Date) date);
			//
			cadastrar.setString(4, despesa.getObsDespesa());
			cadastrar.setInt(5, despesa.getIdCategDespesa());
			cadastrar.setInt(6, despesa.getIdPagtoDespesa());
			cadastrar.setInt(7, despesa.getIdUsuario());

			cadastrar.execute();
			
			cadastrar.close();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}

	// Altera detalhes da despesa
	public void alterar(Despesa despesa) {
		sql = "UPDATE despesas SET nome_despesa = ?, valor_despesa = ?, data_despesa = ?, obs_despesa = ?, "
				+ "categoria_id_categoria = ?, pagamento_id_pagamento = ? WHERE id_despesa = ?";
		try {
			PreparedStatement atualizar = conexao.prepareStatement(sql);
			atualizar.setInt(7, despesa.getIdDespesa());

			atualizar.setString(1, despesa.getNomeDespesa());
			atualizar.setFloat(2, despesa.getValorDespesa());
			String dataTela = despesa.getDataDespesa();
			DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			LocalDate dataBanco = LocalDate.parse(dataTela, formato);
			Date date = java.sql.Date.valueOf(dataBanco);
			atualizar.setDate(3, (java.sql.Date) date);
			atualizar.setString(4, despesa.getObsDespesa());
			atualizar.setInt(5, despesa.getIdCategDespesa());
			atualizar.setInt(6, despesa.getIdPagtoDespesa());

			atualizar.executeUpdate();
			
			atualizar.close();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}

	public Double valorTotalDespesa(Integer idLogado) {
		sql = "SELECT SUM(valor_despesa) FROM despesas WHERE usuario_id_usuario = ?";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idLogado);
			ResultSet rs = selecionar.executeQuery();

			rs.next();
			Double valorTotalDespesa = Double.parseDouble(rs.getString(1));
			return valorTotalDespesa;

		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return 0.00;
	}

	public Double valorTotalReceita(Integer idLogado) {
		sql = "SELECT SUM(valor_receita) FROM receitas WHERE usuario_id_usuario = ?";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idLogado);
			ResultSet rs = selecionar.executeQuery();

			// while (rs.next()) {
			// Double valorTotalReceita = (Double)
			// rs.getDouble("valor_receita");
			// return valorTotalReceita;
			// }
			//
			// rs.close();

			rs.next();
			Double valorTotalReceita = Double.parseDouble(rs.getString(1));
			System.out.println(valorTotalReceita);
			return valorTotalReceita;

		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return 0.00;
	}

	// Busca por todas as despesas e as coloca em uma lista
	public ResultSet getResultSet(Integer idLogado) {
		sql = "SELECT * FROM despesas where usuario_id_usuario = ?";
		ResultSet rs = null;
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idLogado);
			rs = selecionar.executeQuery();
			
			selecionar.close();
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return rs;
	}

	// Busca por todas as despesas e as coloca em uma lista
	public List<Despesa> buscar() {
		sql = "SELECT * FROM despesas";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			List<Despesa> despesas = new ArrayList<>();

			while (rs.next()) {
				// Um objeto novo � criado para armazenar uma nova despesa
				Despesa despesa = new Despesa();
				despesa.setIdDespesa(rs.getInt("id_despesa"));
				despesa.setNomeDespesa(rs.getString("nome_despesa"));
				despesa.setValorDespesa(rs.getFloat("valor_despesa"));

				// Data formatada pra consulta (dd/MM/yyyy)
				SimpleDateFormat formatoConsulta = new SimpleDateFormat("dd/MM/yyyy");
				Date dataBanco = rs.getDate("data_despesa");
				String dataFormatada = formatoConsulta.format(dataBanco);
				despesa.setDataDespesa(dataFormatada);
				//

				despesa.setObsDespesa(rs.getString("obs_despesa"));

				despesa.setIdCategDespesa(rs.getInt("categoria_id_categoria"));
				despesa.setNomeCategDespesa(buscarTipoCategoria(despesa.getIdCategDespesa()));

				despesa.setIdPagtoDespesa(rs.getInt("pagamento_id_pagamento"));
				despesa.setNomePagtoDespesa(buscarTipoPagamento(despesa.getIdPagtoDespesa()));

				despesas.add(despesa);
			}

			rs.close();

			selecionar.close();
			
			return despesas;

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
			
			selecionar.close();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;

	}

	public String buscarTipoPagamento(Integer idPagamento) {
		sql = "SELECT * FROM pagamento WHERE id_pagamento = ?";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idPagamento);
			ResultSet rs = selecionar.executeQuery();

			while (rs.next()) {
				Pagamento pagamento = new Pagamento();
				String nomePagamento = rs.getString("forma_pagamento");
				pagamento.setTipoPagamento(rs.getString("forma_pagamento"));
				return nomePagamento;
			}

			rs.close();
			
			selecionar.close();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;

	}

	// Busca por uma despesa espec�fica. Ser� bastante utilizado para alterar a
	// despesa.
	public Despesa buscarPorId(Integer idDespesa) {
		sql = "SELECT * FROM despesas WHERE id_despesa = ?";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			selecionar.setInt(1, idDespesa);
			ResultSet rs = selecionar.executeQuery();

			if (rs.next()) {
				Despesa despesa = new Despesa();
				despesa.setIdDespesa(rs.getInt("id_despesa"));
				despesa.setNomeDespesa(rs.getString("nome_despesa"));
				despesa.setValorDespesa(rs.getFloat("valor_despesa"));
				SimpleDateFormat formatoConsulta = new SimpleDateFormat("dd/MM/yyyy");
				Date dataBanco = rs.getDate("data_despesa");
				String dataFormatada = formatoConsulta.format(dataBanco);
				despesa.setDataDespesa(dataFormatada);
				despesa.setObsDespesa(rs.getString("obs_despesa"));
				despesa.setIdCategDespesa(rs.getInt("categoria_id_categoria"));
				despesa.setNomeCategDespesa(buscarTipoCategoria(despesa.getIdCategDespesa()));

				despesa.setIdPagtoDespesa(rs.getInt("pagamento_id_pagamento"));
				despesa.setNomePagtoDespesa(buscarTipoPagamento(despesa.getIdPagtoDespesa()));

				return despesa;

			}
			
			selecionar.close();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;
	}

	// Busca por todas as categorias e as coloca e uma lista, para ser carregada
	// no combo
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
			
			selecionar.close();

			return categorias;

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;

	}

	public List<Pagamento> getPagamento() {
		sql = "SELECT * FROM pagamento";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			ResultSet rs = selecionar.executeQuery();
			List<Pagamento> pagamentos = new ArrayList<>();

			while (rs.next()) {
				Pagamento pagamento = new Pagamento();
				pagamento.setIdPagamento(rs.getInt("id_pagamento"));
				pagamento.setTipoPagamento(rs.getString("forma_pagamento"));
				pagamentos.add(pagamento);
			}

			rs.close();
			
			selecionar.close();

			return pagamentos;

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;

	}

	// Exclui a despesa selecionada
	public void excluir(Integer idDespesa) {
		sql = "DELETE FROM despesas WHERE id_despesa = ?";
		try {
			PreparedStatement deletar = conexao.prepareStatement(sql);

			deletar.setInt(1, idDespesa);

			deletar.execute();
			
			deletar.close();

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}
	}
}