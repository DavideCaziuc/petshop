<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String ruolo = (String) session.getAttribute("ruolo");
    if (ruolo != null) {
        if (ruolo.equals("M")) {
            response.sendRedirect("utente-manager.jsp");
        } else {
            response.sendRedirect("utente.jsp");
        }
    }
%>
