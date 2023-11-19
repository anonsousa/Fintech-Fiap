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
import java.util.List;
import java.util.UUID;

import fintech.model.Gasto;

public class GastoDAO {
    FintechDAO fintechDAO = new FintechDAO();
    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL";
    private static final String USERNAME = "rm551647";
    private static final String PASSWORD = "260698";

    public boolean cadastrarGasto(String nomeGasto, String dataGasto, BigDecimal valorGasto, UUID idUsuario) {
        fintechDAO.conectar();

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO T_GASTO (ID_GASTO, ID_USUARIO, NM_GASTO, DT_GASTO, VL_GASTO) VALUES (SYS_GUID(), ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)")) {

            preparedStatement.setBytes(1, toBytes(idUsuario)); 
            preparedStatement.setString(2, nomeGasto);
            preparedStatement.setString(3, dataGasto);
            preparedStatement.setBigDecimal(4, valorGasto);

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
    
    public BigDecimal obterValorTotalGastos(UUID idUsuario) {
        // Remover traços do ID do usuário
        String idUsuarioSemTracos = idUsuario.toString().replace("-", "").toUpperCase();

        String query = "SELECT NVL(SUM(VL_GASTO), 0) AS TOTAL_GASTO " +
                       "FROM T_GASTO " +
                       "WHERE ID_USUARIO = ?";

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, idUsuarioSemTracos);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getBigDecimal("TOTAL_GASTO");
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
    
    public List<Gasto> obterGastos(UUID idUsuario) {
        List<Gasto> gastos = new ArrayList<>();

        String idUsuarioSemTracos = idUsuario.toString().replace("-", "").toUpperCase();

        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "SELECT NM_GASTO, DT_GASTO, VL_GASTO " +
                     "FROM T_GASTO WHERE ID_USUARIO = ? " +
                     "ORDER BY DT_GASTO ASC")) {

            preparedStatement.setString(1, idUsuarioSemTracos);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Gasto gasto = new Gasto();
                    gasto.setNomeGasto(resultSet.getString("NM_GASTO"));
                    gasto.setDataGasto(formatarData(resultSet.getString("DT_GASTO")));
                    gasto.setValorGasto(resultSet.getBigDecimal("VL_GASTO"));
                    gastos.add(gasto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Trate a exceção apropriadamente
        }

        return gastos;
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
