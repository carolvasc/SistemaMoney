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
import br.uninove.financeiro.util.ConnectionFactory;

public class LancamentoDAO {

	private Connection conexao;
	String sql;

	// Cria a conexão
	public LancamentoDAO() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	// Busca todas os lancamentos referentes ao mes e ano atual
	public List<Despesa> buscarLancamentos(Integer mes, Integer ano) {
		sql = "SELECT * FROM despesas WHERE MONTH(data_despesa) = ? AND YEAR(data_despesa) = ?"
				+ " ORDER BY data_despesa";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);

			selecionar.setInt(1, mes); // Irá mandar como parâmetro o mês
										// atual/anterior/posterior
			selecionar.setInt(2, ano); // Irá mandar como parâmetro o ano atual

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

		} catch (SQLException ex) {
			System.out.println(ex.toString());
		}

		return null;

	}

}