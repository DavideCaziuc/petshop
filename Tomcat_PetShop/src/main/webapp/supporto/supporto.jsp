
<%
    String username = (String) request.getSession().getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>La pagina è ancora in via di sviluppo</title>
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="link_al_file_font_awesome.css">
<link rel="stylesheet" href="link_al_file_font_awesome.css">
</head>
<body>
	<div class="navbar">
		<a href="../index.jsp" class="navbar-logo"> <img
			src="../img/logo.svg" class="navbar-logo">
		</a>
		<div class="navbar-links">
			<a href="../utente/utente.jsp">Utente</a> <a href="../animale/animale.jsp">Animale</a> <a
				href="../cliente/cliente.jsp">Cliente</a> <a
				href="../giochi/giochi.jsp">Giochi</a> <a href="../cibo/cibo.jsp">Cibo</a>
			<a href="supporto.jsp">Supporto</a>
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
		<h1>La pagina "Supporto" è ancora in via di sviluppo</h1>
		<p>Questa pagina è attualmente in fase di costruzione. Torneremo
			presto con contenuti interessanti e funzionalità incredibili.</p>
	</div>
</body>
</html>
