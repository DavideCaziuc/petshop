<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pagina di Registrazione</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
  <div class="login-container">
    <h2>Registrazione <i class="fas fa-user-plus"></i></h2>
        <form action="../RegistrazioneServlet" method="post">
      <div class="form-group">
        <label for="name">Nome:</label>
        <input type="text" id="name" name="nome" required>
      </div>
      <div class="form-group">
        <label for="surname">Cognome:</label>
        <input type="text" id="surname" name="cognome" required>
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="phone">Cellulare:</label>
        <input type="tel" id="phone" name="cellulare" required>
      </div>
      <div class="form-group">
        <label for="birthdate">Data di nascita:</label>
        <input type="date" id="birthdate" name="data_di_nascita" required>
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <button type="submit">Registrati</button>
    </form>
    <p>Se sei già registrato, <a href="../login/login.jsp">vai alla pagina di login</a>.</p>
  </div>
</body>
</html>
