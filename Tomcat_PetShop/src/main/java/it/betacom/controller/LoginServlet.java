package it.betacom.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");

	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    HttpSession session = request.getSession();

	    // Controllo se il loginAttempts attribute esiste nella sessione e se è un intero positivo
	    int loginAttempts = 0;
	    if (session.getAttribute("loginAttempts") != null) {
	        loginAttempts = (Integer) session.getAttribute("loginAttempts");
	    } else {
	        session.setAttribute("loginAttempts", 3);
	        loginAttempts = 3;
	    }

	    if (loginAttempts == 0) {
	        request.setAttribute("loginError", "Utente disabilitato. Riprova più tardi.");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/login/login.jsp");
	        dispatcher.forward(request, response);
	        return;
	    }

	    if (authenticateUser(username, password)) {
	        session.setAttribute("username", username);
	        session.setAttribute("loginAttempts", 3); // Reimposta il conteggio a 3 in caso di login riuscito

	        String statoUtente = getStatoUtente(username);
	        session.setAttribute("statoUtente", statoUtente);

	        String ruolo = getRuoloUtente(username);
	        request.setAttribute("ruolo", ruolo);

	        // Forward alla pagina di successo (index.jsp)
	        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        if (loginAttempts > 0) {
	            loginAttempts--;
	        }
	        session.setAttribute("loginAttempts", loginAttempts);
	        request.setAttribute("loginError", "Username o password non validi. Tentativi rimanenti: " + loginAttempts);

	        if (loginAttempts == 0) {
	            // Implementa qui la logica per disabilitare l'utente nel database
	            // Ad esempio, impostando un campo 'stato' a 'disabilitato' nella tabella degli utenti.
	        }

	        // Redirect nuovamente alla pagina di login (login.jsp) per visualizzare il messaggio di errore
	        response.sendRedirect(request.getContextPath() + "/login/login.jsp");
	    }
	}





	private boolean authenticateUser(String username, String password) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop?user=root&password=qwerty");
			ps = con.prepareStatement("SELECT * FROM PSUtenti WHERE username = ? AND password = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();

			return rs.next(); // Restituisce true se c'è almeno un risultato (utente autenticato), altrimenti false.
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public static String getStatoUtente(String username) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String statoUtente = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop?user=root&password=qwerty");

			// Query per ottenere lo stato dell'utente con il nome utente fornito
			String query = "SELECT stato FROM PSUtenti WHERE username = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();

			// Verifica se ci sono risultati
			if (rs.next()) {
				statoUtente = rs.getString("stato");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// Chiudi le risorse
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return statoUtente;
	}


	private String getRuoloUtente(String username) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String ruolo = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop?user=root&password=qwerty");

			// Query per ottenere lo stato dell'utente con il nome utente fornito
			String query = "SELECT ruolo FROM PSUtenti WHERE username = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();

			// Verifica se ci sono risultati
			if (rs.next()) {
				ruolo = rs.getString("ruolo");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// Chiudi le risorse
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return ruolo;
	}
}