<%-- 
   Document   : userList
   Created on : 19 Jun 2023, 10:33:54 pm
   Author     : Pojie
   this jsp used to display all user records
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@300;900&display=swap"
              rel="stylesheet">
        <style>
            <%@ include file="css/styleuser.css"%>
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
                        <li><a href="<%=request.getContextPath()%>/listresearchers">Researchers</a></li>
                        <li><a href="<%=request.getContextPath()%>/listuser" class="btn light">User</a></li>
                        <li><a href="UserProfile.jsp">Profile</a></li>
                        <li><a href="LoginForm.jsp">Log Out</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Category</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUser}">
                            <tr>
                                <td>
                                    <c:out value="${user.userID}"/>
                                </td>
                                <td>
                                    <c:out value="${user.userName}"/>
                                </td>
                                <td>
                                    <c:out value="${user.userEmail}"/>
                                </td>
                                <td>
                                    <input class="userlistpassword" type="password" value="${user.userPassword}" readonly style="border: none; background: none;">
                                </td>
                                <td>
                                    <c:out value="${user.userType}"/>
                                </td>
                                <td>
                                    <a class="button"href="edit?userID=<c:out value='${user.userID}'/>">Edit</a> 
                                    <script>
                                        function deleteUser(userId) {
                                            if (confirm("Are you sure you want to delete this user?")) {
                                                window.location.href = "delete?userID=" + userId;
                                            }
                                        }
                                    </script>
                                    <a class="button" onclick="deleteUser('<c:out value='${user.userID}'/>')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
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
