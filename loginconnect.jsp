<%@ page import ="java.sql.*"%>
<%
     String user_username = request.getParameter("user_username");
    String user_pass = request.getParameter("user_pass");
    
    
    
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root","");
    PreparedStatement ps = conn.prepareStatement("select user_status from user where user_username=?  and user_pass=?");
    ps.setString(1, user_username);
    ps.setString(2, user_pass);
    ResultSet rst = ps.executeQuery();
    if(rst.next()){
        String user_status = rst.getString("user_status");
        if("Staff".equals(user_status)){
            response.sendRedirect("../Task2/StaffDashboar.jsp");
            HttpSession ss =request.getSession();
            ss.setAttribute("user_username", user_username);
        }else {
            response.sendRedirect("dashboard.jsp");
            HttpSession ss =request.getSession();
            ss.setAttribute("user_username", user_username);
    }
    


    
    }
   
}catch(Exception e){
    out.println(e);
}
    
    
%>