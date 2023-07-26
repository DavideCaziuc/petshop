<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pagina di Login</title>
<link rel="stylesheet" href="login-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #F5D295ff, #ffffff);
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background-color: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	width: 350px;
}

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #e67e22;
}

i {
	font-size: 36px;
	margin-right: 10px;
	color: #e67e22;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
	color: #333;
}

input {
	width: 100%;
	padding: 12px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	background-color: #f5f5f5;
	transition: background-color 0.3s;
}

input:focus {
	background-color: #f2f2f2;
}

button {
	background-color: #e67e22;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 14px 24px;
	cursor: pointer;
	width: 100%;
	font-size: 16px;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #d35400;
}

a {
	color: #e67e22;
	text-decoration: none;
	transition: color 0.3s;
}

a:hover {
	color: #d35400;
}

/* Animazione pulsante di login */
.button-loading {
	pointer-events: none;
	position: relative;
}

.button-loading:after {
	content: "";
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 20px;
	height: 20px;
	border: 2px solid rgba(255, 255, 255, 0.7);
	border-top: 2px solid #fff;
	border-radius: 50%;
	animation: spin 1s linear infinite;
}

@
keyframes spin { 0% {
	transform: translate(-50%, -50%) rotate(0deg);
}
100






%
{
transform






:






translate




(






-50




%
,
-50




%
)






rotate




(






360deg






)




;
}
}
</style>

</head>
<body>
	<div class="login-container">
		<h2>
			Accedi <i class="fas fa-user-circle"></i>
		</h2>
		<form action="../LoginServlet" method="post">
			
				<div class="error-message">
					<c:if test="${not empty loginError}">
						<p>
							<c:out value="${loginError}" />
						</p>
						<p>
							Tentativi rimanenti:
							<c:out value="${sessionScope.loginAttempts}" />
						</p>
					</c:if>
				</div>

			
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<button type="submit">Accedi</button>
		</form>
		<p>
			Se non sei registrato, <a href="../register/register.jsp">vai a
				questo link</a>.
		</p>
	</div>
</body>
</html>