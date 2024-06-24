<%-- 
    Document   : ParticipantList
    Created on : 5 Jun 2024, 10:36:01 pm
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
            <%@ include file="css/styleparticipant.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class='wrapper'>
                <nav>
                    <div class="logo">Reef Saver</div>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="<%=request.getContextPath()%>/BiodiversityLanding.jsp">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity" class="btn light">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li> 
                    </ul>
                </nav>
                <!-- End of Desktop Navigation Menu-->
            </div>
        </header>
        <br>
        <div class="row">
            <!--<a href="http://localhost:8080/reefsaver/listParticipant">All Participant List</a>-->
            <div class="container">
                <br>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Institution</th>
                            <th>Shirt Size</th>
                            <!--                            <th>Activity ID</th>-->
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="participant" items="${listParticipant}">
                            <c:if test="${param.activityID == null || participant.activity.activityID == param.activityID}">
                                <tr>
                                    <td>                                    
                                        <c:out value="${participant.participantID}"/>
                                    </td>
                                    <td>                                    
                                        <c:out value="${participant.participantName}"/>
                                    </td>
                                    <td>                                    
                                        <c:out value="${participant.participantPhoneNo}"/>
                                    </td>
                                    <td>                                    
                                        <c:out value="${participant.participantAddress}"/>
                                    </td>
                                    <td>                                    
                                        <c:out value="${participant.participantInstitution}"/>
                                    </td>
                                    <td>                                    
                                        <c:out value="${participant.participantShirtSize}"/>
                                    </td>
                                    <!--                                    <td>                                    
                                    <%--<c:out value="${participant.activity.activityID}"/>--%>
                                </td>-->
                                    <td class="action-column">
                                        <a class="button"href="editParticipant?participantID=<c:out value='${participant.participantID}'/>">Edit</a> 
                                        <a class="button" href="deleteParticipant?participantID=<c:out value='${participant.participantID}'/>">Delete</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include Javascript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
