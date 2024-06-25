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

        <!-- Include Stylesheet -->
        <style>
            <%@ include file="css/styleActivity.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">Reef Saver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/BiodiversityLanding.jsp">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity" class="btn light">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                            <c:if test="${sessionScope.userType == 'Admin'}">
                            <li>
                                <a href="<%=request.getContextPath()%>/listUser">User</a>
                            </li>                        
                        </c:if>                        
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
                                <div class="details">
                                    <img src="data:image/jpeg;base64,${activity.activityImageBase64}" alt="Image">
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
                                    <span>
                                        <c:choose>
                                            <c:when test="${empty activity.activityParticipantNo}">
                                                N/A
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${activity.activityParticipantNo}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
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

                            <div class="btn button-container">
                                <a href="<%=request.getContextPath()%>/listParticipant?activityID=<c:out 
                                       value='${activity.activityID}'/>"class="filter-link">List Participant</a>
                                <a href="ParticipantForm.jsp">Register</a>
                            </div>

                        </div>
                    </div>
                </section>
            </div>
        </header>
        <!-- End of the header section -->

        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include Javascript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
