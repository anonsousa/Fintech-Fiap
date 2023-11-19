package fintech.dao;

import java.nio.ByteBuffer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.util.UUID;

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
    
    private byte[] toBytes(UUID uuid) {
        ByteBuffer bb = ByteBuffer.wrap(new byte[16]);
        bb.putLong(uuid.getMostSignificantBits());
        bb.putLong(uuid.getLeastSignificantBits());
        return bb.array();
    }
    
    
    public BigDecimal obterValorTotalRecebimentos(UUID idUsuario) {
        String query = "SELECT NVL(SUM(VL_RECEBIMENTO), 0) AS TOTAL_RECEBIMENTO FROM T_RECEBIMENTO WHERE ID_USUARIO = UTL_RAW.CAST_TO_RAW(?)";

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Converta o UUID para uma representação de string
            String idUsuarioStr = idUsuario.toString();

            // Utilize setObject com o tipo String
            preparedStatement.setObject(1, idUsuarioStr);

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
}
