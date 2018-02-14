package br.uninove.financeiro.objetos.entidade;

import java.sql.Date;

public class Despesa {
    
    private Integer idDespesa;
    private String nomeDespesa;
    private Float valorDespesa;
    private String dataDespesa;
    private Integer idCategDespesa;
    private String nomeCategDespesa;
    private Integer idPagtoDespesa;
    private String nomePagtoDespesa;
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

    public Integer getIdCategDespesa() {
        return idCategDespesa;
    }

    public void setIdCategDespesa(Integer idCategDespesa) {
        this.idCategDespesa = idCategDespesa;
    }

    public Integer getIdPagtoDespesa() {
        return idPagtoDespesa;
    }

    public void setIdPagtoDespesa(Integer idPagtoDespesa) {
        this.idPagtoDespesa = idPagtoDespesa;
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

	public String getNomeCategDespesa() {
		return nomeCategDespesa;
	}

	public void setNomeCategDespesa(String nomeCategDespesa) {
		this.nomeCategDespesa = nomeCategDespesa;
	}

	public String getNomePagtoDespesa() {
		return nomePagtoDespesa;
	}

	public void setNomePagtoDespesa(String nomePagtoDespesa) {
		this.nomePagtoDespesa = nomePagtoDespesa;
	}
    
}