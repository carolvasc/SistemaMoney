<%@page import="br.uninove.financeiro.objetos.entidade.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista - Usuario</title>
	<script type="text/javascript">
		function confirmaExclusão(idUsuario){
			if(window.confirm("Tem certeza que deseja excluir este usuario")){
				location.href = "usucontroller?acao=excluir&id=" + idUsuario;
			}
		}
	</script>
</head>
<body>
	<%
		List<Usuario> lista = (List<Usuario>)request.getAttribute("lista");
	%>
<table border=1>	
	<tr>
		<th>ID</th>
		<th>Login</th>
		<th>Senha</th>
		<th>Nome</th>
		<th>Ação</th>
	
	<%for(Usuario u : lista){ %>
	<tr>
		<td><% out.print( u.getId());%></td>
		<td><%=u.getLogin()%></td>
		<td><%=u.getSenha()%></td>
		<td><%=u.getNome()%></td>
		<td><a href="usucontroller?acao=excluir&id=<%=u.getId()%>">Excluir</a></td>		
		<td><a href="usucontroller?acao=alterar&id=<%=u.getId()%>">Alterar</a></td>		
	</tr>
	<%} %>
  </table>	
</body>
</html>