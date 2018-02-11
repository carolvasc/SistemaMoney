package br.uninove.financeiro.dao;

import br.uninove.financeiro.util.ConnectionFactory;
import br.uninove.financeiro.objetos.entidade.Despesa;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class DespesaDAO {
	
	private Connection conexao;
	String sql;
	
	// Cria a conexão
	public DespesaDAO() throws SQLException{
		this.conexao = new ConnectionFactory().getConexao();
	}

    // Cadastra uma nova despesa no banco
    public void salvar(Despesa despesa) throws Exception {
    	sql = "INSERT INTO despesas (`nome_despesa`, `valor_despesa`, `data_despesa`, `obs_despesa`, "
    			+ "`categoria_id_categoria, `pagamento_id_pagamento`, `repeticao_id_repeticao`) VALUES (?,?,?,?,?,?,?)";
        try {
        	PreparedStatement cadastrar = conexao.prepareStatement(sql);
        	
            cadastrar.setString(1, despesa.getNomeDespesa());
            cadastrar.setFloat(2, despesa.getValorDespesa());
            // Formatar o campo de data
            cadastrar.setDate(3, despesa.getDataDespesa());
            //
            cadastrar.setString(4, despesa.getObsDespesa());
            cadastrar.setInt(5, despesa.getCategoriaDespesa());
            cadastrar.setInt(6, despesa.getPagamentoDespesa());
            cadastrar.setInt(7, despesa.getRepetirDespesa());
            
            // Executa a inserção
            cadastrar.execute();
            
            // Fecha a conexão
            cadastrar.close();
            
        } catch (Exception ex) {
        	System.out.println(ex.toString());
        }
    }
    
    // Altera detalhes da despesa
    public void alterar(Despesa despesa) throws Exception{
		sql = "UPDATE despesas SET nome_despesa = ?, valor_despesa = ?, data_despesa = ?, obs_despesa = ?, "
			+ "categoria_id_categoria = ?, pagamento_id_pagamento = ?, repeticao_id_repeticao = ? WHERE id_despesa = ?";
    	try {
    		PreparedStatement atualizar = conexao.prepareStatement(sql);
    		
    		atualizar.setString(1, despesa.getNomeDespesa());
    		atualizar.setFloat(2, despesa.getValorDespesa());
            // Formatar o campo de data
    		atualizar.setDate(3, despesa.getDataDespesa());
            //
    		atualizar.setString(4, despesa.getObsDespesa());
    		atualizar.setInt(5, despesa.getCategoriaDespesa());
    		atualizar.setInt(6, despesa.getPagamentoDespesa());
    		atualizar.setInt(7, despesa.getRepetirDespesa());
    		
    		// Executa a alteração
    		atualizar.executeUpdate();
    		
    		// Fecha a conexão
    		atualizar.close();
    		
    	} catch(Exception ex){
    		System.out.println(ex.toString());
    	}
    }

    // Busca todas as despesas e coloca numa lista
    public List<Despesa> buscar() throws Exception {
    	sql = "SELECT * FROM despesas";
        try {
            PreparedStatement selecionar = conexao.prepareStatement(sql);
            ResultSet rs = selecionar.executeQuery();
            List<Despesa> despesas = new ArrayList<>();
            
            while (rs.next()) {
            	// Um objeto novo é criado para armazenar uma nova despesa
                Despesa despesa = new Despesa();
                despesa.setNomeDespesa(rs.getString("nome_despesa"));
                despesa.setValorDespesa(rs.getFloat("valor_despesa"));
                // Formatar data para jogar na tela
                despesa.setDataDespesa(rs.getDate("data_despesa"));
                //
                despesa.setObsDespesa(rs.getString("obs_despesa"));
                despesa.setCategoriaDespesa(rs.getInt("categoria_id_categoria"));
                despesa.setPagamentoDespesa(rs.getInt("pagamento_id_pagamento"));
                despesa.setRepetirDespesa(rs.getInt("repeticao_id_repeticao"));
                
                // Adiciona despesa à lista
                despesas.add(despesa);
            }
            
            // Fecha o resultset
            rs.close();
            
            // Fecha a conexão
            selecionar.close();
            
            // Retorna a lista com todas as despesas
            return despesas;
            
        } catch (Exception ex) {
        	System.out.println(ex.toString());
        }
		return null;
    }

    // Deleta a despesa selecionada
    public void deletar(Integer idDespesa) throws Exception{
        sql = "DELETE FROM despesas WHERE id=?";
        try {
            PreparedStatement ps = conexao.prepareStatement(sql);
            
            ps.setInt(1, idDespesa);
            
            // Executa a exclusão
            ps.execute();
            
        } catch (Exception ex) {
        	System.out.println(ex.toString());
        }
    }
}