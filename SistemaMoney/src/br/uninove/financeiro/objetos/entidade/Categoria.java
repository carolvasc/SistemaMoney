package br.uninove.financeiro.objetos.entidade;

public class Categoria extends ParseJson{
	
	private Integer idCategoria;
	private String tipoCategoria;
	
	public Integer getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getTipoCategoria() {
        return tipoCategoria;
    }

    public void setTipoCategoria(String tipoCategoria) {
        this.tipoCategoria = tipoCategoria;
    }
}
