<%-- 
    Document   : Homepage.jsp
    Created on : 22 Jun 2023, 2:52:08 pm
    Author     : Pojie
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reef Saver</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style><%@ include file="css/styleHomepage.css"%></style>
    </head>

    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">Reef Saver</div>
                    <ul>
                        <li><a href="Homepage.jsp" class="btn light">Home</a></li>                        
                        <li><a href="<%=request.getContextPath()%>/BiodiversityLanding.jsp">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
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
                <!--begin of reef-section-->
                <div class="reefs-section">
                    <div class="left">
                        <h1>Discover the Reefs</h1>
                        <p>The world's finest wilderness lies beneath the waves. 
                            Together we protect the beauty of marine
                            nature</p>
                        <a href="#features" class="btn light">Explore</a>
                    </div>
                    <div class="right">
                        <img src="images/Coral Icon.png" alt="">
                    </div>
                    <div class="reefs-cards">
                        <div class="reefs-card country">
                            <div class="content">
                                <div class="country">
                                    <h3>Malaysia</h3>
                                </div>
                            </div>
                        </div>

                        <div class="reefs-card coral-facts">
                            <div class="content">
                                <h3>Coral are animals not plants!</h3>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </header>
        <!-- End of the header section -->

        <!--begin of testimonial section-->
        <section class="testimonials-section">
            <div class="wrapper">
                <div class="left">

                    <!--first testimony-->
                    <div class="testimonial-card">
                        <div class="content">
                            This is a great platform. It helped me to learn new knowledge from different field
                        </div>

                        <div class="info">
                            <h4>Fauzi Sahrani</h4>
                            <p class="role">Software Engineering Students</p>
                        </div>
                        <img src="images/fauziSahrani.JPG" alt=""/>
                    </div>

                    <!--second testimony-->
                    <div class="testimonial-card">
                        <div class="content">This platform help me collaborate with other researchers</div>

                        <div class="info">
                            <h4>Dr. Sharifah Mashita</h4>
                            <p class="role">Computer Science Researchers</p>
                        </div>
                        <img src="images/drSharifahMashita.jpg" alt=""/>
                    </div>

                    <!--third testimony-->
                    <div class="testimonial-card">
                        <div class="content">
                            This platform makes my research tasks easier
                        </div>

                        <div class="info">
                            <h4>Dr. Tengku Fara Kamilia</h4>
                            <p class="role">Reefs Researchers</p>
                        </div>
                        <img src="images/drTengkuFara.jpeg" alt=""/>
                    </div>
                </div>

                <div class="right">
                    <h2>What our users say</h2>

                    <div class="features">
                        <p>Users will be able to learn better about coral reefs in this platform</p>
                        <p>Everything about coral reefs in one platform</p>
                    </div>

                    <a href="#features" class="btn dark">Explore</a>
                </div>
            </div>
        </section>
        <!-- End of testimonial Section -->

        <!-- begin of features-section -->
        <section class="features-section" id="features">
            <div class="wrapper">
                <h2 class="light">Highlight Features</h2>
                <div class="feature-cards">

                    <div class="left">

                        <!--card 1-->
                        <a href="<%=request.getContextPath()%>/listbiodiversity">
                            <div class="feature-card">
                                <img src="images/biodiversityicon.png" alt="">
                                <div class="info">
                                    <h3>Coral Biodiversity</h3>
                                </div>
                            </div>
                        </a>

                        <!--card 2-->
                        <a href="<%=request.getContextPath()%>/listactivity">
                            <div class="feature-card">
                                <img src="images/conservationactivitiesicon.png" alt="">
                                <div class="info">
                                    <h3>Conservation Activities</h3>
                                </div>
                            </div>
                        </a>

                    </div>

                    <div class="right">

                        <!--card 4-->
                        <a href="News.jsp">
                            <div class="feature-card">
                                <img src="images/marinenewsicon.png" alt="">
                                <div class="info">
                                    <h3>Marine News</h3>
                                </div>
                            </div>
                        </a>

                        <!--card 5-->
                        <a href="<%=request.getContextPath()%>/listresearchers">
                            <div class="feature-card">
                                <img src="images/researchersnetworkicon.png" alt="">
                                <div class="info">
                                    <h3>Researchers Network</h3>
                                </div>
                            </div>
                        </a>

                    </div>

                </div>
            </div>
        </section>
        <!-- End of features section -->

        <!--begin of social section-->
        <section class="social-section">
            <div class="wrapper">
                <h2>Our Social Platfrom</h2>
                <p>Connect with us now</p>

                <div class="social-buttons">
                    <a href="https://www.instagram.com/inos_umt/">
                        <div class="social-btn">
                            <img src="images/Insta Icon.svg">
                            <span>Instagram</span>
                        </div>
                    </a>

                    <a href="https://www.facebook.com/inosumt/?locale=ms_MY">
                        <div class="social-btn">
                            <img src="images/Facebook Icon.svg">
                            <span>Facebook</span>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <!-- End of social section -->

        <!--include footer-->
        <jsp:include page="footer.jsp" />

        <!--include JavaScript-->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
