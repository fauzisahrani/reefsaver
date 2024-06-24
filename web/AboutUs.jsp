<%-- 
    Document   : AboutUs
    Created on : 24 Jun 2024, 11:54:30 pm
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
            <%@ include file="css/styleAbout.css"%>
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
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
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
                            <h2>About us</h2>
                        </div>
                        <div>
                            <p>Reef Saver is a cutting-edge coral conservation and 
                                awareness platform software that revolutionizes coral 
                                reef management by offering a user-friendly interface 
                                to manage user data, coral biodiversity information, 
                                conservation activities, marine news, and researcher 
                                networks. Through a modular design approach and 
                                secure database infrastructure, Reef Saver efficiently 
                                organizes and safeguards critical data while enabling 
                                seamless collaboration among stakeholders. This platform 
                                will demonstrate its effectiveness in various coral 
                                conservation projects, facilitating user registration, 
                                role-based access control, centralized storage and 
                                analysis of coral biodiversity data, streamlined 
                                planning and monitoring of conservation activities, 
                                real-time dissemination of marine news, and enhanced 
                                collaboration among researchers. Reef Saver will 
                                assist in optimizing data management, fostering 
                                collaboration, and raising awareness underscores 
                                its pivotal role in advancing coral reef conservation 
                                efforts globally. Future directions for Reef Saver 
                                include integrating advanced technologies like 
                                machine learning for automated coral health assessment, 
                                leveraging remote sensing data for large-scale 
                                monitoring, and expanding its reach to a broader 
                                user base to further enhance coral reef conservation 
                                initiatives worldwide.</p>
                            <div class="acknowledgemanet">
                                <p>This website is developed by Fauzi Sahrani © 2023</p>
                                <p>Finished Date: 26 June 2024</p>
                            </div>
                        </div>
                    </div>
                </section>
        </header>
        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include JavaScript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
