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
            margin-top: 10px;
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
            width: 200px;
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
            top: 116px;
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
            margin-left: 235px;
        }        
        
        .content-header {
            
            height: 250px;
            width: calc(100%-200px);
            background-color: #d9d9d9;
        }
        
        .container .icon i{
            margin-left: 20px;
            margin-top: 20px;
            
        }
        .content-tab > input,
        .content-tab section > div{
            display: none;
            
        }
        
        #tab1:checked ~ section .tab1,
        #tab2:checked ~ section .tab2,
        #tab3:checked ~ section .tab3{
            display: block;
        }
        .content-tab{     
            width: calc(100%-200px);
            height: 100%;
            margin-top: 6px;
            background-color: #ddd;
        }
        .content-tab ul{
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        .content-tab ul li label{
            float: left;
            padding: 15px 25px;
            border: 1px solid #ddd;
            border-bottom: 0;
            background-color: #eeeeee;
            color: #444;
        }
        .content-tab ul li label:hover{
            background-color: #ddd;
        }
        .content-tab ul li label:active{
            background-color: #fff;
            
        }
        .content-tab ul li:not(:last-child) label{
            border-right-width: 0;
        }
        .content-tab section{
            clear: both;
        }
        
        .content-tab section div{
            padding: 20px;
            border: 1px solid #ddd;
            
            background-color: #fff;
            line-height: 1.5em;
            letter-spacing: 0.5px;
            color: #444;
        }
        .content-tabsection div h2{
            margin: 0;
            
            color: #34495e;
        }
        #tab1:checked ~ nav .tab1 label,
        #tab2:checked ~ nav .tab2 label,
        #tab3:checked ~ nav .tab3 label{
            background-color: #fff;
            color: #111;
            
        }
        #tab1:checked ~ nav .tab1 label:after,
        #tab2:checked ~ nav .tab2 label:after,
        #tab3:checked ~ nav .tab3 label:after{
            content: "";
            display: block;
            height: 2px;
            width: 100%;
            background-color: #fff;
            left: 0;
            bottom: -1px;
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
                                        <i style="padding: 10px" class="fas fa-user"></i>Profile</a></div>
                                    <div class="dd_item"><i style="padding: 10px" class="fas fa-key"></i>Change Password</div>    
                                    <div class="dd_item"><i style="padding: 10px" class="fas fa-sign-out-alt"></i>Logout</div>
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
                                
                                
                                <p class="profile_name"></p>
                            </div>
                        </div>
                        <ul>
                            <li>
                                <a href="dashboard.jsp">
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
                                    <li><a href="port-managment.jsp">Port Management</a></li>
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
                                <a href="contact.jsp">
                                    <span class="icon"><i class="fas fa-border-all"></i></span>
                                    <span class="title"> Contact</span>
                                </a>
                                
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="container">
                    <div class="content-header">
                        <div class="content-information">
                        <p><span class="icon"><i style="color: whitesmoke" class="fas fa-user"></i></span> 
                            <span class="a" style="padding: 0 12px; color: white"><%= ss.getUser_firstname()%> <%=ss.getUser_lastname()%></span></p>
                        <p><span class="icon"><i style="color: #99e6ff" class="fas fa-id-card"></i></span>
                            <span class="b" style="padding: 0 8px;color: white"><%= ss.getUser_icno()%></span></p>
                        <p><span class="icon"><i style="color: #e60000" class="fas fa-map-marker-alt"></i></span>
                            <span class="c" style="padding: 0 14px;color: white"><%= ss.getUser_addr()%> <%= ss.getUser_postcode()%><br><p style="margin-left: 50px; color: white"> <%= ss.getUser_city()%>, <%= ss.getUser_state()%></p></span>
                        </p>
                        <p><span class="icon"><i style="color: #cccccc" class="fas fa-university"></i></span>
                            <span class="d" style="padding: 0 10px;color: white"><%= ss.getUser_uni()%></span></p>
                        <p><span class="icon"><i style="color: white" class="fas fa-house-user"></i></span>
                            <span class="e" style="padding: 0 8px;color: white"><%= ss.getUser_username()%></span></p>
                        <p><span class="icon"><i style="color: #e6b800" class="fas fa-unlock-alt"></i></span>
                            <span class="f" style="padding: 0 11px;color: white"><%= ss.getUser_status()%></span></p>
                        <p><img src="getImage.jsp?user_username=<%=user_username%>"></p>
                        
                        <div class="content-tab">
                            <input checked="checked" id="tab1" type="radio" name="pct"/>
                            <input id="tab2" type="radio" name="pct"/>
                            <input id="tab3" type="radio" name="pct"/>
                            <nav>
                                <ul>
                                    <li class="tab1">
                                        <label for="tab1">Edit Profile </label>
                                    </li>
                                    <li class="tab2">
                                        <label for="tab2">Change Password </label>
                                    </li>
                                    <li class="tab3">
                                        <label for="tab3">Upload Picture</label>
                                    </li>
                                </ul>
                            </nav>
                            <section>
                                <div class="tab1">
                                    <h2>Edit</h2>
                                    <form action="profile-process.jsp" method="get">
                                        <input type="hidden" name="user_id" value="<%= ss.getUser_id()%>"/>
                                        <table>
                                        <tbody>
                                            <tr>
                                                <td>First Name:</td>
                                                <td><input type="text" name="user_firstname" value="<%= ss.getUser_firstname()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Last Name:</td>
                                                <td><input type="text" name="user_lastname" value="<%= ss.getUser_lastname()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Address</td>
                                                <td><input type="text" name="user_addr" value="<%= ss.getUser_addr()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Postcode</td>
                                                <td><input type="text" name="user_postcode" value="<%= ss.getUser_postcode()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>City</td>
                                                <td><input type="text" name="user_city" value="<%= ss.getUser_city()%>" /></td>
                                            </tr>
                                            <tr>
                                                <td>State</td>
                                                <td><input type="text" name="user_state" value="<%= ss.getUser_state()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Phone no.</td>
                                                <td><input type="text" name="user_phone" value="<%= ss.getUser_phone()%>"/></td>
                                            </tr>
                                            
                                            <tr>
                                                <td><label></label></td>
                                                <td><input type="submit" name="update" value="UPDATE">
                                                    <input type="cancel" name="cancel" value="Cancel"></td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </form>
                                </div>
                                <div class="tab2">
                                    <h2>Change Password</h2>
                                    <form action="password-process.jsp" method="get">
                                        <input type="hidden" name="user_id" value="<%= ss.getUser_id()%>"/>
                                        <table>
                                        <tbody>
                                            <tr>
                                                <td>Username</td>
                                                <td><input type="text" name="user_username" value="<%= ss.getUser_username()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Password</td>
                                                <td><input type="text" name="user_pass" value="<%= ss.getUser_pass()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td><label></label></td>
                                                <td><input type="submit" value="Update" style="font-family: century gothic;"/>
                                                <input type="button" value="Cancel" style="font-family: century gothic;"<input type="hidden" name="command" value="UPDATE"/></td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </form>
                                </div>
                                <div class="tab3">
                                    <h2>Upload Picture</h2>
                                    <form action="../uploadImage" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="user_id" value="<%= ss.getUser_id()%>"/>
                                        <table>
                                        <tbody>
                                            <tr>
                                                <td>Image</td>
                                                <td><input type="file" name="user_image"/></td>
                                            </tr>
                                          
                                            <tr>
                                                <td><label></label></td>
                                                <td><input type="submit" value="Update" style="font-family: century gothic;"/>
                                                <input type="button" value="Cancel" style="font-family: century gothic;"<input type="hidden" name="command" value="UPDATE"/></td>
                                            </tr>
                                        </tbody>
                                        </table>
                                    </form>
                                </div>
                            </section>
                        </div>
                        
                        
                        
                        
                    </div>                    
                </div>
            </div>
        
    </body>
</html>
