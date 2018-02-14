package br.uninove.financeiro.objetos.entidade;

import java.sql.Date;

public class Despesa {
    
    private Integer idDespesa;
    private String nomeDespesa;
    private Float valorDespesa;
    private String dataDespesa;
    private Integer categoriaDespesa;
    private Integer pagamentoDespesa;
    private String repetirDespesa;
    private String obsDespesa;
    

    public Integer getIdDespesa() {
        return idDespesa;
    }

    public void setIdDespesa(Integer idDespesa) {
        this.idDespesa = idDespesa;
    }

    public String getNomeDespesa() {
        return nomeDespesa;
    }

    public void setNomeDespesa(String nomeDespesa) {
        this.nomeDespesa = nomeDespesa;
    }

    public Float getValorDespesa() {
        return valorDespesa;
    }

    public void setValorDespesa(Float valorDespesa) {
        this.valorDespesa = valorDespesa;
    }

    public String getDataDespesa() {
        return dataDespesa;
    }

    public void setDataDespesa(String dataDespesa) {
        this.dataDespesa = dataDespesa;
    }

    public Integer getCategoriaDespesa() {
        return categoriaDespesa;
    }

    public void setCategoriaDespesa(Integer categoriaDespesa) {
        this.categoriaDespesa = categoriaDespesa;
    }

    public Integer getPagamentoDespesa() {
        return pagamentoDespesa;
    }

    public void setPagamentoDespesa(Integer pagamentoDespesa) {
        this.pagamentoDespesa = pagamentoDespesa;
    }

    public String getRepetirDespesa() {
        return repetirDespesa;
    }

    public void setRepetirDespesa(String repetirDespesa) {
        this.repetirDespesa = repetirDespesa;
    }

    public String getObsDespesa() {
        return obsDespesa;
    }

    public void setObsDespesa(String obsDespesa) {
        this.obsDespesa = obsDespesa;
    }
    
}