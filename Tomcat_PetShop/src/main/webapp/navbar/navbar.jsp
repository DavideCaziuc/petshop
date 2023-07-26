<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>

body {
	font-family: Arial, sans-serif;
	background-color: white;
	margin: 0;
	padding: 0 21%;
}

h3 {
  color: black; /* Colore del testo nero */
  text-align: center; /* Allineamento centrato */
  font-family: Arial, sans-serif; /* Famiglia di caratteri */
  font-size: 28px; /* Dimensione del testo */
  margin-bottom: 20px; /* Margine inferiore per separare il titolo dal contenuto successivo */
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Ombreggiatura del testo */
}

.navbar {
	background-color: white;
	top: 0;
	height: 50px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 0;
}

.navbar-logo {
	margin-top: 3px;
	width: 80px !important;
	height: 60px !important;
	left: 19%;
}

.navbar-login {
	width: 30px !important;
	height: 30px !important;
	right: 19%;
}

  .login-btn a {
    display: inline-block;
    padding: 10px;
    background-color: black;
    color: black;
    text-decoration: none;
    border-radius: 5px;
  }

  /* Stili per l'icona */
  .login-btn i {
    font-size: 15px;
    width: 30px;
    height: 15px;
    color: black;
    /* Utilizza la trasformazione per ingrandire l'icona */
    transform: scale(1.5); 
    display: inline-block; 
  }

.navbar-links {
	display: flex;
	color: black;
}

.navbar-links a {
	color: #fff;
	text-decoration: none;
	margin-left: 20px;
	color: black;
}

.navbar-search {
	display: flex;
	align-items: center;
}

.navbar-search input[type="text"] {
	padding: 5px;
	border-radius: 4px;
	border: none;
}

.navbar-login {
	color: #fff;
	color: black;
	right: 19%;
}

.search-box {
	display: flex;
	justify-content: center;
	background-color: #F5D295ff;
	padding: 1%;
	border-radius: 32px;
	box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}

.search-box input {
	border: 0;
	background-color: #F5D295ff;
	font-size: 16px;
	width: 0;
	outline: none;
	transition: 0.8s;
}

.search-box:hover input {
	width: 200px;
}

.search-box button {
	padding: 7px;
	border: 0;
	background-color: white;
	color: black;
	font-size: 14px;
	border-radius: 50%;
	cursor: pointer;
}

.user-icon {
	color: black;
}

p {
	color: #555;
	line-height: 1.5;
	margin-bottom: 20px;
}



.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #1c1c1c;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #333;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 40px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.image-container {
	display: flex;
	justify-content: space-between;
}

.image {
  display: block; /* L'immagine sarà visualizzata come blocco */
  margin: 0 auto; /* Centrerà l'immagine orizzontalmente all'interno del suo contenitore */
  max-width: 100%; /* L'immagine non supererà mai la larghezza del suo contenitore */
  width: 100%;
  height: auto; /* L'altezza dell'immagine si adatterà proporzionalmente alla larghezza */
}
}

</style>
</head>
<body>
	<div class="navbar">
		<a href="#" class="navbar-logo"> <img src="../img/logo.svg"
			class="navbar-logo">
		</a>
		<div class="navbar-links">
			<a href="#">Store</a> <a href="#">Animale</a> <a href="#">Cliente</a>
			<a href="#">Giochi</a> <a href="#">Cibo</a> <a href="#">Supporto</a>
		</div>
		<div class="search-box">
			<input type="text" placeholder="Search...">
			<button>
				<i class="fas fa-search"></i>
			</button>
		</div>
		<div>
			<a href="login/login.jsp" class="login-btn"> <i class="far fa-user"></i>
			</a>
		</div>
	</div>