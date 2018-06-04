package br.uninove.financeiro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.uninove.financeiro.objetos.entidade.Categoria;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.objetos.entidade.Pagamento;
import br.uninove.financeiro.objetos.entidade.Receita;
import br.uninove.financeiro.util.ConnectionFactory;

public class LancamentoDAO {

	private Connection conexao;
	String sql;

	// Cria a conexão
	public LancamentoDAO() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	// Busca todas os lancamentos referentes ao mes e ano atual
	public List<Despesa> listarDespesas(Integer mes, Integer ano, Integer idUsuario) {
		sql = "SELECT * FROM despesas WHERE MONTH(data_despesa) = ? AND YEAR(data_despesa) = ? AND usuario_id_usuario = ?"
				+ " ORDER BY data_despesa";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);

			selecionar.setInt(1, mes); 
			selecionar.setInt(2, ano);
			selecionar.setInt(3, idUsuario);
			

			ResultSet rs = selecionar.executeQuery();
			List<Despesa> despesas = new ArrayList<>();

			while (rs.next()) {
				// Um objeto novo é criado para armazenar uma nova despesa
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

	// Busca todas os lancamentos referentes ao mes e ano atual
	public List<Receita> listarReceitas(Integer mes, Integer ano, Integer idUsuario) {
		sql = "SELECT * FROM receitas WHERE MONTH(data_receita) = ? AND YEAR(data_receita) = ? AND usuario_id_usuario = ?"
				+ " ORDER BY data_receita";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);

			selecionar.setInt(1, mes);
			selecionar.setInt(2, ano);
			selecionar.setInt(3, idUsuario);

			ResultSet rs = selecionar.executeQuery();
			List<Receita> receitas = new ArrayList<>();

			while (rs.next()) {
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
			
			selecionar.close();

			return receitas;

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

}