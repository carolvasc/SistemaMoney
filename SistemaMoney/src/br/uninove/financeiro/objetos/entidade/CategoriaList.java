package br.uninove.financeiro.objetos.entidade;

import java.util.ArrayList;
import java.util.List;



public class CategoriaList extends ParseJson{
	
	List categorias = new ArrayList<Categoria>();


public List getCategorias() {
	return categorias;
}

public void setCategorias(List categorias){
	
	this.categorias = categorias;
	
	}

}
