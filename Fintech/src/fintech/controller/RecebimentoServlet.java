package fintech.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fintech.dao.RecebimentoDAO;

@WebServlet("/adicionarRecebimento")
public class RecebimentoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenha os parâmetros do formulário
        String nomeRecebimento = request.getParameter("nomeRecebimento");
        double valorRecebimento = Double.parseDouble(request.getParameter("valorRecebimento"));
        String dataRecebimento = request.getParameter("dataRecebimento");

        UUID idUsuario = (UUID) request.getSession().getAttribute("idUsuario");

        if (idUsuario != null) {
            RecebimentoDAO recebimentoDAO = new RecebimentoDAO();
            recebimentoDAO.cadastrarRecebimento(nomeRecebimento, dataRecebimento, valorRecebimento, idUsuario);

            // Redirecione para a página principal ou exiba uma mensagem de sucesso
            response.sendRedirect("dashboard.jsp");
        } else {
            // Lidere com o caso em que o ID do usuário não está disponível na sessão.
            // Pode ser necessário redirecionar para a página de login ou tomar outra ação apropriada.
            response.sendRedirect("pagina_de_login.jsp");
        }
    }
}
