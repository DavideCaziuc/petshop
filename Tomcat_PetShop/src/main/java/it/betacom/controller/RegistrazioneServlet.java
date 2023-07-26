package it.betacom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrazioneServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// Recupera i dati dalla richiesta
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String cellulare = request.getParameter("cellulare");
		String data_di_nascita = request.getParameter("data_di_nascita");
		String password = request.getParameter("password");
		String username = generateUsername(nome, cognome, data_di_nascita);

		Connection con = null;
		PreparedStatement insertStmt = null;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login/login.jsp");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop?user=root&password=qwerty");

			// Verifica se l'username/email è già presente nel database
			PreparedStatement checkUserStmt = con.prepareStatement("SELECT COUNT(*) FROM PSUtenti WHERE username = ? OR email = ?");
			checkUserStmt.setString(1, username);
			checkUserStmt.setString(2, email);
			ResultSet resultSet = checkUserStmt.executeQuery();
			resultSet.next();
			int count = resultSet.getInt(1);

			if (count > 0) {
				out.println("L'utente è già registrato");
			} else {
				// Genera l'username come specificato nella tua logica
				// (Primi due caratteri del nome + Primi due caratteri del cognome + anno di nascita)

				// Inserisci i dati dell'utente nella tabella PSUtenti
				insertStmt = con.prepareStatement("INSERT INTO PSUtenti (nome, cognome, username, email, datadinascita, cellulare, password, ruolo, stato) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
				insertStmt.setString(1, nome);
				insertStmt.setString(2, cognome);
				insertStmt.setString(3, username);
				insertStmt.setString(4, email);
				insertStmt.setDate(5, Date.valueOf(data_di_nascita));
				insertStmt.setString(6, cellulare);
				insertStmt.setString(7, password);
				insertStmt.setString(8, "G"); // Ruolo di default "Guest"
				insertStmt.setString(9, "D"); // Stato di default "Disabilitato"
				insertStmt.executeUpdate();

				// Redirect alla pagina di login dopo aver completato la registrazione
				response.sendRedirect(request.getContextPath() + "/login/login.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			out.println("Si è verificato un errore durante la registrazione. Riprova più tardi.");
		} finally {
			try {
				if (insertStmt != null) insertStmt.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String generateUsername(String nome, String cognome, String data_di_nascita) {
		// Estrai i primi due caratteri del nome e del cognome
		String nomeAbbreviato = nome.substring(0, Math.min(nome.length(), 2)).toUpperCase();
		String cognomeAbbreviato = cognome.substring(0, Math.min(cognome.length(), 2)).toUpperCase();

		// Estrai l'anno di nascita dalla data di nascita
		String annoDiNascita = data_di_nascita.substring(0, 4);

		// Componi l'username combinando le informazioni ottenute
		String username = nomeAbbreviato + cognomeAbbreviato + annoDiNascita;

		return username;
	}

}
