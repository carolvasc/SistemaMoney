package br.uninove.financeiro.util;

import java.sql.*;

public class ConnectionFactory {
    
    private String servidor = "localhost";
    private String banco = "sistemafinanceiro";
    private String usuario = "root";
    private String senha = "";
    private String url = "jdbc:mysql://" + servidor + "/" + banco;

    public Connection getConexao(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, usuario, senha);
		} catch(SQLException  ex){
			throw new RuntimeException(ex.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
   
}