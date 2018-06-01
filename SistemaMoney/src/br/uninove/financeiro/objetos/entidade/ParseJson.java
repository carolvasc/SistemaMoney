package br.uninove.financeiro.objetos.entidade;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;



public abstract class ParseJson {


	public String toJson() throws JsonGenerationException, JsonMappingException, IOException {
  
     
	ObjectMapper objectMapper = new ObjectMapper();
   
        return objectMapper.writeValueAsString(this);
    }
}	