package fintech.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import fintech.model.Usuario; 

public class RegisterDAO {
	FintechDAO fintechDAO = new FintechDAO();
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL"; 
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";


	
    public void cadastrarUsuario(String nome, String email, String senha) {
        fintechDAO.conectar();
        
        
 
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO T_USUARIO (NM_USUARIO, NM_EMAIL, PW_USUARIO) VALUES (?, ?, ?)")) {


        	preparedStatement.setString(1, nome);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, senha);

            preparedStatement.executeUpdate();
            System.out.println("Usuário cadastrado com sucesso.");

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao cadastrar usuário: " + e.getMessage());
        } finally {
            fintechDAO.desconectar();
        }
    }
}