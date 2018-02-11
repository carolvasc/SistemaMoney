package br.uninove.financeiro.dao;

import br.uninove.financeiro.util.ConnectionFactory;
import br.uninove.financeiro.objetos.entidade.Receita;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class ReceitaDAO {
	
	private Connection conexao;
	String sql;
	
	// Cria a conexão
	public ReceitaDAO() throws SQLException{
		this.conexao = new ConnectionFactory().getConexao();
	}

    // Cadastra uma nova receita no banco
    public void salvar(Receita receita) throws Exception {
    	sql = "INSERT INTO receitas (`nome_receita`, `valor_receita`, `data_receita`, `obs_receita`, "
    			+ "`categoria_id_categoria, `repeticao_id_repeticao`) VALUES (?,?,?,?,?,?)";
        try {
        	PreparedStatement cadastrar = conexao.prepareStatement(sql);
        	
            cadastrar.setString(1, receita.getNomeReceita());
            cadastrar.setFloat(2, receita.getValorReceita());
            // Formatar o campo de data
            cadastrar.setDate(3, receita.getDataReceita());
            //
            cadastrar.setString(4, receita.getObsReceita());
            cadastrar.setInt(5, receita.getCategoriaReceita());
            cadastrar.setInt(7, receita.getRepetirReceita());
            
            // Executa a inserção
            cadastrar.execute();
            
            // Fecha a conexão
            cadastrar.close();
            
        } catch (Exception ex) {
        	System.out.println(ex.toString());
        }
    }
    
    // Altera detalhes da receita
    public void alterar(Receita receita) throws Exception{
		sql = "UPDATE receitas SET nome_receita = ?, valor_receita = ?, data_receita = ?, obs_receita = ?, "
			+ "categoria_id_categoria = ?, repeticao_id_repeticao = ? WHERE id_receita = ?";
    	try {
    		PreparedStatement atualizar = conexao.prepareStatement(sql);
    		
    		atualizar.setString(1, receita.getNomeReceita());
    		atualizar.setFloat(2, receita.getValorReceita());
            // Formatar o campo de data
    		atualizar.setDate(3, receita.getDataReceita());
            //
    		atualizar.setString(4, receita.getObsReceita());
    		atualizar.setInt(5, receita.getCategoriaReceita());
    		atualizar.setInt(7, receita.getRepetirReceita());
    		
    		// Executa a alteração
    		atualizar.executeUpdate();
    		
    		// Fecha a conexão
    		atualizar.close();
    		
    	} catch(Exception ex){
    		System.out.println(ex.toString());
    	}
    }

    // Busca todas as receitas e coloca numa lista
    public List<Receita> buscar() throws Exception {
    	sql = "SELECT * FROM receitas";
        try {
            PreparedStatement selecionar = conexao.prepareStatement(sql);
            ResultSet rs = selecionar.executeQuery();
            List<Receita> receitas = new ArrayList<>();
            
            while (rs.next()) {
            	// Um objeto novo é criado para armazenar uma nova receita
                Receita receita = new Receita();
                receita.setNomeReceita(rs.getString("nome_receita"));
                receita.setValorReceita(rs.getFloat("valor_receita"));
                // Formatar data para jogar na tela
                receita.setDataReceita(rs.getDate("data_receita"));
                //
                receita.setObsReceita(rs.getString("obs_receita"));
                receita.setCategoriaReceita(rs.getInt("categoria_id_categoria"));
                receita.setRepetirReceita(rs.getInt("repeticao_id_repeticao"));
                
                // Adiciona receita à lista
                receitas.add(receita);
            }
            
            // Fecha o resultset
            rs.close();
            
            // Fecha a conexão
            selecionar.close();
            
            // Retorna a lista com todas as receitas
            return receitas;
            
        } catch (Exception ex) {
        	System.out.println(ex.toString());
        }
		return null;
    }

    // Deleta a receita selecionada
    public void deletar(Integer idReceita) throws Exception{
        sql = "DELETE FROM receitas WHERE id=?";
        try {
            PreparedStatement ps = conexao.prepareStatement(sql);
            
            ps.setInt(1, idReceita);
            
            // Executa a exclusão
            ps.execute();
            
        } catch (Exception ex) {
        	System.out.println(ex.toString());
        }
    }
}