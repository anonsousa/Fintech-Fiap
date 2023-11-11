package fintech.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RecebimentoDAO {
    FintechDAO fintechDAO = new FintechDAO();
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL";
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";

    public boolean cadastrarRecebimento(String nomeRecebimento, String dataRecebimento, double valorRecebimento, long idUsuario) {
        fintechDAO.conectar();

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO T_RECEBIMENTO (NM_RECEBIMENTO, DT_RECEBIMENTO, VL_RECEBIMENTO, T_USUARIO_ID_USUARIO) VALUES (?, ?, ?, ?)")) {

            preparedStatement.setString(1, nomeRecebimento);
            preparedStatement.setDate(2, java.sql.Date.valueOf(dataRecebimento));
            preparedStatement.setDouble(3, valorRecebimento);
            preparedStatement.setLong(4, idUsuario);

            preparedStatement.executeUpdate();
            System.out.println("Recebimento cadastrado com sucesso.");

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao cadastrar recebimento: " + e.getMessage());
        } finally {
            fintechDAO.desconectar();
        }
    }
}