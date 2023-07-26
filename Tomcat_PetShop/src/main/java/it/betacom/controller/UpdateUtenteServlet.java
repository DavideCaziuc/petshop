package it.betacom.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.betacom.dao.UtenteDao;

@WebServlet("/UpdateUtenteServlet")
public class UpdateUtenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera i parametri dal form di modifica utente
        String userIdString = request.getParameter("userId");
        if (userIdString == null || userIdString.isEmpty()) {
            // Il parametro userId è vuoto o null, gestisci l'errore di conseguenza
            response.getWriter().println("ID utente non valido.");
            return;
        }

        int userId = Integer.parseInt(userIdString);
        String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String newCellulare = request.getParameter("newCellulare");

        // Effettua l'aggiornamento dei dati dell'utente nel database
        boolean successPassword = UtenteDao.updatePassword(userId, newPassword);
        boolean successEmail = UtenteDao.updateEmail(userId, newEmail);
        boolean successCellulare = UtenteDao.updateCellulare(userId, newCellulare);

        if (successPassword && successEmail && successCellulare) {
            // Aggiornamento completato con successo
            response.sendRedirect("utente/utente-manager.jsp");
        } else {
            // Aggiornamento fallito, gestisci l'errore di conseguenza
            response.getWriter().println("Errore durante l'aggiornamento dell'utente.");
        }
    }
}
