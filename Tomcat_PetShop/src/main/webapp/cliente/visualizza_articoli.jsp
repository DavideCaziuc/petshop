<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="it.betacom.bean.Cliente" %>
<%@ page import="it.betacom.bean.Animale" %>
<%@ page import="it.betacom.dao.ClienteDao" %>
<%@ page import="it.betacom.dao.AnimaleDao" %>
<%@ page import="java.util.List" %>

<%
    // Get the client ID from the request parameter
    int clientId = Integer.parseInt(request.getParameter("id"));

    // Retrieve the Cliente object for the selected client using the ID
    Cliente cliente = ClienteDao.getRecordById(clientId);

    // Retrieve the list of Animale objects for the selected client using the ID
    List<Animale> listaAnimali = AnimaleDao.getAnimaliByClientId(clientId);  
%>
<%
    String username = (String) request.getSession().getAttribute("username");
%>


<!DOCTYPE html>
<html>
<head>
    <title>Dettagli Cliente e Tabella Animali</title>
    <link rel="stylesheet" type="text/css" href="stile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="link_al_file_font_awesome.css">
</head>
<body>
	<div class="navbar">
		<a href="../index.jsp" class="navbar-logo"> <img
			src="../img/logo.svg" class="navbar-logo">
		</a>
		<div class="navbar-links">
			<a href="../utente/utente.jsp">Utente</a> <a
				href="../animale/animale.jsp">Animale</a> <a href="cliente.jsp">Cliente</a>
			<a href="../giochi/giochi.jsp">Giochi</a> <a href="../cibo/cibo.jsp">Cibo</a>
			<a href="../supporto/supporto.jsp">Supporto</a>
		</div>
		<div class="search-box">
			<input type="text" placeholder="Search...">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</div>

		<div class="user-account">
			<a href="#" class="login-btn" onclick="toggleDropdown()"> <i
				class="far fa-user"></i> <% if (username != null) { %> <%= username %>
				<% } else { %> <a href="../login/login.jsp">Login</a> <% } %>
			</a>
			<div id="userDropdown" class="dropdown-content">
				<% if (username != null) { %>
				<a href="LogoutServlet">Logout</a>
				<% } %>
			</div>
		</div>
	</div>


	<div class="container">    
    <h3>Cliente: <%= cliente.getNome() + " " + cliente.getCognome() %></h3>
    
    <% if (!listaAnimali.isEmpty()) { %>
        <table border="1" width="90%">
            <tr>
                <th>Id</th>
                <th>Matricola</th>
                <th>Nome Animale</th>
                <th>Data Acquisto</th>
                <th>Prezzo</th>
                <th>Tipo Animale</th>
                <th>Id Cliente</th>
            </tr>
            <% for (Animale animale : listaAnimali) { %>
                <tr>
                    <td><%= animale.getId() %></td>
                    <td><%= animale.getMatricola() %></td>
                    <td><%= animale.getNome_animale() %></td>
                    <td><%= animale.getData_acquisto() %></td>
                    <td><%= animale.getPrezzo() %></td>
                    <td><%= animale.getTipo_animale() %></td>
                    <td><%= animale.getIdCliente() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p>Non ci sono animali associati a questo cliente.</p>
    <% } %>

</div>
</body>
</html>
