<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="it.betacom.bean.Utente"%>
<%@ page import="it.betacom.dao.UtenteDao"%>

<%
    List<Utente> lista = UtenteDao.getAllRecords();
    request.setAttribute("list", lista);
%>
<%
    String username = (String) request.getSession().getAttribute("username");
%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>

<%
    int recordsPerPage = 10;
    int currentPage = 1;
    if (request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }

    int start = (currentPage - 1) * recordsPerPage;
    int end = Math.min(start + recordsPerPage, lista.size());

    List<Utente> sublist = lista.subList(start, end);
    int totalPages = (int) Math.ceil((double) lista.size() / recordsPerPage);

    request.setAttribute("sublist", sublist);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("currentPage", currentPage);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="stile.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="link_al_file_font_awesome.css">
<link rel="stylesheet" href="link_al_file_font_awesome.css">
<title>YOLO - CLIENTE</title>
</head>
<body>
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
		<c:choose>
			<c:when test="${username != null && statoUtente == 'A'}">
				<!-- Contenuto della tabella e paginazione -->
				<table border="1" width="90%">
					<!-- Intestazioni della tabella -->
					<tr>
						<th>Id</th>
						<th>Nome</th>
						<th>Cognome</th>
						<th>Username</th>
						<th>Password</th>
						<th>Email</th>
						<th>Cellulare</th>						
						<th>Ruolo</th>
						<th>Stato</th>
					</tr>
					<!-- Ciclo sulla sublist invece che sulla lista completa -->
					<c:forEach items="${sublist}" var="u">
						<tr>
							<td>${u.getId()}</td>
							<td>${u.getNome()}</td>
							<td>${u.getCognome()}</td>
							<td>${u.getUsername()}</td>
							<td>${u.getPassword()}</td>
							<td>${u.getEmail()}</td>
							<td>${u.getCellulare()}</td>
							<td>${u.getRuolo()}</td>
							<td>${u.getStato()}</td>
						</tr>
					</c:forEach>
				</table>
				<!-- Paginazione -->
				<div class="pagination">
					<c:forEach begin="1" end="${totalPages}" var="i">
						<c:choose>
							<c:when test="${currentPage == i}">
								<span class="active">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="?currentPage=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<p>Non hai il permesso per visualizzare questa pagina.</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>