<%@page import="br.uninove.financeiro.objetos.entidade.Despesa"%>
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
				List<Despesa> lista = (List<Despesa>)request.getAttribute("lista");
			%>
		<table border=1>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Data</th>
				<th>Categoria</th>
				<th>Pagamento</th>
				<th colspan="2">Ação</th>
			</tr>
	
			<%	for(Despesa d : lista){ %>
			<tr>
				<td><%=d.getIdDespesa()%></td>
				<td><%=d.getNomeDespesa()%></td>
				<td><%=d.getDataDespesa()%></td>
				<td><%=d.getNomeCategDespesa()%></td>
				<td><%=d.getNomePagtoDespesa()%></td>
				<td><a href="javascript:confirmaExclusao(<%=d.getIdDespesa()%>)">Excluir</a></td>
				<td><a href="despcontroller?acao=alterar&id=<%=d.getIdDespesa()%>">Alterar</a></td>
			</tr>
			<%	}	%>
	
		</table>
	</body>
</html>