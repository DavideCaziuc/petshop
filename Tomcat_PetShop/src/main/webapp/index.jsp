<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="it.betacom.bean.Utente"%>
<%@ page import="it.betacom.dao.UtenteDao"%>
<%
String username = (String) request.getSession().getAttribute("username");
String ruolo = (String) request.getSession().getAttribute("ruolo");
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

<meta charset="UTF-8">
<title>YOLO - HOME</title>

</head>
<body>
	<div class="navbar">
		<a href="index.jsp" class="navbar-logo"> <img src="img/logo.svg"
			class="navbar-logo">
		</a>
		<div class="navbar-links">
			<c:choose>
				<c:when test="${username != null}">
					<c:choose>
						<c:when test="${ruolo == 'M'}">
							<a href="utente/utente-manager.jsp">Utente</a>
						</c:when>
						<c:otherwise>
							<a href="utente/utente.jsp">Utente</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<a href="utente/utente.jsp">Utente</a>
				</c:otherwise>
			</c:choose>
			<a href="animale/animale.jsp">Animale</a> <a
				href="cliente/cliente.jsp">Cliente</a> <a href="giochi/giochi.jsp">Giochi</a>
			<a href="cibo/cibo.jsp">Cibo</a> <a href="supporto/supporto.jsp">Supporto</a>
		</div>


		<div class="search-box">
			<input type="text" placeholder="Search...">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</div>

		<div class="user-account">
			<a href="#" class="login-btn" onclick="toggleDropdown()"> <i
				class="far fa-user"></i> <%
 if (username != null) {
 %> <%=username%> <%
				} else {
				%> <a href="login/login.jsp">Login</a> <%
 }
 %>
			</a>
			<div id="userDropdown" class="dropdown-content">
				<%
				if (username != null) {
				%>
				<a href="LogoutServlet">Logout</a>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<div class="container">
		<h3>YOLO Pets: Un'avventura spensierata nel mondo dei nostri
			amici a quattro zampe!</h3>
		<div class="image-container">
			<div class="image">
				<img src="img/cane.jpeg" alt="Immagine hero">
			</div>
		</div>
		<p>Benvenuto su YOLO Pets, il luogo incantevole e coinvolgente
			dedicato a tutti gli amanti degli animali a quattro zampe! Qui, nel
			cuore del nostro accogliente mondo virtuale, vivrai un'entusiasmante
			avventura all'interno del magico universo dei nostri fedeli amici
			pelosi. Il nostro obiettivo è rendere speciale ogni attimo trascorso
			con i nostri cari animali domestici, offrendo una vasta gamma di
			servizi e contenuti che garantiscono il loro benessere e la loro
			felicità.</p>

		<p>I nostri giochi interattivi intratterranno i tuoi animali
			domestici, stimolando la loro mente e mantenendo viva la loro gioia
			di vivere. Condividi momenti di felicità giocando con loro e
			avvicinati ancora di più al tuo fedele compagno. Per coloro che
			desiderano esplorare la cura e la nutrizione degli animali domestici,
			la sezione Cibo è una preziosa fonte di informazioni su diete
			equilibrate e ricette salutari, offrendo un'ampia guida per prenderti
			cura del benessere dei tuoi amici pelosi.</p>
		<p>Dai un'occhiata al nostro sito, esplora i contenuti e lasciati
			affascinare dal mondo meraviglioso e tenero dei nostri amici pelosi.
			Grazie per esserci e auguriamo a te e ai tuoi amati animali domestici
			momenti indimenticabili su YOLO Pets!</p>
		<a href="supporto/supporto.jsp" class="btn">Scopri di più</a>
	</div>

	<script>
		function toggleDropdown() {
			var dropdown = document.getElementById("userDropdown");
			dropdown.classList.toggle("show");
		}

		// Chiudi il dropdown quando si clicca fuori da esso
		window.onclick = function(event) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			for (var i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')
						&& !event.target.matches('.login-btn')) {
					openDropdown.classList.remove('show');
				}
			}
		};
	</script>
</body>
</html>
