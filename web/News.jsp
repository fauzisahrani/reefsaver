<%-- 
    Document   : index
    Created on : 13 May 2024, 3:01:48 pm
    Author     : Pojie
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <style><%@ include file="css/styleNews.css"%></style>
    </head>

    <body>
        <header>
            <nav>
                <div class="logo">Reef Saver</div>

                <ul>
                    <li><a href="Homepage.jsp">Home</a></li>
                    <li><a href="<%=request.getContextPath()%>/BiodiversityLanding.jsp">Coral Reefs Data</a></li>
                    <li><a href="<%=request.getContextPath()%>/listactivity">Conservation Activity</a></li>
                    <li>
                        <input type="hidden" id="newsQuery">
                        <!-- Need the input field because news API cannot search news about coral -->
                        <a href="#" class="btn light" id="searchBtn">News</a>
                        <!-- Placeholder for "Fetching latest coral news" message -->
                        <span id="loadingMessage" style="display: none;">Fetching latest coral news...</span>
                    </li>
                    <script>
                        // Function to simulate a click on the "News" button
                        window.onload = function () {
                            document.getElementById("searchBtn").click();
                        };
                    </script>
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

    <!--include footer-->
    <jsp:include page="footer.jsp" />

    <!--include Javascript-->
    <script src="js/news.js"></script>

</html>
