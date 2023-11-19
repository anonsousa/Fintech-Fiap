package fintech.dao;

import java.nio.ByteBuffer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

import fintech.model.Recebimento;

public class RecebimentoDAO {
    FintechDAO fintechDAO = new FintechDAO();
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL";
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";

    public boolean cadastrarRecebimento(String nomeRecebimento, String dataRecebimento, BigDecimal valorRecebimento, UUID idUsuario) {
        fintechDAO.conectar();

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO T_RECEBIMENTO (ID_RECEBIMENTO, ID_USUARIO, NM_RECEBIMENTO, DT_RECEBIMENTO, VL_RECEBIMENTO) VALUES (SYS_GUID(), ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)")) {

            preparedStatement.setBytes(1, toBytes(idUsuario)); 
            preparedStatement.setString(2, nomeRecebimento);
            preparedStatement.setString(3, dataRecebimento);
            preparedStatement.setBigDecimal(4, valorRecebimento);

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
    
    public BigDecimal obterValorTotalRecebimentos(UUID idUsuario) {
        // Remover traços do ID do usuário
        String idUsuarioSemTracos = idUsuario.toString().replace("-", "").toUpperCase();

        String query = "SELECT NVL(SUM(VL_RECEBIMENTO), 0) AS TOTAL_RECEBIMENTO " +
                       "FROM T_RECEBIMENTO " +
                       "WHERE ID_USUARIO = ?";

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, idUsuarioSemTracos);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getBigDecimal("TOTAL_RECEBIMENTO");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Se não houver resultado, retorne BigDecimal.ZERO
        return BigDecimal.ZERO;
    }

    
    private byte[] toBytes(UUID uuid) {
        ByteBuffer bb = ByteBuffer.wrap(new byte[16]);
        bb.putLong(uuid.getMostSignificantBits());
        bb.putLong(uuid.getLeastSignificantBits());
        return bb.array();
    }
    
    public List<Recebimento> obterRecebimentos(UUID idUsuario) {
        List<Recebimento> recebimentos = new ArrayList<>();

        String idUsuarioSemTracos = idUsuario.toString().replace("-", "").toUpperCase();

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT NM_RECEBIMENTO, DT_RECEBIMENTO, VL_RECEBIMENTO " +
                     "FROM T_RECEBIMENTO WHERE ID_USUARIO = ? " +
                     "ORDER BY DT_RECEBIMENTO ASC")) {

            preparedStatement.setString(1, idUsuarioSemTracos);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Recebimento recebimento = new Recebimento();
                    recebimento.setNomeRecebimento(resultSet.getString("NM_RECEBIMENTO"));
                    recebimento.setDataRecebimento(formatarData(resultSet.getString("DT_RECEBIMENTO")));
                    recebimento.setValorRecebimento(resultSet.getBigDecimal("VL_RECEBIMENTO"));
                    recebimentos.add(recebimento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Trate a exceção apropriadamente
        }

        return recebimentos;
    }

    // Método para formatar a data
    private String formatarData(String data) {
        try {
            SimpleDateFormat formatoEntrada = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat formatoSaida = new SimpleDateFormat("dd/MM/yyyy");
            return formatoSaida.format(formatoEntrada.parse(data));
        } catch (Exception e) {
            e.printStackTrace();
            return data; // Se ocorrer algum erro, apenas retorne a data original
        }
    }
   
}
    

