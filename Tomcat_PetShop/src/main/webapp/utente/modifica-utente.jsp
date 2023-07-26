<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="it.betacom.bean.Utente"%>
<%@ page import="it.betacom.dao.UtenteDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Utente</title>
<link rel="stylesheet" type="text/css" href="styleEdit.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="link_al_file_font_awesome.css">
<link rel="stylesheet" href="link_al_file_font_awesome.css">
</head>
<body>
	<%-- Recupera l'ID utente dalla URL --%>
	<% int userId = Integer.parseInt(request.getParameter("userId")); %>
	<%
    String username = (String) request.getSession().getAttribute("username");
%>


	<div class="navbar">
		<a href="../index.jsp" class="navbar-logo"> <img
			src="../img/logo.svg" class="navbar-logo">
		</a>
		<div class="navbar-links">
			<a href="../utente/utente.jsp">Utente</a> <a
				href="../animale/animale.jsp">Animale</a> <a
				href="../cliente/cliente.jsp">Cliente</a> <a
				href="../giochi/giochi.jsp">Giochi</a> <a href="../cibo/cibo.jsp">Cibo</a>
			<a href="../supporto/supporto.jsp">Supporto</a>
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
		<h2>Modifica Utente</h2>
		<form action="../UpdateUtenteServlet" method="post">
			<input type="hidden" name="userId" value="<%= userId %>"> <label
				for="newPassword">Nuova Password:</label> <input type="password"
				name="newPassword" required> <label for="newEmail">Nuova
				Email:</label> <input type="email" name="newEmail" required> <label
				for="newCellulare">Nuovo Cellulare:</label> <input type="text"
				name="newCellulare" required> <input type="submit"
				value="Modifica">
		</form>
	</div>
</body>
</html>
