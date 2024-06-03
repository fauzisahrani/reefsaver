<%-- 
    Document   : index
    Created on : 13 May 2024, 3:01:48 pm
    Author     : Pojie
--%>

<!doctype html>
<html lang="en">

    <head>
        <!-- specifies the character encoding -->
        <meta charset="UTF-8">
        <!-- sets the width of the viewport to the width of the device screen -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reef Saver</title>
        <!-- preload google fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!-- import Poppins and Raleway from google fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <!-- import stylesheet -->
        <style><%@ include file="css/stylenews.css"%></style>
    </head>

    <body>
        <header>
            <nav>
                <div class="logo">ReefSaver</div>

                <ul>
                    <li><a href="Homepage.jsp">Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/listbiodiversity">Coral Biodiversity</a></li>
                    <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activities</a></li>
                    <li>
                        <input type="hidden" id="newsQuery">
                        <!--Need the input field because news APi cannot search news about coral--> 
                        <a href="#" class="btn light" id="searchBtn">News</a>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                    <li><a href="<%=request.getContextPath()%>/listuser">User</a></li>
                    <li><a href="UserProfile.jsp">Profile</a></li>
                    <li><a href="LoginForm.jsp">Log Out</a></li>
                </ul>
            </nav>
            <!-- End of Desktop Navigation Menu-->
            <section class="news-section">
                <div>
                    <div id="newsType"></div>
                    <div id="newsdetails"></div>
                </div>
            </section>

            <a href="#" class="to-top">
                <p class="">^</p>
            </a>
    </body>
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
    <script src="js/news.js"></script>

</html>
