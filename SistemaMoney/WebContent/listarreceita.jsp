<%@page import="br.uninove.financeiro.objetos.entidade.Receita"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Lista - Receitas</title>
		<script type="text/javascript">
			function confirmaExclusao(id){
				if(window.confirm("Tem certeza que deseja excluir esta receita?")){
					location.href = "reccontroller?acao=excluir&id=" + id;
				}
			}
		</script>
	</head>
	<body>
		
		<%@ include file = "menu.jsp" %>
		
		<%
				List<Receita> lista = (List<Receita>)request.getAttribute("lista");
			%>
		<table border=1>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Data</th>
				<th>Categoria</th>
				<th colspan="2">Ação</th>
			</tr>
	
			<%	for(Receita rec : lista){ %>
			<tr>
				<td><%=rec.getIdReceita()%></td>
				<td><%=rec.getNomeReceita()%></td>
				<td><%=rec.getDataReceita()%></td>
				<td><%=rec.getNomeCategReceita()%></td>
				<td><a href="javascript:confirmaExclusao(<%=rec.getIdReceita()%>)">Excluir</a></td>
				<td><a href="reccontroller?acao=alterar&id=<%=rec.getIdReceita()%>">Alterar</a></td>
			</tr>
			<%	}	%>
	
		</table>
	</body>
</html>