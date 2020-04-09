<%-- 
    Document   : login
    Created on : Mar 7, 2020, 2:05:24 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
        <style>
            body{
                margin: 0;
                padding: 0;
                background: url(http://www.shipspotting.com/photos/middle/9/8/2/2765289.jpg);
                background-size: cover;
                background-position: center;
                font-family: sans-serif;
            }
            .loginbox{
                width: 320px;
                height: 420px;
                background: whitesmoke;
                top: 50%;
                left: 50%;
                position: absolute;
                transform: translate(-50%,-50%);
                box-sizing: border-box;
                border-radius: 8px;
            }
            .avatar{
                width:100px;
                height:100px;
                border-radius: 50%;
                position: absolute;
                top: -10%;
                left: 35%;
            }
            h1{
                top: -10%;
                margin-top:60px;
                padding: 0 0 20px;
                text-align: center;
                font-size: 22px;
            }
            .loginbox p{
                margin-left: 35px;
                padding: 0;
                font-weight: bold;
            }
            .loginbox input{
                width: 80%;
                margin-bottom: 20px; 
                margin-left: 35px;
            }
            .loginbox input[type="text"], input[type="password"]{
                border: none;
                border-bottom: 1px solid black;
                background: transparent;
                outline: none;
                height: 40px;
            }
            .loginbox input[type="submit"]{
                border: none;
                outline: none;
                height: 40px;
                background: red;
                color: white;
                font-size: 18px;
                border-radius: 20px;
            }
            .loginbox input[type="submit"]:hover{
                cursor: pointer;
                background: #ffc107;
                color: #000;
            }
        </style>
    </head>
    <body>
     
        
        <div class="loginbox">
            <img src="https://ya-webdesign.com/transparent250_/businessman-png-icon-1.png" class="avatar" />
            <h1>Login</h1>
            <form action="loginconnect.jsp" method="post">
                <p>Username</p>
                <input type="text" name="user_username" placeholder="Enter Username">
                <p>Password</p>
                <input type="password" name="user_pass" placeholder="Enter Password">
                                     
                <input type="submit" name="submit" value="Login">
            </form>
        </div>
    </body>
</html>
