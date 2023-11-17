package fintech.dao;

import java.nio.ByteBuffer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

public class GastoDAO {
    FintechDAO fintechDAO = new FintechDAO();
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL";
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";

    public boolean cadastrarGasto(String nomeGasto, String dataGasto, double valorGasto, UUID idUsuario) {
        fintechDAO.conectar();

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO T_GASTO (ID_GASTO, ID_USUARIO, NM_GASTO, DT_GASTO, VL_GASTO) VALUES (SYS_GUID(), ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)")) {

            preparedStatement.setBytes(1, toBytes(idUsuario));
            preparedStatement.setString(2, nomeGasto);
            preparedStatement.setString(3, dataGasto);
            preparedStatement.setDouble(4, valorGasto);

            preparedStatement.executeUpdate();
            System.out.println("Gasto cadastrado com sucesso.");

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao cadastrar gasto: " + e.getMessage());
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
}