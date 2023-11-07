package fintech.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica do tratamento do login por GET
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        if (credenciaisValidas(login, senha)) {
            // Redirecionar para a página principal
            response.sendRedirect("index.jsp");
        } else {
            // Exibir uma mensagem de erro
            request.setAttribute("erro", "Credenciais inválidas. Por favor, tente novamente.");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    private boolean credenciaisValidas(String login, String senha) {
        // Implemente a lógica real para verificar as credenciais do usuário aqui.
        // Isso pode envolver a consulta de um banco de dados ou outra fonte de dados.

        // Exemplo de verificação simples para fins de teste:
        return "test@email.com".equals(login) && "123".equals(senha);
    }
}