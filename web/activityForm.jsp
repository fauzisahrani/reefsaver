<%-- 
    Document   : activityForm
    Created on : 23 Apr 2024, 3:09:44 pm
    Author     : Pojie
    Used for add and edit/Update Process
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
                        <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Biodiversity</a></li>
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
                        <c:if test="${activity != null}">
                            <div class="prompt">
                                Update Activity Details
                            </div>
                        </c:if>
                        <c:if test="${activity == null}">      
                            <div class="prompt">
                                Create New Activity
                            </div>
                        </c:if>
                        <div class="form">
                            <c:if test="${activity != null}">
                                <form action="updateactivity" method="psot">
                                </c:if>
                                <c:if test="${activity == null}">
                                    <form action="insertactivity" method="post">
                                    </c:if>
                                    <div>
                                        <c:if test="${activity != null}">
                                            <input type="hidden" name="activityID" 
                                                   value="<c:out value="${activity.activityID}" />"/>
                                        </c:if>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Activity Name</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" 
                                                       value="<c:out value="${activity.activityName}"/>"
                                                       name="activityName" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Date</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="date" 
                                                       value="<c:out value="${activity.activityDate}"/>"
                                                       name="activityDate" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Venue</label>
                                            </div>
                                            <div class='col-75'>
                                                <input type="text" 
                                                       value="<c:out value="${activity.activityVenue}"/>"
                                                       name="activityVenue" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class='col-25'>
                                                <label for='fname'>Organizer</label>
                                            </div>
                                            <div class='col-75'>
                                                <input type="text" 
                                                       value="<c:out value="${activity.activityOrganizer}"/>"
                                                       name="activityOrganizer" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class='col-25'>
                                                <label for='fname'>Max Participant</label>
                                            </div>
                                            <div class='col-75'>
                                                <input type="number" 
                                                       value="<c:out value="${activity.activityParticipantNo}"/>"
                                                       name="activityParticipantNo" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class='col-25'>
                                                <label for='fname'>Register Before</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="date" 
                                                       value="<c:out value="${activity.activityRegisterDue}"/>"
                                                       name="activityRegisterDue" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class='col-25'>
                                                <label for='fname'>Description</label>
                                            </div>
                                            <div class='col-75'>
                                                <input type="text" 
                                                       value="<c:out value="${activity.activityDesc}"/>"
                                                       name="activityDesc" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class='col-25'>
                                                <label for='fname'>Image</label>
                                            </div>
                                            <div class='col-75'>
                                                <input type="file" accept="image/*"
                                                       value="<c:out value="${activity.activityImage}"/>"
                                                       name="activityImage" required="required">
                                            </div>
                                        </div>


                                        <c:if test="${activity != null}">
                                            <button class='btn dark' type="submit">Update</button>                                            </c:if>
                                        <c:if test="${activity == null}">
                                            <button class='btn dark' type="submit">Create</button>                                                </c:if>
                                </form>
                        </div>
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
