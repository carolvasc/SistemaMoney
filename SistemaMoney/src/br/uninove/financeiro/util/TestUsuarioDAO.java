package br.uninove.financeiro.util;

import java.sql.SQLException;
import java.util.List;

import br.uninove.financeiro.dao.UsuarioDAO;
import br.uninove.financeiro.objetos.entidade.Usuario;

public class TestUsuarioDAO {
	
	
	public static void main(String[] args){
			
		//TestSalvar();
		//TestBuscarPorId();
		//TestBuscarTodos();
		//TestAutenticar();
		//TestCadastrar();
		Verificar();
		}
	
		private static void Verificar() {
				UsuarioDAO usuDAO = new UsuarioDAO();
				
				Usuario usu = new Usuario();
				usu.setLogin("jesus@hotmail.com");
				usu.setSenha("kkkkk");
				usu.setNome("Cristo");
				
				usuDAO.verificarlogin(usu);
		}
	
	
		private static void TestAutenticar() {
		
			UsuarioDAO usuDAO = new UsuarioDAO();
			
			Usuario usu = new Usuario();
			usu.setLogin("teste");
			usu.setSenha("123");
			
			Usuario usuRetorno = usuDAO.autenticar(usu);
			System.out.println(usuRetorno);
			
	}

		public static void TestCadastrar(){
			
			Usuario usu = new Usuario();
			
			usu.setLogin("jesus@hotmail.com");
			usu.setSenha("kkkkk");
			usu.setNome("Cristo");
			
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			usuarioDAO.cadastrar(usu);
			
			System.out.println("Cadastrado com sucesso");
		}
		
		public static void TestExcluir(){
			
			Usuario usu = new Usuario();
			usu.setId(4);
			
			UsuarioDAO usuDAO = new UsuarioDAO();
			usuDAO.excluir(usu);
		}
		
		
		public static void  TestAlterar(){
			
			Usuario usu = new Usuario();
			usu.setId(4);
			usu.setLogin("leo_ferreira@hotmail.com");
			usu.setSenha("876");
			usu.setNome("Matheus");
			
			UsuarioDAO usuDAO = new UsuarioDAO();
			usuDAO.alterar(usu);
			
			System.out.println("Alterado com sucesso");
			
		}
		
		public static void TestBuscarPorId(){
			UsuarioDAO usuDAO = new UsuarioDAO();
			Usuario usuario = usuDAO.buscarPorId(2);
			
			System.out.println(usuario);
		}
		
		public static void TestSalvar(){
			
			Usuario usu = new Usuario();
			
			usu.setId(4);
			usu.setLogin("hjhjhjjj");
			usu.setSenha("sss");
			usu.setNome("Cristo");
			
			UsuarioDAO usuDAO = new UsuarioDAO();
			usuDAO.salvar(usu);
			
			System.out.println("Salvo com sucesso");
		}
		
		public static void TestBuscarTodos(){
			
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			List<Usuario> lista = 	usuarioDAO.buscarTodos();
			for(Usuario u: lista){
				System.out.println(u);
			}
		}
		
	}
	
