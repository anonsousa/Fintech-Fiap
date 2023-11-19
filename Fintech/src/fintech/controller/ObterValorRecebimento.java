package fintech.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fintech.dao.RecebimentoDAO;

/**
 * Servlet implementation class ObterValorRecebimento
 */
@WebServlet("/obterValorTotalRecebimentos")
public class ObterValorRecebimento extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UUID idUsuario = (UUID) request.getSession().getAttribute("idUsuario");

        if (idUsuario != null) {
            RecebimentoDAO recebimentoDAO = new RecebimentoDAO();

            // Modifique o método abaixo conforme necessário para obter o valor total
            BigDecimal valorTotal = recebimentoDAO.obterValorTotalRecebimentos(idUsuario);

            // Envie o valor total como resposta
            response.getWriter().write(valorTotal.toString());
        } else {
            // Se o idUsuario for nulo, envie uma resposta apropriada (por exemplo, código de erro)
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}