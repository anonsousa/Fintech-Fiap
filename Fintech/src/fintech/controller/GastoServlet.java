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

import fintech.dao.GastoDAO;
import fintech.model.Gasto;

@WebServlet("/adicionarGasto")
public class GastoServlet extends HttpServlet {
	
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenha os parâmetros do formulário
        String nomeGasto = request.getParameter("nomeGasto");
        BigDecimal valorGasto = new BigDecimal(request.getParameter("valorGasto"));
        String dataGasto = request.getParameter("dataGasto");
        
        
        UUID idUsuario = (UUID) request.getSession().getAttribute("idUsuario");
        

        if (idUsuario != null) {
        	GastoDAO gastoDAO = new GastoDAO();
        	gastoDAO.cadastrarGasto(nomeGasto, dataGasto, valorGasto, idUsuario);

            // Obter o valor total após o cadastro do recebimento
            BigDecimal valorTotalGastos = gastoDAO.obterValorTotalGastos(idUsuario);
            
            System.out.println("Dados: " + valorTotalGastos);

            
            request.getSession().setAttribute("valorTotalGastos_" + idUsuario, valorTotalGastos);
            //request.getSession().setAttribute("valorTotalGastos", valorTotalGastos);
            
            
            
         // Obter a lista de recebimentos
            List<Gasto> gastos = gastoDAO.obterGastos(idUsuario);
            // Adicionar a lista de gastos ao JSP
            request.setAttribute("gasto", gastos);

          
            // Redirecionar para o JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("gasto.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("home.jsp");
        }
    }
}