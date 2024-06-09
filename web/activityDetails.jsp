<%-- 
    Document   : activityDetails
    Created on : 27 May 2024, 7:44:47 pm
    Author     : Pojie
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Title -->
        <title>Reef Saver</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">

        <!-- Stylesheet -->
        <style>
            <%@ include file="css/styleactivities.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">ReefSaver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity" class="btn light">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!-- End of Desktop Navigation Menu-->
                <section class="form-section">
                    <div class="form-card">
                        <div class="prompt">
                            <c:out value="${activity.activityName}"/>                        
                        </div>
                        <div class="form">
                            <input type="hidden" name="activityID" 
                                   value="<c:out value="${activity.activityID}" />"/>
                            <div class="container">
                                <div class="label">
                                    <label>Image:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityImage}"/></span>
                                </div>
                            </div>

                            <div class="container">
                                <div class="label">
                                    <label>Date:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityDate}"/></span>
                                </div>
                            </div>

                            <div class="container">
                                <div class="label">
                                    <label>Venue:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityVenue}"/></span>
                                </div>
                            </div>

                            <div class="container">
                                <div class="label">
                                    <label>Organizer:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityOrganizer}"/></span>
                                </div>
                            </div>

                            <div class="container">
                                <div class="label">
                                    <label>Max Participant:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityParticipantNo}"/></span>
                                </div>
                            </div>

                            <div class="container">
                                <div class="label">
                                    <label>Register Before:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityRegisterDue}"/></span>
                                </div>
                            </div>

                            <div class="container">
                                <div class="label">
                                    <label>Description:</label>
                                </div>
                                <div class="details">
                                    <span><c:out value="${activity.activityDesc}"/></span>
                                </div>
                            </div>

                            <button class='btn dark' type="#">Register</button>
                        </div>
                    </div>
                </section>
            </div>
        </header>
        <!-- End of the header section -->
        <footer>
            <div class="wrapper">
                <div class="links-container">
                    <div class="links">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>

                    <div class="links">
                        <h3>Course</h3>
                        <ul>
                            <li><a href="#">Log In</a></li>
                            <li><a href="#">Download</a></li>
                            <li><a href="#">All Courses</a></li>
                        </ul>
                    </div>

                    <div class="links">
                        <h3>Contact Us</h3>
                        <ul>
                            <li>s63721@ocean.umt.edu.my</li>
                        </ul>
                        <div class="social">
                            <a href="#">
                                <img src="images/Facebook Icon.svg" alt="">
                            </a>
                            <a href="#">
                                <img src="images/Insta Icon.svg" alt="">
                            </a>
                        </div>

                        <form action="#">
                            <input type="text" placeholder="Email Address" />
                            <button class="submit-btn">Subscribe</button>
                        </form>
                    </div>

                </div>

                <p class="copyright">This website is developed by Fauzi Sahrani © 2023</p>
            </div>
        </footer>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
