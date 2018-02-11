package br.uninove.financeiro.util;

import java.sql.*;

public class ConnectionFactory {
    
    private static final String SERVIDOR = "localhost";
    private static final String BANCO = "sistemafinanceiro";
    private static final String USUARIO = "root";
    private static final String SENHA = "";
    private static final String URL = "jdbc:mysql://" + SERVIDOR + "/" + BANCO;

    public Connection getConnection() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(URL, USUARIO, SENHA);
		} catch(Exception  e){
			throw new SQLException(e.getMessage());
		}
	}
   
}