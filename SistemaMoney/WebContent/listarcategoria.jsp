<%@page import="br.uninove.financeiro.objetos.entidade.Categoria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Lista - Despesas</title>
		<script type="text/javascript">
			function confirmaExclusao(id){
				if(window.confirm("Tem certeza que deseja excluir esta despesa?")){
					location.href = "despcontroller?acao=excluir&id=" + id;
				}
			}
		</script>
	</head>
	<body>
		<%
				List<Categoria> lista = (List<Categoria>)request.getAttribute("listaCat");
			%>
		<table border=1>
			<tr>
				<th>ID</th>
				<th>Nome</th>
			</tr>
	
			<%	for(Categoria c : lista){ %>
			<tr>
				<td><%=c.getIdCategoria()%></td>
				<td><%=c.getTipoCategoria()%></td>
			</tr>
			<%	}	%>
	
		</table>
	</body>
</html>