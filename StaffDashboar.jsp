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
        <link rel="stylesheet" href="swiper.min.css">
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
        
        .wrapper.active .maincontainer .container{
            width: calc(100% - 80px);
            margin-left: 80px;
            
        }
        
        .wrapper.active .maincontainer .container .swiper-container{
            width: calc(100% - 80px);
            margin-left: 35px;
            
        }
        .wrapper .maincontainer .container .swiper-container{
            width: calc(100% - 80px);
            margin-left: 250px;
            
        }
      
        
        
        .maincontainer .container-content{
            margin: 0;

            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: silver;
        }

        .card{
            position: relative;
            background: gray;
            width: 300px;
            height: 400px;
            margin: 0 auto;

        }
        .card .content{
            width: 270px;
            padding: 30px;
            box-sizing: border-box;
        }
        .card .content a{
            display: inline-block;
            margin: 10px 0 0;
            padding: 10px 20px;
            text-decoration: none;
            border: 2px solid #262626;
            color: #262626;
            font-weight: 600;
        }
        .card .sliderText{
            position: relative;
            width: 100%;
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #000;
        }
        .card .sliderText h3{
            color: #fff;
            font-size: 3em;
        }
        .swiper-slide{
            width: 270px;
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
                                <a href="#" class="active">
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
                    
                    <div class="container-content">
                        
                    <div class="swiper-container">
                        <h1 style="text-align: center">Welcome to Maritime Education</h1>
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="card">
                                    <div class="sliderText">                                       
                                        <img style="width:300px;height:200px "   src="https://www.solent.ac.uk/courses/undergraduate/shipping-and-port-management-bsc/years/2016/assets/shipping-and-port-management-Cropped-1920x830.jpg">  
                                    </div>
                                    <div class="content">
                                        <h3>Port and Shipping</h3>
                                        <p> Large ports need to deal with a number of disparate activities</p>
                                        <a href="#">Read more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="card">
                                    <div class="sliderText">
                                        <img style="width:300px;height:200px " src="https://www.sinor-marine.com/wp-content/uploads/2019/05/bridge-mate-dynamic-positioning.jpg">
                                    </div>
                                    <div class="content">
                                        <h3>Technology Maritime</h3>
                                        <p>The field of Maritime Technology is a field that focuses on the application of technology.
                                        </p>
                                        <a href="#">Read more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="card">
                                    <div class="sliderText">
                                        <img style="width:300px;height:200px" src="http://www.portmanagers.net/images/Ima/home2.jpg">
                                    </div>
                                    <div class="content">
                                        <h3>Port Management</h3>
                                        <p>Innovative port operator and facility service provider, 
                                            developing and deploying intelligent systems </p>
                                        <a href="#">Read more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="card">
                                    <div class="sliderText">
                                        <img style="width:300px;height:200px" src="https://technology.risiinfo.com/sites/technology.risiinfo.com/files/images/page/2017/06/860e13f3b8c95d11_org.jpg">
                                    </div>
                                    <div class="content">
                                        <h3>Navigation</h3>
                                        <p>The voyage practices, 
                                            focusing on the process of monitoring and controlling 
                                            the movement of the ship from one place to another</p>
                                        <a href="#">Read more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="card">
                                    <div class="sliderText">
                                        <img style="width:300px;height:200px" src="https://www.imdo.ie/Home/sites/default/files/IMDOFiles/IMDOStoryImages/Policy/Policy%20Hero%20Image%20Orig-1200x380.jpg">
                                    </div>
                                    <div class="content">
                                        <h3>Maritime Policies</h3>
                                        <p>principles and objectives to guide decisions in the maritime transport</p>
                                        <a href="#">Read more</a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="card">
                                    <div class="sliderText">
                                        <img style="width:300px;height:200px" src="https://focusmalaysia.my/wp-content/uploads/2020/03/shipping-1280x640.jpeg">
                                    </div>
                                    <div class="content">
                                        <h3>Shipping</h3>
                                        <p>principles and objectives to guide decisions in the maritime transport</p>
                                        <a href="#">Read more</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <script src="swiper.min.js"></script>
                    <script>

    var swiper = new Swiper('.swiper-container', {
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 'auto',
        coverflowEffect: {
            rotate: 30,
            stretch: 0,
            depth: 500,
            modifier: 1,
            slideShadows: true
        },
        pagination: {
            el: '.swiper-pagination'
        }
    });
                    </script>  
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>
