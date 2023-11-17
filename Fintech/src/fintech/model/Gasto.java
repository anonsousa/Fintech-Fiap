package fintech.model;

public class Gasto {
    private String nome;
    private double valor;
    private String data;

    public Gasto(String nome, double valor, String data) {
        this.nome = nome;
        this.valor = valor;
        this.data = data;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
