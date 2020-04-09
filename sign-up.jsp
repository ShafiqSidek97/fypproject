<%-- 
    Document   : sign-up
    Created on : Mar 27, 2020, 4:44:10 PM
    Author     : USER
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        
        <style>
          *{
             margin: 0;
             padding: 0
          }  
          
          body{
             background-image: url(https://images.pexels.com/photos/1556991/pexels-photo-1556991.jpeg?cs=srgb&dl=aerial-view-of-ship-on-body-of-water-1556991.jpg&fm=jpg);
             font-family: sans-serif;
             margin-top: 40px;
             background-position: center;
             background-size: cover;
          }
          
          .regform{
              width: 800px;
              background-color: rgb(0,0,0,0.6);
              margin: auto;
              color: #ffffff;
              padding: 10px 0px 10px 0px;
              text-align: center;
              border-radius: 15px 15px 0 0;
          }
          
          .main{
              background-color: rgb(0,0,0,0.5);
              width: 800px;
              margin: auto;
          }
          
          form{
              padding: 10px;
          }
          
          #name{
              width: 100%;
              height:100px;
          }
          .name{
              margin-left: 25px;
              margin-top: 30px;
              width: 125px;
              color: white;
              font-size: 18px;
              font-weight: 700;
          }
          
          .firstname, .street1{
              position: relative;
              left: 200px;
              top: -37px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
          }
          
          .lastname{
              position: relative;
              left: 417px;
              top: -80px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
              
          }
          .firstlabel, .streetlabel{
              position: relative;
              color: #E5E5E5;
              text-transform: capitalize;
              font-size: 14px;
              left: 203px;
              top: -45px;
          }
          .lastlabel{
              position: relative;
              color: #E5E5E5;
              text-transform: capitalize;
              font-size: 14px;
              left: 175px;
              top: -45px;
          }
          
          .postcode{
              position: relative;
              left: 450px;
              top: -80px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
          }
          .postlabel{
              position: relative;
              color: #E5E5E5;
              text-transform: capitalize;
              font-size: 14px;
              left: 210px;
              top: -45px;
          }
          .city{
              position: relative;
              left: -148px;
              top: -10px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
          }
          .citylabel{
              position: relative;
              color: #E5E5E5;
              text-transform: capitalize;
              font-size: 14px;
              left: -390px;
              top: 25px;
          }
          .state{
              position: relative;
              left: 492px;
              top: -53px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
          }
          .statelabel{
              position: relative;
              color: #E5E5E5;
              text-transform: capitalize;
              font-size: 14px;
              left: 250px;
              top: -20px;
          }
          .icno, .phone, .username, .pass{
              position: relative;
              left: 200px;
              top: -37px;
              width: 115px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
          }
          .option{
              position: relative;
              left: 200px;
              top: -20px;
              width: 195px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
              outline: none;
              overflow: hidden;
          }
          .radio{
              display: inline-block;
              padding-right: 40px;
              font-size: 17px;
              margin: 20px 40px;
              color: white;
          }
          .radio input{
              width: 15px;
              height: 15px;
              border-radius: 50%;
              cursor: pointer;
              outline: none;
          }
          
          .image{
              position: relative;
              left: 200px;
              top: -37px;
              width: 230px;
              line-height: 40px;
              border-radius: 6px;
              padding: 0 22px;
              font-size: 16px;
              color: white;
          }
          
          .button{
              background-color: #3BAF9F;
              display: block;
              margin: 20px 0px 0px 20px;
              text-align: center;
              border-radius: 12px;
              border: 2px solid #366473;
              padding: 14px 110px;
              outline: none;
              color: white;
              cursor: pointer;
              transition: 0.25px;   
          }
          .button:hover{
              background-color:#004d40;
          }
          
        </style> 
        
    </head>
    <body>
        <div class="regform"><h1>Registration Form</h1></div>
        <div class="main">
            <form action="connect.jsp" method="post">
            <div id="name">
            <h2 class="name">Name</h2>
            <input class="firstname" type="text" name="user_firstname" placeholder="Enter First Name"> <br>
            <label class="firstlabel">First Name</label>
            <input class="lastname" type="text" name="user_lastname" placeholder="Enter Last Name">
            <label class="lastlabel">Last Name</label>
            </div>
            
            <div id="name">
            <h2 class="name">Address</h2>
            <input class="street1" type="text" name="user_addr" placeholder="Enter Street"> <br>
            <label class="streetlabel">Street </label>
            <input class="postcode" type="text" name="user_postcode" placeholder="Enter Postcode">
            <label class="postlabel">Postcode</label>
            <input class="city" type="text" name="user_city" placeholder="Enter City">
            <label class="citylabel">City</label>
            <input class="state" type="text" name="user_state" placeholder="Enter City">
            <label class="statelabel">State</label>
            </div>
            
            <h2 class="name">Identify Card No.</h2>
            <input class="icno" type="text" name="user_icno" placeholder="Enter IC No">
            
            <h2 class="name">Phone</h2>
            <input class="phone" type="text" name="user_phone" placeholder="Enter Phone No">
                       
            <h2 class="name">University</h2>
            <select class="option" name="user_uni">
                <option disabled="disabled" selected="selected">--Choose Option--</option>
                        <option value="UPM">Universiti Putra Malaysia</option>
                        <option value="UPSI">Universiti Pendidikan Sultan Idris</option>
                        <option value="UKM">Universiti Malaysia Kebangsaan</option>
                        <option value="UM">Universiti Malaya</option>
                        <option value="UMP">Universiti Malaysia Pahang</option>
                        <option value="UMK">Universiti Malaysia Kelantan</option>
                        <option value="UMT">Universiti Malaysia Terengganu</option>
                        <option value="UNIMAP">Universiti Malaysia Perlis</option>
                        <option value="UITM">Universiti Teknologi MARA</option>
                        <option value="UTM">Universiti Teknologi Malaysia</option>
                        <option value="UMT">Universiti Malaysia Terengganu</option>
                    </select>
            
            <h2 class="name">Username</h2>
            <input class="username" type="text" name="user_username" placeholder="Enter Username">
            
            <h2 class="name">Password</h2>
            <input class="pass" type="password" name="user_pass" placeholder="Enter Password">
            
            
            
            <h2 class="name">Status</h2>
            <label class="radio">
                <input type="radio" name="user_status" value="Student" >Student
            </label>
            <label class="radio">
                <input type="radio" name="user_status" value="Staff" >Staff
            </label>                
            
            <input class="button" type="submit" name="submit" value="Sign Up">
        </form>
        </div>
    </body>
</html>
