<%-- 
    Document   : logout
    Created on : Mar 31, 2020, 5:22:58 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setAttribute("user_username", null);
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    
        if(session.getAttribute("user_username")==null)
        response.sendRedirect("login.jsp");
%>