<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.betacom.dao.UtenteDao"%>

<%
    String userId = request.getParameter("userId");
    String newStatus = request.getParameter("newStatus");

    // Implementa il metodo changeUserStatus nella classe UtenteDao per l'aggiornamento dello stato dell'utente
    // Esegui l'aggiornamento solo se userId e newStatus non sono nulli o vuoti
    if (userId != null && !userId.isEmpty() && newStatus != null && !newStatus.isEmpty()) {
        int id = Integer.parseInt(userId);
        boolean success = UtenteDao.changeUserStatus(id, newStatus);
        if (success) {
            out.println("Aggiornamento dello stato dell'utente riuscito.");
        } else {
            out.println("Aggiornamento dello stato dell'utente non riuscito.");
        }
    } else {
        out.println("Parametri userId e newStatus non validi.");
    }
%>
