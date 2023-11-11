package fintech.controller;

import fintech.dao.FintechDAO;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		    String login = request.getParameter("login");
		    String senha = request.getParameter("senha");
		    
		    FintechDAO fintechDAO = new FintechDAO();
		    fintechDAO.conectar();

		    if (fintechDAO.credenciaisValidas(login, senha)) {

		        response.sendRedirect("index.jsp");
		    } else {
		        // Exibir uma mensagem de erro
		        request.setAttribute("erro", "Credenciais inválidas. Por favor, tente novamente.");
		        request.getRequestDispatcher("home.jsp").forward(request, response);
		    }

		    fintechDAO.desconectar(); // Desconecta do banco de dados
		}
}