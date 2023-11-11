package fintech.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FintechDAO {
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL"; 
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";

    private Connection connection;

    public FintechDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Driver JDBC do Oracle não encontrado.");
        }
    }

    public void conectar() {
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            if (connection != null) {
                System.out.println("Conexão bem-sucedida com o banco de dados Oracle.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao conectar ao banco de dados Oracle: " + e.getMessage());
        }
    }

    public void desconectar() {
        try {
            if (connection != null) {
                connection.close();
                System.out.println("Conexão com o banco de dados Oracle encerrada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao encerrar a conexão com o banco de dados Oracle: " + e.getMessage());
        }
    }
    
    
    
    
    //VALIDAR LOGIN
    public boolean credenciaisValidas(String login, String senha) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Preparar a consulta SQL para buscar o usuário com o login e senha especificados
            String sql = "SELECT * FROM T_USUARIO WHERE NM_EMAIL = ? AND PW_USUARIO = ?";
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, login);
            preparedStatement.setString(2, senha);

            resultSet = preparedStatement.executeQuery();

            // SE HOUVER LINHAS CORRESPONDENTES NO BANCO DE DADOS, DA 200 NO LOGIN
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao validar as credenciais: " + e.getMessage());
        } finally {
            // Fechar recursos (ResultSet, PreparedStatement e Connection)
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

	}
