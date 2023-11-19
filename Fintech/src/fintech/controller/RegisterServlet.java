package fintech.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fintech.service.UsuarioService;

import java.io.IOException;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsuarioService usuarioService = new UsuarioService();

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        boolean cadastroSucesso = usuarioService.cadastrarUsuario(nome, email, senha);

        if (cadastroSucesso) {
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("mensagemErro", "Email já registrado. Escolha outro email.");
            // Remova o redirecionamento e encaminhe para a página atual
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}