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

        usuarioService.cadastrarUsuario(nome, email, senha);

        // Redireciona para a página de sucesso após cadastrar o usuário
        response.sendRedirect("index.jsp");
    }
}