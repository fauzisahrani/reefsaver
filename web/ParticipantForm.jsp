<%-- 
    Document   : ParticipantForm
    Created on : 9 Jun 2024, 11:41:51 am
    Author     : Pojie
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <div class="wrapper">
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
                <section class="form-section">
                    <div class="form-card">
                        <c:if test="${participant != null}">
                            <div class="prompt">
                                Update Participant Details
                            </div>
                        </c:if>
                        <c:if test="${participant == null}">      
                            <div class="prompt">
                                Register Participant
                            </div>
                        </c:if>
                        <div class="form">
                            <c:if test="${participant != null}">
                                <form action="updateParticipant" method="psot">
                                </c:if>
                                <c:if test="${participant == null}">
                                    <form action="insertParticipant" method="post">
                                    </c:if>
                                    <div>
                                        <c:if test="${participant != null}">
                                            <input type="hidden" name="participantID" 
                                                   value="<c:out value="${participant.participantID}" />"/>
                                        </c:if>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Participant Name</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" 
                                                       value="<c:out value="${participant.participantName}"/>"
                                                       name="participantName" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Phone Number</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" 
                                                       value="<c:out value="${participant.participantPhoneNo}"/>"
                                                       name="participantPhoneNo" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Address</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" 
                                                       value="<c:out value="${participant.participantAddress}"/>"
                                                       name="participantAddress" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Institution</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" 
                                                       value="<c:out value="${participant.participantInstitution}"/>"
                                                       name="participantInstitution" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Shirt Size</label>
                                            </div>
                                            <div class="col-75">
                                                <input type="text" 
                                                       value="<c:out value="${participant.participantShirtSize}"/>"
                                                       name="participantShirtSize" required="required">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-25">
                                                <label for="fname">Activity Name</label>
                                            </div>
                                            <div class="col-75">
                                                <select id="activityID" name="activityID">
                                                    <%
                                                        try {
                                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reefsaver", "root", "admin");
                                                            Statement st = con.createStatement();
                                                            String query = "select * from activity";
                                                            //get table data
                                                            ResultSet rs = st.executeQuery(query);
                                                            //get activity id one by one
                                                            while (rs.next()) {
                                                    %>

                                                    <option value="<%= rs.getString("activityID")%>"> <%=rs.getString("activityName")%></option>

                                                    <%
                                                            }

                                                        } catch (ClassNotFoundException | SQLException e) {
                                                            out.println("Error: " + e.getMessage());
                                                            e.printStackTrace();
                                                        }

                                                    %>
                                                </select>
                                            </div>
                                        </div>

                                        <c:if test="${participant != null}">
                                            <button class='btn dark' type="submit">Update</button>                                            
                                        </c:if>
                                        <c:if test="${participant == null}">
                                            <button class='btn dark' type="submit">Register</button>                                                
                                        </c:if>
                                </form>
                        </div>
                    </div>
            </div>
        </section>
    </div>
</header>  

<!--include footer-->
<jsp:include page="footer.jsp" />

<!--include Javascript-->
<script src="js/main.js" type="text/javascript"></script>

</body>
</html>
