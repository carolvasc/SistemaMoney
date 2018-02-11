package br.uninove.financeiro.objetos.entidade;

import java.sql.Date;

public class Receita {
    
    private Integer idReceita;
    private String nomeReceita;
    private Float valorReceita;
    private Date dataReceita;
    private Integer categoriaReceita;
    private Integer repetirReceita;
    private String obsReceita;
    

    public Integer getIdReceita() {
        return idReceita;
    }

    public void setIdReceita(Integer idReceita) {
        this.idReceita = idReceita;
    }

    public String getNomeReceita() {
        return nomeReceita;
    }

    public void setNomeReceita(String nomeReceita) {
        this.nomeReceita = nomeReceita;
    }

    public Float getValorReceita() {
        return valorReceita;
    }

    public void setValorReceita(Float valorReceita) {
        this.valorReceita = valorReceita;
    }

    public Date getDataReceita() {
        return dataReceita;
    }

    public void setDataReceita(Date dataReceita) {
        this.dataReceita = dataReceita;
    }

    public Integer getCategoriaReceita() {
        return categoriaReceita;
    }

    public void setCategoriaReceita(Integer categoriaReceita) {
        this.categoriaReceita = categoriaReceita;
    }

    public Integer getRepetirReceita() {
        return repetirReceita;
    }

    public void setRepetirReceita(Integer repetirReceita) {
        this.repetirReceita = repetirReceita;
    }

    public String getObsReceita() {
        return obsReceita;
    }

    public void setObsReceita(String obsReceita) {
        this.obsReceita = obsReceita;
    }
    
}