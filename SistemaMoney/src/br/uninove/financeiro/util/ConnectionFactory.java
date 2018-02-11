package br.uninove.financeiro.util;

import java.sql.*;

import br.com.uninove.dao.String;

public class ConnectionFactory {
    
    private String servidor = "localhost";
    private String banco = "sistemafinanceiro";
    private String usuario = "root";
    private String senha = "";
    private String url = "jdbc:mysql://" + servidor + "/" + banco;

    public Connection getConexao() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, usuario, senha);
		} catch(Exception  e){
			throw new SQLException(e.getMessage());
		}
	}
   
}