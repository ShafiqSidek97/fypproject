<%-- 
    Document   : dashboard
    Created on : Mar 10, 2020, 11:50:12 PM
    Author     : USER
--%>

<%@page import="process.userDAO" %>
<%@page import="process.File"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, process.User" %>
<jsp:useBean id="database" class="process.DBConnection" scope="request"/>
<jsp:useBean id="studentDao" class="process.userDAO" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        
        <script>
            $(document).ready(function(){
                $(".right_menu li .fas").click(function(){
                    $(".profile_dd").toggleClass("active");
                });
            });
        </script>
    </head>
    
    <style>
        *{
           margin: 0;
           padding: 0;
           list-style: none;
           box-sizing: border-box;
           text-decoration: none;
           font-family: sans-serif;
        } 
        
        .wrapper{
            width: 100%;
            height: 100%;
        }
        
        .top_navbar{
            background: #009879;
            height: 60px;
            display: flex;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
        }
        
        .top_navbar .title{
            margin-left: 10px;
            margin-top: 18px;
            width: 600px;
            color: white;
        }
        
        .top_navbar .hamburger{
            width: 80px;
            background: #004d40;
            position: relative;
            font-size: 28px;
        }
        
        .top_navbar .hamburger .hamburger_inner{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            cursor: pointer;
            width: 40px;
            height: 20px;
        }
        
        
        .top_navbar .hamburger .hamburger_inner > div{
            width: 30px;
            height: 2px;
            background: #fff;
            position: absolute;
            top: 0;
            left: 0;
        }
        
        .top_navbar .hamburger .hamburger_inner div.two{
            top: 10px;
            width: 40px;
        }
        
        .top_navbar .hamburger .hamburger_inner div.three{
            top: 20px;
        }
        
        .top_navbar .menu{
            width: calc(100% - 80px);
            height: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        
        .top_navbar .menu .logo{
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        
        .top_navbar .menu .right_menu ul li{
            position: relative;
        }
        
        .top_navbar .menu .right_menu ul li .fas{
            font-size: 22px;
            cursor: pointer;          
        }
        
        .top_navbar .menu .right_menu ul li .profile_dd{
            position: absolute;
            top: 35px;
            right: -10px;
            background: #fff;
            width: 195px;
            padding: 10px 0;
            box-shadow: 0 0 2px rgba(0,0,0,0.5);
            border-radius: 3px;
            user-select: none;
            display: none;
            
        }
        
        .top_navbar .menu .right_menu ul li .profile_dd .dd_item{
            padding: 10px;
            cursor: pointer;
            color: #004d40;
        }
        
        .top_navbar .menu .right_menu ul li .profile_dd .dd_item:hover{
            background: #e0f2f1;
        }
        
        .top_navbar .menu .right_menu ul li .profile_dd:before{
            content: '';
            position: absolute;
            top: -20px;
            right: 10px;
            border: 10px solid;
            border-color: transparent transparent white transparent;
        }
        
        .top_navbar .menu .right_menu ul li .profile_dd.active{
            display: block;
        }
        
        .maincontainer .sidebar{
            position:fixed;
            top: 60px;
            left: 0;
            width: 225px;
            height: 100%;
            background: #333333;
            
            transition: all 0.3s ease;
        }
        
        .maincontainer .sidebar .sidebar_inner{
            position: relative;
        }
        
        .maincontainer .sidebar .profile{
            display: flex;
            align-items: center;
            color: white;
            padding: 20px 0;
            white-space: nowrap;
            transition: all 0.3s ease;            
        }
        
        .maincontainer .sidebar .profile p:first-child{
            font-size: 14px;
            color: white;
            margin-bottom: 3px;
        }
        
        .maincontainer .sidebar ul li a{
            color: white;
            font-size: 18px;
            padding: 20px 30px;
            display: flex;
            align-items: center;
            margin-bottom: 1px;
            white-space: nowrap;
            transition: all 0.3s ease;
            border-bottom: 1px solid #009879;
        }
        
        .maincontainer .sidebar ul ul{
            opacity: 0;
            position: absolute;
            visibility: hidden;
            left: 100%;
            background-color: #333333;
            top: 132px;
        }
        .maincontainer ul li:hover > ul{
            opacity: 1;
            visibility: visible;
        }
        
        .maincontainer .sidebar ul li a .icon{
            margin-right: 15px;
            font-size: 28px;
        }
        
        .maincontainer .sidebar ul li  a span{
            display: inline-block;
        }
        
        .maincontainer .sidebar ul li  a:hover,
        .maincontainer .sidebar ul li  a.active{
            background: white;
            color: #333333;
        }
        
        .maincontainer .container{
            margin-top: 80px;
            margin-left: 250px;
        }
        
        .maincontainer .container .icon{
            font-size: 30px;
        }
        
        .table-content table{
            border-collapse: collapse;
            margin: 25px 15px;
            width: 600px;
        }
        
        .table-content th{
            background-color: #009879;
            color: white;
            text-align: center;
            font-weight: bold;
            width: 100px;
        }
        .table-content td{
            padding: 10px 10px;
            border-bottom: 1px solid #dddddd;
                
        }
        
        .table-content tr{
            background-color: #f3f3f3;
        }
        
        .table-content tr{
            border-bottom: 2px solid #009879;
        }
        
        
    </style>
    
    <body>
        <div class="wrapper">
            <div class="top_navbar">
                
                <div class="hamburger">
                    <div class="hamburger_inner">
                        <div class="one"></div>
                        <div class="two"></div>
                        <div class="three"></div>
                    </div>
                </div>
                <div class="title"><h2>Maritime Education</h2></div>
                <div class="menu">
                    <div class="logo">
                        
                    </div>
                    <div class="right_menu">
                        <ul>
                            <li><i style="margin-top: 8px " class="fas fa-user"></i>
                                <div class="profile_dd">
                                    <div  class="dd_item">
                                        <a style="color: #004d40" href="profile.jsp"> <i style="padding: 10px" class="fas fa-user"></i>Profile</a></div>
                                    <div class="dd_item"><i style="padding: 10px" class="fas fa-key"></i>Change Password</div>    
                                    <div class="dd_item">
                                     
                                        <a style="color: #004d40" href="logout.jsp"><i style="padding: 10px" class="fas fa-sign-out-alt"></i>Logout</a></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="maincontainer">
                <div class="sidebar">
                    <div class="sidebar_inner">
                        <div class="profile">
                            <div class="img"></div>   
                            <div class="profile_info">
                                
        <%
            String user_username = (String) session.getAttribute("user_username");
            userDAO user = new userDAO();
            User ss = user.retrieveOneUser(user_username);
        %>
                                
                                <p style="margin-left: 10px">Welcome <%= ss.getUser_firstname()%></p>
                                <p class="profile_name"></p>
                            </div>
                        </div>
                        <ul>
                            <li>
                                <a href="dashboard.jsp" >
                                    <span class="icon"><i class="fas fa-home"></i></span>
                                    <span class="title"> Dashboard</span>
                                </a>
                                
                            </li>
                            <li>
                                <a href="#">
                                   <span class="icon"><i class="fab fa-delicious"></i></span>
                                    <span class="title"> Subject</span> 
                                </a>
                                <ul>
                                    <li><a href="port-and-shipping.jsp">Port and Shipping</a></li>
                                    <li><a href="technology-maritime.jsp">Technology Maritime</a></li>
                                    <li><a href="shipping.jsp">Shipping</a></li>
                                    <li><a href="port-management.jsp">Port Management</a></li>
                                    <li><a href="navigation.jsp">Navigation</a></li>
                                    <li><a href="maritime-policies.jsp">Maritime Policies</a></li>
                                </ul>
                                
                            </li>
                            <li>
                                <a href="#">
                                    <span class="icon"><i class="fab fa-elementor"></i></span>
                                    <span class="title"> Library</span>
                                </a>
                                
                            </li>
                            <li>
                                <a href="#">
                                    <span class="icon"><i class="fas fa-border-all"></i></span>
                                    <span class="title"> Contact Us</span>
                                </a>
                                
                            </li>
                        </ul>
                    </div>
                </div>
                                
                <div class="container">
                    
                    <h1>Contact Us</h1>
                    <p>For information regarding the company, our solutions and services, media enquiries or any other enquiries please email the relevant contact as listed below.</p><br>
                    <span class="icon"><i class="fas fa-user-tie"></i> Administrative</span>
                    <p>Email:<a href="https://mail.google.com/"> ftkki@umt.edu.my</a></p>
                    <p>Tel: 609 668 3220/3374</p>
                    <p>Fax: 609 668 3326</p>
                    <div class="table-content">
                    <table border="1px">
                        <tr>
                        <th>Office</th>
                        <td style="font-weight:bold">Universiti Malaysia Terengganu</td>
                        </tr>
                        <tr>
                        <th>Location</th>
                        <td>Pusat Pengajian Kejuruteraan Kelautan,<br>
                            Universiti Malaysia Terengganu,<br>
                            21030 Kuala Terengganu,<br>
                            Terengganu,Malaysia.<br><br>
                            <p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3972.039495096759!2d103.08685181744382!3d5.410956000000022!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31b7bcaee7902b95%3A0xbe3f425cd048fc9!2sPusat%20Pengajian%20Informatik%20dan%20Matematik%20Gunaan%2C%20Universiti%20Malaysia%20Terengganu!5e0!3m2!1sen!2smy!4v1586105427843!5m2!1sen!2smy" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></p>
                         </td>
                        </tr>
                    </table>
                    </div>
                </div>
                
            </div>
        
    </body>
</html>
