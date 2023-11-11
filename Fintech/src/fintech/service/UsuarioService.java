package fintech.service;

import fintech.dao.RegisterDAO;

public class UsuarioService {
    private RegisterDAO registerDAO;

    public UsuarioService() {
        this.registerDAO = new RegisterDAO();
    }

    public void cadastrarUsuario(String nome, String email, String senha) {
        registerDAO.cadastrarUsuario(nome, email, senha);
    }
}