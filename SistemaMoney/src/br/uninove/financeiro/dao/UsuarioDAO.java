package br.uninove.financeiro.dao;

import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.uninove.financeiro.objetos.entidade.Usuario;
import br.uninove.financeiro.util.ConnectionFactory;



public class UsuarioDAO {
	
	private Connection conexao;
	String sql;
	
	public UsuarioDAO(){
		this.conexao = new ConnectionFactory().getConexao();
		}
	
	public void salvar(Usuario usuario){
		if(usuario.getId()!=null && usuario.getId() != 0){
			alterar(usuario);
			}else{
				cadastrar(usuario);
			}
	}
	
	public Usuario cadastrar(Usuario usuario){
		String sql = "INSERT INTO usuarios (`id_usuario`, `login`, `senha`, `nome_usuario`) VALUES (?,?,?,?)";
		
		try(PreparedStatement cadastrar = conexao.prepareStatement(sql)){
			cadastrar.setInt(1, usuario.getId());
			cadastrar.setString(2, usuario.getLogin());
			cadastrar.setString(3, usuario.getSenha());
			cadastrar.setString(4, usuario.getNome());
			cadastrar.execute();
		} 
		catch (SQLException ex){
			System.out.println(ex.toString());
		}
		return usuario;
	}
	
	public void alterar(Usuario usuario){
		sql = "UPDATE usuarios SET login=?, senha=?, nome_usuario=? WHERE id_usuario=? ";
			
			try(PreparedStatement alterar = conexao.prepareStatement(sql)){
				alterar.setString(1, usuario.getLogin());
				alterar.setString(2, usuario.getSenha());
				alterar.setString(3, usuario.getNome());
				alterar.execute();
			} 
			catch (SQLException ex){
				System.out.println(ex.toString());
			}
		}
	
	public Usuario buscarPorId(Integer id){
		String sql = "SELECT * FROM usuarios WHERE id_usuario=?";
		try (PreparedStatement preparador = conexao.prepareStatement(sql)){
			preparador.setInt(1, id);
			
			ResultSet resultado = preparador.executeQuery();
			//Posiciona o cursor no primeiro registro
			if(resultado.next()){
				Usuario usuario = new Usuario();
				usuario.setId(resultado.getInt("id_usuario"));
				usuario.setLogin(resultado.getString("login"));
				usuario.setSenha(resultado.getString("senha"));
				usuario.setNome(resultado.getString("nome_usuario"));
			
				return usuario;
			}
		}catch(SQLException ex){
			System.out.println(ex.toString());
		}
		return null;
	}
	
	

	
	public List<Usuario> buscarTodos(){
		String sql = "SELECT * FROM usuarios";
		List<Usuario> lista = new ArrayList <Usuario>();
		try(PreparedStatement selecionado = conexao.prepareStatement(sql)){
			ResultSet resultado = selecionado.executeQuery();
			while(resultado.next()){
				Usuario usuario = new Usuario();
				usuario.setId(resultado.getInt("id_usuario"));
				usuario.setLogin(resultado.getString("login"));
				usuario.setSenha(resultado.getString("senha"));
				usuario.setNome(resultado.getString("nome_usuario"));
				lista.add(usuario);
			}
		}catch(SQLException ex){
			System.out.println(ex.toString()); 
		}
		return lista;
	}
	
	public Usuario autenticar(Usuario usuario){
		
		String sql = "SELECT * FROM  usuarios WHERE login=? and senha=?";

		try(PreparedStatement preparador = conexao.prepareStatement(sql)){
				
				preparador.setString(1, usuario.getLogin());
				preparador.setString(2, usuario.getSenha());
				ResultSet resultado = preparador.executeQuery();
				
				if(resultado.next()) {
					Usuario usu = new Usuario();
					usu.setId(resultado.getInt("id_usuario"));
					usu.setLogin(resultado.getString("login"));
					usu.setSenha(resultado.getString("senha"));
					usu.setNome(resultado.getString("nome_usuario"));
					
					return usu;
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
			return null;
	}
	
	public boolean verificarlogin(Usuario usuario){
					
			String sql = "SELECT login FROM usuarios WHERE login = ?";
			boolean repetido = false;
			try(PreparedStatement ver = conexao.prepareStatement(sql)){
				ver.setString(1, usuario.getLogin());
				
				ResultSet result = ver.executeQuery();
				repetido = result.next();
				if(repetido = true){					
				}			
				}catch(SQLException e){
					e.printStackTrace();
				}
			
			cadastrar(usuario);
			return repetido;
			}
	
	public void excluir(Usuario usuario){
		String sql = "DELETE FROM usuarios WHERE id_usuario=?";
		try {
			PreparedStatement deletar = conexao.prepareStatement(sql);
			deletar.setInt(1, usuario.getId());
			deletar.execute();
			
		}catch(SQLException ex){
			System.out.println(ex.toString());
		}
		
	}
}
