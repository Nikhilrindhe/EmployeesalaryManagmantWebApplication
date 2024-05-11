<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>

<%
    // Get the session
    HttpSession existingSession = request.getSession(false);
    // Check if session exists and invalidate it
    if (existingSession != null) {
        existingSession.invalidate();
    }
    // Redirect to the main page or any other appropriate page after logout
    response.sendRedirect("mainpage.jsp");
%>
