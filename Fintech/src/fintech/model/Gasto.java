package fintech.model;

import java.math.BigDecimal;

public class Gasto {
    private String NomeGasto;
    private String DataGasto;
    private BigDecimal ValorGasto;

    // Construtores, getters e setters

    public Gasto() {
    }

    public Gasto(String NomeGasto, String DataGasto, BigDecimal ValorGasto) {
        this.NomeGasto = NomeGasto;
        this.DataGasto = DataGasto;
        this.ValorGasto = ValorGasto;
    }

    public String getNomeGasto() {
        return NomeGasto;
    }

    public void setNomeGasto(String NomeGasto) {
        this.NomeGasto = NomeGasto;
    }

    public String getDataGasto() {
        return DataGasto;
    }

    public void setDataGasto(String DataGasto) {
        this.DataGasto = DataGasto;
    }

    public BigDecimal getValorGasto() {
        return ValorGasto;
    }

    public void setValorGasto(BigDecimal ValorGasto) {
        this.ValorGasto = ValorGasto;
    }
}
