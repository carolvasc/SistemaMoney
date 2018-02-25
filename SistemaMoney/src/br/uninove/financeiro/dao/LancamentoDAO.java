package br.uninove.financeiro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import br.uninove.financeiro.objetos.entidade.Categoria;
import br.uninove.financeiro.objetos.entidade.Despesa;
import br.uninove.financeiro.objetos.entidade.Pagamento;
import br.uninove.financeiro.dao.DespesaDAO;
import br.uninove.financeiro.util.ConnectionFactory;

public class LancamentoDAO {
	
	public Date dataDia = new Date();
	public Calendar cal = Calendar.getInstance();
	int dia, mes, ano;

	private Connection conexao;
	String sql;

	// Cria a conexão
	public LancamentoDAO() {
		this.conexao = new ConnectionFactory().getConexao();
	}

	// Pega a data atual do sistema
	public void getDataDoDia() {
		cal.setTime(dataDia);
		dia = cal.get(Calendar.DAY_OF_MONTH);
		mes = cal.get(Calendar.MONTH) + 1;
		ano = cal.get(Calendar.YEAR);
	}

	// Pega o mês atual do sistema
	public int getMesDataAtual() {
		cal.setTime(dataDia);
		mes = cal.get(Calendar.MONTH) + 1;
		return mes;
	}

	// Pega o mês atual do sistema
	public int getAnoDataAtual() {
		cal.setTime(dataDia);
		ano = cal.get(Calendar.YEAR);
		return mes;
	}

	public List<Despesa> buscarLancamento() {
		sql = "SELECT * FROM despesas WHERE MONTH(data_despesa) = ? AND YEAR(data_despesa) = ? ";
		try {
			PreparedStatement selecionar = conexao.prepareStatement(sql);
			
			selecionar.setInt(getMesDataAtual(), 1); // Irá mandar como parâmetro o mês atual
			selecionar.setInt(getAnoDataAtual(), 2); // Irá mandar como parâmetro o ano atual
			
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
