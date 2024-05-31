<%-- 
    Document   : test
    Created on : 2 Jan 2024, 8:14:24 pm
    Author     : Pojie
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- specifies the character encoding -->
        <meta charset="UTF-8">
        <!-- sets the width of the viewport to the width of the device screen -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reef Saver</title>
        <!-- preload google fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!-- import Poppins and Raleway from google fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <!--import stylesheet-->
        <style>
            <%@ include file="css/profilestyle.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">ReefSaver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>                        
                        <li><a href="#">Coral Biodiversity</a></li>
                        <li><a href="#">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                            <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listuser">User</a></li>
                        <li><a href="UserProfile.jsp" class="btn light"s>Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!--end of desktop navigation bar-->
                <section class="profile-section">
                    <div class="profile-card">
                        <div class="myprofile">
                            <h2>${userType}</h2>
                        </div>
                        <div class="details">
                            <div class="left">
                                <img src="images/fauziprofile.JPG" alt=""/>
                            </div>
                            <div class="right">
                                <h3>${userName}</h3>
                                <p>${userEmail}</p>
                                <p>${userField}</p>
                                <p>${userInstitution}</p>
                            </div>
                        </div>
                        <div class="actionbuttons">
                            <a class="btn dark"href="edit?userID=<c:out value='${userID}'/>">Edit</a>
                            <a class="btn dark" href="delete?userID=<c:out value='${userID}'/>" onclick="return confirm('Are you sure you want to delete your account?');">Delete Account</a>
                        </div>
                    </div>
                </section>
            </div>
        </header>
    </body>
</html>