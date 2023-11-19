package fintech.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fintech.dao.RecebimentoDAO;
import fintech.model.Recebimento;

@WebServlet("/adicionarRecebimento")
public class RecebimentoServlet extends HttpServlet {
	
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenha os parâmetros do formulário
        String nomeRecebimento = request.getParameter("nomeRecebimento");
        BigDecimal valorRecebimento = new BigDecimal(request.getParameter("valorRecebimento"));
        String dataRecebimento = request.getParameter("dataRecebimento");
        
        
        UUID idUsuario = (UUID) request.getSession().getAttribute("idUsuario");
        

        if (idUsuario != null) {
            RecebimentoDAO recebimentoDAO = new RecebimentoDAO();
            recebimentoDAO.cadastrarRecebimento(nomeRecebimento, dataRecebimento, valorRecebimento, idUsuario);

            // Obter o valor total após o cadastro do recebimento
            BigDecimal valorTotalRecebimentos = recebimentoDAO.obterValorTotalRecebimentos(idUsuario);
            
            System.out.println("Dados: " + valorTotalRecebimentos);

            request.getSession().setAttribute("valorTotalRecebimentos", valorTotalRecebimentos);
            
            
            
         // Obter a lista de recebimentos
            List<Recebimento> recebimentos = recebimentoDAO.obterRecebimentos(idUsuario);
            // Adicionar a lista de recebimentos ao JSP
            request.setAttribute("recebimentos", recebimentos);

          
            // Redirecionar para o JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("recebimento.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("home.jsp");
        }
    }
}