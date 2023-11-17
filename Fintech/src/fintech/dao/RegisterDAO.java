package fintech.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID; 

public class RegisterDAO {
    FintechDAO fintechDAO = new FintechDAO();
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL"; 
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";

    public boolean cadastrarUsuario(String nome, String email, String senha) {
        fintechDAO.conectar();
        
        // Verifica se o email já está registrado
        if (emailJaRegistrado(email)) {
            System.out.println("Email já registrado. Escolha outro email.");
            return false;
        }
 
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        	     PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO T_USUARIO (ID_USUARIO, NM_USUARIO, NM_EMAIL, PW_USUARIO) VALUES (SYS_GUID(), ?, ?, ?)")) {

        	    preparedStatement.setString(1, nome);
        	    preparedStatement.setString(2, email);
        	    preparedStatement.setString(3, senha);

        	    preparedStatement.executeUpdate();
        	    System.out.println("Usuário cadastrado com sucesso.");

        	    return true; // Retorna true se o cadastro for bem-sucedido

        	} catch (SQLException e) {
        	    e.printStackTrace();
        	    throw new RuntimeException("Erro ao cadastrar usuário: " + e.getMessage());
        	} finally {
        	    fintechDAO.desconectar();
        	}
    }

    // Verificar email já registrado
    private boolean emailJaRegistrado(String email) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM T_USUARIO WHERE NM_EMAIL = ?")) {

            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                resultSet.next();
                int count = resultSet.getInt(1);

                return count > 0; // Retorna true se o email já estiver registrado
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao verificar o email: " + e.getMessage());
        }
    }
}