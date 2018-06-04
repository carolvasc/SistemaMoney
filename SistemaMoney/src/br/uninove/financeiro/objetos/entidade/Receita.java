package br.uninove.financeiro.objetos.entidade;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Receita {

	private Integer idUsuario;
	private Integer idReceita;
	private String nomeReceita;
	private Float valorReceita;
	private String dataReceita;
	private Integer idCategReceita;
	private String nomeCategReceita;
	private String repetirReceita;
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

	public String getValorFormatado() {
		float aux = getValorReceita();

		NumberFormat formatarFloat = new DecimalFormat("#,###,##0.00");
		String valorFormatado = formatarFloat.format(aux);

		return valorFormatado;
	}

	public String getDataReceita() {
		return dataReceita;
	}

	public void setDataReceita(String dataReceita) {
		this.dataReceita = dataReceita;
	}

	public Integer getIdCategReceita() {
		return idCategReceita;
	}

	public void setIdCategReceita(Integer idCategReceita) {
		this.idCategReceita = idCategReceita;
	}

	public String getRepetirReceita() {
		return repetirReceita;
	}

	public void setRepetirReceita(String repetirReceita) {
		this.repetirReceita = repetirReceita;
	}

	public String getObsReceita() {
		return obsReceita;
	}

	public void setObsReceita(String obsReceita) {
		this.obsReceita = obsReceita;
	}

	public String getNomeCategReceita() {
		return nomeCategReceita;
	}

	public void setNomeCategReceita(String nomeCategReceita) {
		this.nomeCategReceita = nomeCategReceita;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

}