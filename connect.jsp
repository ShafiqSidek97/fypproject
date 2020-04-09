<%-- 
    Document   : connect
    Created on : Mar 16, 2020, 10:08:22 PM
    Author     : USER
--%>

<%@ page import="process.User"%>
<%@ page import ="java.sql.*"%>


<%
    
    String user_firstname = request.getParameter("user_firstname");
    String user_lastname = request.getParameter("user_lastname");
    String user_addr = request.getParameter("user_addr");
    int user_postcode = Integer.parseInt(request.getParameter("user_postcode"));
    String user_city = request.getParameter("user_city");
    String user_state = request.getParameter("user_state");
    String user_icno =request.getParameter("user_icno");
    int user_phone = Integer.parseInt(request.getParameter("user_phone"));
    String user_uni = request.getParameter("user_uni");
    String user_username = request.getParameter("user_username");
    String user_pass = request.getParameter("user_pass");
    String user_status = request.getParameter("user_status");
    
    
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
    
    PreparedStatement ps = conn.prepareStatement("insert into user(user_firstname, user_lastname, user_addr, user_postcode, user_city, user_state, user_icno, user_phone, user_uni, user_username, user_pass, user_status) values(?,?,?,?,?,?,?,?,?,?,?,?);");
    
    ps.setString(1, user_firstname);
    ps.setString(2, user_lastname);
    ps.setString(3, user_addr);
    ps.setInt(4, user_postcode);
    ps.setString(5, user_city);
    ps.setString(6, user_state);
    ps.setString(7, user_icno);
    ps.setInt(8, user_phone);
    ps.setString(9, user_uni); 
    ps.setString(10, user_username);
    ps.setString(11, user_pass);
    ps.setString(12, user_status);
   
    int x = ps.executeUpdate();
                
                if(x>0){
                    response.sendRedirect("login.jsp");
                    
                }else{
                    response.sendRedirect("negative.html");
                }
    
    
}catch(Exception e){
    out.println(e);
}
    
    
%>
