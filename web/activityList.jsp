<%-- 
    Document   : activityList
    Created on : 23 Apr 2024, 3:10:05 pm
    Author     : Pojie
    Display all activity records
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
            <%@ include file="css/styleActivity.css"%>
        </style>
    </head>
    <body>
        <header>
            <div class='wrapper'>
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
            </div>
            <section class='activities-section'>

                <div class="newbutton">
                    <a href="<%=request.getContextPath()%>/newactivity" class="btn light"> Add New Activity</a> <!--hyperlink act as button-->
                </div>

                <c:set var="count" value="0" /> <!-- Initialize a counter variable -->
                <div class='activities-cards'> <!-- Start the outer div -->
                    <c:forEach var="activity" items="${listActivity}" varStatus="status"> <!-- Iterate over the list of activities -->
                        <c:if test="${count % 3 == 0 && count != 0}"> <!-- Check if count is divisible by 3 and not equal to 0 -->
                        </div>
                        <div class='activities-cards'> <!-- Close the current div and start a new one -->
                        </c:if>
                        <c:set var="count" value="${count + 1}" /> <!-- Increment the counter -->
                        <div class='activity-card'> <!-- Start the activity card div -->
                            <!-- Display activity details -->
                            <input type="hidden" name="activityID" value="<c:out value='${activity.activityID}'/>">                            
                            <h1><c:out value="${activity.activityName}"/></h1>
                            <img src="data:image/jpeg;base64,${activity.activityImageBase64}" alt="Image">
                            <h3><c:out value="${activity.activityDate}"/></h3>
                            <h4><c:out value="${activity.activityVenue}"/></h4>
                            <!-- Links for editing and deleting activity -->
                            <div class="actionbtn">
                                <!--<a class="btn dark" href="listParticipantByActivityID?activityID=<c:out value='${activity.activityID}'/>">Participant</a>-->
                                <a class="btn dark" href="viewactivity?activityID=<c:out value='${activity.activityID}'/>">Details</a>
                            </div>
                            <div class="actionbtn">
                                <!--<a class="btn dark" href="editactivity?activityID=<c:out value='${activity.activityID}'/>">Edit</a>-->
                                <!--<a class="btn dark" href="deleteactivity?activityID=<c:out value='${activity.activityID}'/>" onclick="return confirm('Are you sure you want to delete <c:out value="${activity.activityName}"/>?');">Delete</a>-->
                            </div>
                        </div> <!-- Close the activity card div -->
                    </c:forEach> <!-- End of forEach loop -->
                </div> <!-- Close the outer div -->
            </section>
        </header>
        <!-- End of the header section -->

        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include Javascript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
