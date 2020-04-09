<%-- 
    Document   : getImage
    Created on : Apr 4, 2020, 3:45:03 PM
    Author     : USER
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="process.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            String user_username =request.getParameter("user_username");
            try{
                Connection con = DBConnection.getConnection();
                String sql = "select * from user where user_id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, user_username);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    Blob blob = rs.getBlob("user_image");
                    byte byteArray[] = blob.getBytes(1, (int)blob.length());
                    OutputStream os = response.getOutputStream();
                    os.write(byteArray);
                    os.flush();
                    os.close();
                }else{
                    System.out.println("No image found with this id.");
                }
            }catch(Exception e){
                out.println(e);
            }
        %>
