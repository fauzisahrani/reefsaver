<%-- 
   Document   : ResearchersList
   Created on : 16 April 2024, 10:33:54 pm
   Author     : Pojie
   This jsp is used to display all researchers list
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <%@ include file="css/styleresearchers.css"%>
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
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers" class="btn light">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!--end of desktop navigation menu-->

                <section class='researchers-section'>
                    <c:set var="count" value="0" /> <!-- Initialize a counter variable -->
                    <div class='researchers-cards'> <!-- Start the outer div -->
                        <c:forEach var="user" items="${listUser}" varStatus="status"> <!-- Iterate over the list of researchers -->
                            <c:if test="${count % 2 == 0 && count != 0}"> <!-- Check if count is divisible by 2 and not equal to 0 -->
                            </div>
                            <div class='researchers-cards'> <!-- Close the current div and start a new one -->
                            </c:if>
                            <c:set var="count" value="${count + 1}" /> <!-- Increment the counter -->
                            <div class='researcher-card'> <!-- Start the researcher card div -->
                                <!-- Display researcher details -->
                                <div class="researcherimage">
                                    <img src="images/Feeback 1.png" alt="researchers"/>
                                </div>
                                <div class="researcherdetails">
                                    <h3><c:out value="${user.userName}"/></h3>
                                    <p><c:out value="${user.userEmail}"/></p>
                                    <p><c:out value="${user.userField}"/></p>
                                    <p><c:out value="${user.userInstitution}"/></p>
                                    <a class="btn dark"href="mailto:<c:out value="${user.userEmail}"/>">Contact</a>
                                </div>
                            </div> <!-- Close the researcher card div -->
                        </c:forEach> <!-- End of forEach loop -->
                    </div> <!-- Close the outer div -->
                </section>
            </div>
        </header>
        <!--end of header section-->

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
        <script src="js/main.js"></script>    
    </body>
</html>
