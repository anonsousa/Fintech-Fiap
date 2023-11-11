package fintech.service;

import fintech.dao.RegisterDAO;

public class UsuarioService {
    private RegisterDAO registerDAO;

    public UsuarioService() {
        this.registerDAO = new RegisterDAO();
    }

    public boolean cadastrarUsuario(String nome, String email, String senha) {
        return registerDAO.cadastrarUsuario(nome, email, senha);
    }
}