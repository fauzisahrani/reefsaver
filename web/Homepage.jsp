<%-- 
    Document   : index
    Created on : 22 Jun 2023, 2:52:08 pm
    Author     : Pojie
--%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ReefSaver</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style><%@ include file="css/homepagecss.css"%></style>
    </head>

    <body>
        <header>
            <div class="wrapper">
                <nav>
                    <div class="logo">ReefSaver</div>
                    <ul>
                        <li><a href="Homepage.jsp" class="btn light">Home</a></li>                        
                        <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Reefs Data</a></li>
                        <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
                        <li><a href="News.jsp">News</a></li>
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listUser">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
                <!-- End of Desktop Navigation Menu-->
                <div class="reefs-section">
                    <div class="left">
                        <h1>Discover the Reefs</h1>
                        <p>The world's finest wilderness lies beneath the waves. Together we protect the beauty of marine
                            nature</p>
                        <a href="#features" class="btn light">Explore</a>
                    </div>
                    <div class="right">
                        <img src="images/Coral Icon.png" alt="">
                    </div>
                    <div class="achievement-cards">
                        <div class="achievement-card student-enrolled">
                            <div class="content">
                                <div class="country">
                                    <h3>Malaysia</h3>
                                </div>
                            </div>
                        </div>

                        <div class="achievement-card overall-rating">
                            <div class="content">
                                <h3>Coral reefs support 25% of all marine life</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- End of the header section -->

        <section class="testimonials-section">
            <div class="wrapper">
                <div class="left">
                    <div class="testimonial-card">
                        <div class="content">
                            This is a great platform. It helped me to learn new knowledge from different field
                        </div>

                        <div class="info">
                            <h4>Fauzi Sahrani</h4>
                            <p class="company">Software Engineering Students</p>
                        </div>
                        <img src="images/fauziprofile.JPG" alt=""/>
                    </div>

                    <div class="testimonial-card">
                        <div class="content">This platform help me collaborate with other researchers</div>

                        <div class="info">
                            <h4>Dr. Sharifah Mashita</h4>
                            <p class="company">Computer Science Researchers</p>
                        </div>
                        <img src="images/drSharifahMashita.jpg" alt=""/>
                    </div>

                    <div class="testimonial-card">
                        <div class="content">
                            This platform makes my research tasks easier
                        </div>

                        <div class="info">
                            <h4>Dr. Tengku Fara Kamilia</h4>
                            <p class="company">Reefs Researchers</p>
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
    </div>

    <!-- End of testimonial Section -->

    <!-- start of features-section -->
    <section class="features-section" id="features">
        <div class="wrapper">
            <h2 class="light">Highlight Features</h2>
            <div class="feature-cards">

                <div class="left">
                    <a href="<%=request.getContextPath()%>/listbiodiversity">
                        <div class="feature-card">
                            <img src="images/biodiversityicon.png" alt="">
                            <div class="info">
                                <h3>Coral Biodiversity</h3>
                            </div>
                        </div>
                    </a>

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
                    <a href="News.jsp">
                        <div class="feature-card">
                            <img src="images/marinenewsicon.png" alt="">
                            <div class="info">
                                <h3>Marine News</h3>
                            </div>
                        </div>
                    </a>

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

    <section class="app-section">
        <div class="wrapper">
            <h2>Our Social Platfrom</h2>
            <p>Connect with us now</p>

            <div class="app-buttons">
                <div class="app-btn">
                    <img src="images/Insta Icon.svg">
                    <span>Instagram</span>
                </div>

                <div class="app-btn">
                    <img src="images/Facebook Icon.svg">
                    <span>Facebook</span>
                </div>
            </div>
        </div>
    </section>
    <a href="#" class="to-top">
        <p class="">^</p>
    </a>
    <!-- End of app section -->

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
