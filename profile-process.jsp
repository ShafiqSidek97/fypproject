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
    int user_id = Integer.parseInt(request.getParameter("user_id"));
    String user_firstname = request.getParameter("user_firstname");
    String user_lastname = request.getParameter("user_lastname");
    String user_addr = request.getParameter("user_addr");
    int user_postcode = Integer.parseInt(request.getParameter("user_postcode"));
    String user_city = request.getParameter("user_city");
    String user_state = request.getParameter("user_state");
    String user_username = request.getParameter("user_username");
    int user_phone = Integer.parseInt(request.getParameter("user_phone"));
 
    
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
    PreparedStatement ps = conn.prepareStatement("UPDATE `user` SET `user_firstname` = ?, `user_lastname` = ?, `user_addr` = ?, `user_postcode` = ?, `user_city` = ?, `user_state` = ?,  `user_phone` = ? WHERE `user`.`user_id` = ?");
    
    
            ps.setString(1, user_firstname);
            ps.setString(2, user_lastname);
            ps.setString(3, user_addr);
            ps.setInt(4, user_postcode);
            ps.setString(5, user_city);
            ps.setString(6, user_state);
            ps.setInt(7, user_phone);
            ps.setInt(8, user_id);
           int result = ps.executeUpdate();
            
            if(result>0){
                
                response.sendRedirect("profile.jsp");
    }
    }
    catch(Exception e){
    out.println(e);
    }
                
                
    
%>
