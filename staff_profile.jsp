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
            $(document).ready(function () {
                $(".right_menu li .fas").click(function () {
                    $(".profile_dd").toggleClass("active");
                });
                $(".hamburger").click(function () {
                    $(".wrapper").toggleClass("active");
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
        body{
            background: silver;
            color: #555555;
        }
        .wrapper{
            width: 100%;
            height: 100%;
        }
        .wrapper.active .sidebar{
            width: 80px;
        }

        .wrapper.active .sidebar ul li a span.title{
            display: none;
        }
        .wrapper.active .sidebar p{
            display: none;
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
            width: 110px;
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
            position: relative;
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
            width: 650px;
            height: auto;
            position: relative;
            margin-top: 100px;
            margin-left: 270px;          
            display: flex;
        }
        .container .container-profile{
            width: 400px;
            margin-right: 25px;
        }
        .container .container-profile .profile-img{
            display: flex;
            background: white;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.125);
        } 
        .container .container-profile .profile-img .img{
            width: 195px;            
        }
        .container .container-profile .profile-img .img img{
            display: block;
            width: 100%;
            height: 100%;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        .container .container-profile .profile-img .info{
            width: calc(100%-125px);
            padding: 30px;
        }
        .container .container-profile .profile-img .info p.name{
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 0px;
        }
        .container .container-profile .profile-img .info p.address{
            font-weight: 300;
        }
        .container .container-profile .profile-img .info p.address span{
            margin-right: 5px;
        }
        .container .container-profile .profile_user{
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.125);
        }
        .container .container-profile .profile_user .user{
            padding-bottom: 20px;
            border-bottom: 1px solid #cccccc;
        }
        .container .container-profile .profile_user .user p{
            text-transform: uppercase;
            font-weight: 700;
            font-size: 20px;
            margin-bottom: 10px;
        }
        .container .container-profile .profile_user .user ul li{
            font-size: 20px;
            margin-bottom: 10px;            
        }
        .container .container-profile .profile_user .user ul li .fas{
            width: 30px;
            font-size: 25px;
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
                                        <a style="color: #004d40" href="staff_profile.jsp"> <i style="padding: 10px" class="fas fa-user"></i>Profile</a></div>
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


                                <p class="active" style="margin-left: 10px">Welcome <%= ss.getUser_firstname()%></p>
                                <p class="profile_name"></p>
                            </div>
                        </div>
                        <ul>
                            <li>
                                <a href="StaffDashboar.jsp">
                                    <span class="icon"><i class="fas fa-home"></i></span>
                                    <span class="title"> Dashboard</span>
                                </a>

                            </li>
                            <li>
                                <a href="#">
                                    <span class="icon"><i class="fab fa-delicious"></i></span>
                                    <span class="title"> Manage File</span> 
                                </a>


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
                    <div class="container-profile">
                        <div class="profile-img">
                            <div class="img">
                                <img src="http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg" alt="profile_pic">                            
                            </div>
                            <div class="info">
                                <p class="name"><%= ss.getUser_firstname()%> <%= ss.getUser_lastname()%></p>
                                <p class="address"><span><i class="fas fa-map-marker-alt"></i></span><%= ss.getUser_addr()%> <%= ss.getUser_city()%><br><%= ss.getUser_postcode()%> <%= ss.getUser_state()%></p>
                            </div>
                        </div>
                        <div class="profile_user">
                            <div class="user">
                                <p>Information</p>
                                <ul>
                                    <li>
                                        <span class="icon"><i class="fas fa-id-badge"></i></span>
                                        <span class="tittle"><%= ss.getUser_icno()%></span>
                                    </li>
                                    <li>
                                        <span class="icon"><i class="fas fa-phone"></i></span>
                                        <span class="tittle">+60<%= ss.getUser_phone()%></span>
                                    </li>
                                    <li>
                                        <span class="icon"><i class="fas fa-university"></i></span>
                                        <span class="tittle"><%= ss.getUser_uni()%></span>
                                    </li>
                                    <li>
                                        <span class="icon"><i class="fas fa-hashtag"></i></span>
                                        <span class="tittle"><%= ss.getUser_status()%></span>
                                    </li>
                                </ul>
                            </div>
                            
                        </div>
                        <div class="profile_counts">

                        </div> 

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
