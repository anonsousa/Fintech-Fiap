package fintech.model;

import java.math.BigDecimal;

public class Recebimento {
    private String nomeRecebimento;
    private String dataRecebimento;
    private BigDecimal valorRecebimento;

    // Construtores, getters e setters

    public Recebimento() {
    }

    public Recebimento(String nomeRecebimento, String dataRecebimento, BigDecimal valorRecebimento) {
        this.nomeRecebimento = nomeRecebimento;
        this.dataRecebimento = dataRecebimento;
        this.valorRecebimento = valorRecebimento;
    }

    public String getNomeRecebimento() {
        return nomeRecebimento;
    }

    public void setNomeRecebimento(String nomeRecebimento) {
        this.nomeRecebimento = nomeRecebimento;
    }

    public String getDataRecebimento() {
        return dataRecebimento;
    }

    public void setDataRecebimento(String dataRecebimento) {
        this.dataRecebimento = dataRecebimento;
    }

    public BigDecimal getValorRecebimento() {
        return valorRecebimento;
    }

    public void setValorRecebimento(BigDecimal valorRecebimento) {
        this.valorRecebimento = valorRecebimento;
    }

}