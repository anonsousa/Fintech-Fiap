package fintech.model;

import java.math.BigDecimal;

public class Gasto {
    private String nomeGasto;
    private String dataGasto;
    private BigDecimal valorGasto;

    // Construtores, getters e setters

    public Gasto() {
    }

    public Gasto(String nomeGasto, String dataGasto, BigDecimal valorGasto) {
        this.nomeGasto = nomeGasto;
        this.dataGasto = dataGasto;
        this.valorGasto = valorGasto;
    }

    public String getNomeGasto() {
        return nomeGasto;
    }

    public void setNomeGasto(String nomeGasto) {
        this.nomeGasto = nomeGasto;
    }

    public String getDataGasto() {
        return dataGasto;
    }

    public void setDataRecebimento(String dataRecebimento) {
        this.dataGasto = dataRecebimento;
    }

    public BigDecimal getValorGasto() {
        return valorGasto;
    }

    public void setValorGasto(BigDecimal valorGasto) {
        this.valorGasto = valorGasto;
    }

}