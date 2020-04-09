<%-- 
    Document   : connect
    Created on : Mar 16, 2020, 10:08:22 PM
    Author     : USER
--%>

<%@page import="process.userDAO"%>
<%@page import="process.DBConnection"%>
<%@page import="process.User"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%   
    
    String user_username = request.getParameter("user_username");
    String user_pass = request.getParameter("user_pass");
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
    PreparedStatement ps = conn.prepareStatement("UPDATE `user` SET `user_username` = ?, `user_pass` = ?  WHERE `user`.`user_id` = ?");
    
    
            ps.setString(1, user_username);
            ps.setString(2, user_pass);
            ps.setInt(3, user_id);
            
           int result = ps.executeUpdate();
            
            if(result>0){
                
                response.sendRedirect("profile.jsp");
    }
    }
    catch(Exception e){
    out.println(e);
    }
                
                
    
%>
